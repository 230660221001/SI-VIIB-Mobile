// halaman-api.dart
//
// Antarmuka yang mengonsumsi LaboratoriumService.
// Menangani: loading, sukses, error (+ tombol Coba Lagi),
// dan form POST dengan tombol yang dinonaktifkan saat mengirim.

import 'package:flutter/material.dart';

import 'service-api.dart';

class HalamanApi extends StatefulWidget {
  const HalamanApi({super.key});

  @override
  State<HalamanApi> createState() => _HalamanApiState();
}

class _HalamanApiState extends State<HalamanApi> {
  // ---- State daftar ----
  bool _sedangMemuat = false;
  String? _pesanError;
  List<DataPengajuan> _daftar = [];

  // ---- State form ----
  final _formKey = GlobalKey<FormState>();
  final _ruangController = TextEditingController();
  final _keteranganController = TextEditingController();
  bool _sedangMengirim = false;

  @override
  void initState() {
    super.initState();
    _muatData(); // muat saat halaman pertama kali dibuka
  }

  @override
  void dispose() {
    _ruangController.dispose();
    _keteranganController.dispose();
    super.dispose();
  }

  /// Memuat daftar dari service. Menangani loading, sukses, error.
  Future<void> _muatData() async {
    setState(() {
      _sedangMemuat = true;
      _pesanError = null;
    });

    try {
      final hasil = await LaboratoriumService.ambilDaftar();
      if (!mounted) return;
      setState(() {
        _daftar = hasil;
        _sedangMemuat = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _pesanError = e.toString().replaceFirst('Exception: ', '');
        _sedangMemuat = false;
      });
    }
  }

  /// Mengirim data baru lewat POST.
  Future<void> _kirimPengajuan() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _sedangMengirim = true);

    try {
      final dataBaru = DataPengajuanBaru(
        ruang: _ruangController.text.trim(),
        keterangan: _keteranganController.text.trim(),
        pemohonId: 1,
      );

      await LaboratoriumService.kirimPengajuan(dataBaru);

      if (!mounted) return;
      _ruangController.clear();
      _keteranganController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pengajuan berhasil dikirim.')),
      );

      // Catatan: jsonplaceholder tidak mempersistensi data POST,
      // sehingga reload tidak akan menampilkan item baru. Pada backend
      // nyata, panggil `_muatData()` di sini agar daftar ter-update.
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Gagal mengirim: ${e.toString().replaceFirst('Exception: ', '')}',
          ),
          backgroundColor: Colors.red.shade700,
        ),
      );
    } finally {
      if (mounted) setState(() => _sedangMengirim = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengajuan Laboratorium')),
      body: Column(
        children: [
          _bangunForm(),
          const Divider(height: 1),
          Expanded(child: _bangunKonten()),
        ],
      ),
    );
  }

  // ==========================================================
  // FORM (POST)
  // ==========================================================
  Widget _bangunForm() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _ruangController,
              decoration: const InputDecoration(
                labelText: 'Nama Ruang',
                border: OutlineInputBorder(),
              ),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Wajib diisi' : null,
              enabled: !_sedangMengirim,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _keteranganController,
              decoration: const InputDecoration(
                labelText: 'Keterangan / Keperluan',
                border: OutlineInputBorder(),
              ),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Wajib diisi' : null,
              enabled: !_sedangMengirim,
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                // Tombol dinonaktifkan (onPressed: null) selama proses kirim
                // berlangsung → mencegah pengiriman ganda.
                onPressed: _sedangMengirim ? null : _kirimPengajuan,
                icon: _sedangMengirim
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.send),
                label: Text(
                  _sedangMengirim ? 'Mengirim...' : 'Kirim Pengajuan',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // DAFTAR — 3 KONDISI (loading / error+retry / sukses)
  // ==========================================================
  Widget _bangunKonten() {
    // 1. LOADING
    if (_sedangMemuat) {
      return const Center(child: CircularProgressIndicator());
    }

    // 2. ERROR + tombol Coba Lagi
    if (_pesanError != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.cloud_off, size: 48, color: Colors.red),
              const SizedBox(height: 12),
              Text(
                'Gagal memuat data:\n$_pesanError',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: _muatData,
                icon: const Icon(Icons.refresh),
                label: const Text('Coba Lagi'),
              ),
            ],
          ),
        ),
      );
    }

    // 3. KOSONG
    if (_daftar.isEmpty) {
      return const Center(child: Text('Belum ada data pengajuan.'));
    }

    // 4. SUKSES
    return ListView.builder(
      itemCount: _daftar.length,
      itemBuilder: (context, index) {
        final item = _daftar[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ListTile(
            leading: CircleAvatar(child: Text('${item.id}')),
            title: Text(item.ruang),
            subtitle: Text(item.keterangan),
            trailing: Chip(label: Text(item.status)),
          ),
        );
      },
    );
  }
}