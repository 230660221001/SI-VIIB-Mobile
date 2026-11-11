import 'package:flutter/material.dart';
import 'service-api.dart';

class HalamanPesanan extends StatefulWidget {
  const HalamanPesanan({super.key});

  @override
  State<HalamanPesanan> createState() => _HalamanPesananState();
}

class _HalamanPesananState extends State<HalamanPesanan> {
  // State untuk tiga kondisi antarmuka
  bool _sedangMemuat = true;
  String? _pesanError;
  List<DataPesanan> _daftarPesanan = [];

  @override
  void initState() {
    super.initState();
    _muatData();
  }

  // Fungsi memuat data (GET)
  Future<void> _muatData() async {
    setState(() {
      _sedangMemuat = true;
      _pesanError = null;
    });

    try {
      final hasil = await PesananService.ambilDaftarPesanan();
      if (!mounted) return;
      setState(() {
        _daftarPesanan = hasil;
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

  // Fungsi membuka form kirim data (POST)
  Future<void> _bukaForm() async {
    final berhasil = await Navigator.push<bool>(
      context,
      MaterialPageRoute<bool>(builder: (context) => const FormPesanan()),
    );
    if (berhasil == true) {
      await _muatData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pesanan BSM'),
        actions: [
          IconButton(
            onPressed: _muatData,
            icon: const Icon(Icons.refresh),
            tooltip: 'Muat ulang',
          ),
        ],
      ),
      body: _bangunKonten(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _bukaForm,
        icon: const Icon(Icons.add),
        label: const Text('Pesan Baru'),
      ),
    );
  }

  Widget _bangunKonten() {
    // Kondisi 1: Loading
    if (_sedangMemuat) {
      return const Center(child: CircularProgressIndicator());
    }

    // Kondisi 2: Error
    if (_pesanError != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cloud_off, size: 48, color: Colors.redAccent),
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
        ),
      );
    }

    // Kondisi 3: Kosong
    if (_daftarPesanan.isEmpty) {
      return const Center(child: Text('Belum ada pesanan.'));
    }

    // Kondisi 4: Sukses
    return RefreshIndicator(
      onRefresh: _muatData,
      child: ListView.builder(
        itemCount: _daftarPesanan.length,
        itemBuilder: (context, index) {
          final pesanan = _daftarPesanan[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: const Icon(Icons.rice_bowl_outlined),
              title: Text(pesanan.namaPemesan),
              subtitle: Text(pesanan.alamat),
              trailing: Chip(label: Text(pesanan.status)),
            ),
          );
        },
      ),
    );
  }
}

// ==========================================
// HALAMAN FORM (Untuk Mengirim Data / POST)
// ==========================================
class FormPesanan extends StatefulWidget {
  const FormPesanan({super.key});

  @override
  State<FormPesanan> createState() => _FormPesananState();
}

class _FormPesananState extends State<FormPesanan> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _alamatController = TextEditingController();
  bool _sedangMengirim = false;

  @override
  void dispose() {
    _namaController.dispose();
    _alamatController.dispose();
    super.dispose();
  }

  Future<void> _kirim() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() { _sedangMengirim = true; });

    try {
      await PesananService.kirimPesanan(
        namaPemesan: _namaController.text.trim(),
        alamat: _alamatController.text.trim(),
      );

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pesanan berhasil dikirim.')),
      );
      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;
      setState(() { _sedangMengirim = false; });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString().replaceFirst('Exception: ', '')),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Pesanan Baru')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Pemesan',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => (value == null || value.trim().isEmpty) 
                    ? 'Nama wajib diisi.' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _alamatController,
                decoration: const InputDecoration(
                  labelText: 'Alamat Pengiriman',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => (value == null || value.trim().isEmpty) 
                    ? 'Alamat wajib diisi.' : null,
              ),
              const SizedBox(height: 20),
              FilledButton.icon(
                onPressed: _sedangMengirim ? null : _kirim,
                icon: _sedangMengirim
                    ? const SizedBox(
                        width: 18, height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : const Icon(Icons.send),
                label: Text(_sedangMengirim ? 'Mengirim...' : 'Kirim Pesanan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}