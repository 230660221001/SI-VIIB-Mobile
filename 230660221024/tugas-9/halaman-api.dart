import 'package:flutter/material.dart';

import 'service-api.dart'; // Import file service di atas

class HalamanApi extends StatefulWidget {
  const HalamanApi({super.key});

  @override
  State<HalamanApi> createState() => _HalamanApiState();
}

class _HalamanApiState extends State<HalamanApi> {
  bool _sedangMemuat = true;
  String? _pesanError;
  List<DataKegiatan> _daftar = [];

  @override
  void initState() {
    super.initState();
    _muatData();
  }

  Future<void> _muatData() async {
    setState(() {
      _sedangMemuat = true;
      _pesanError = null;
    });
    try {
      final hasil = await KegiatanService.ambilDaftar();
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

  Future<void> _bukaForm() async {
    final berhasil = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (context) => const FormTambahKegiatan()),
    );
    if (berhasil == true) {
      await _muatData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Absensi Organisasi (API)'),
        actions: [
          IconButton(onPressed: _muatData, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: _buildKonten(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _bukaForm,
        icon: const Icon(Icons.add),
        label: const Text('Tambah Kegiatan'),
      ),
    );
  }

  Widget _buildKonten() {
    if (_sedangMemuat) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_pesanError != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.cloud_off, size: 48, color: Colors.red),
            const SizedBox(height: 12),
            Text(
              _pesanError!,
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
      );
    }
    if (_daftar.isEmpty) {
      return const Center(child: Text('Data kosong.'));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: _daftar.length,
      itemBuilder: (context, index) {
        final item = _daftar[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.event)),
            title: Text(item.nama),
            subtitle: Text(item.tanggal),
            trailing: Chip(label: Text(item.status)),
          ),
        );
      },
    );
  }
}

class FormTambahKegiatan extends StatefulWidget {
  const FormTambahKegiatan({super.key});

  @override
  State<FormTambahKegiatan> createState() => _FormTambahKegiatanState();
}

class _FormTambahKegiatanState extends State<FormTambahKegiatan> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _tanggalController = TextEditingController();
  bool _sedangKirim = false;

  @override
  void dispose() {
    _namaController.dispose();
    _tanggalController.dispose();
    super.dispose();
  }

  Future<void> _kirim() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _sedangKirim = true);

    try {
      await KegiatanService.tambahKegiatan(
        nama: _namaController.text.trim(),
        tanggal: _tanggalController.text.trim(),
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kegiatan berhasil dikirim ke server!')),
      );
      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;
      setState(() => _sedangKirim = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Kegiatan')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Kegiatan',
                border: OutlineInputBorder(),
              ),
              validator: (v) =>
                  v == null || v.trim().isEmpty ? 'Wajib diisi' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _tanggalController,
              decoration: const InputDecoration(
                labelText: 'Tanggal',
                border: OutlineInputBorder(),
              ),
              validator: (v) =>
                  v == null || v.trim().isEmpty ? 'Wajib diisi' : null,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _sedangKirim ? null : _kirim,
              icon: _sedangKirim
                  ? const CircularProgressIndicator()
                  : const Icon(Icons.send),
              label: Text(_sedangKirim ? 'Mengirim...' : 'Simpan ke Server'),
            ),
          ],
        ),
      ),
    );
  }
}
