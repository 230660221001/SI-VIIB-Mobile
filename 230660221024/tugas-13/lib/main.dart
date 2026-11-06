import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HalamanAbsensi(),
    ),
  );
}

class HalamanAbsensi extends StatefulWidget {
  const HalamanAbsensi({super.key});

  @override
  State<HalamanAbsensi> createState() => _HalamanAbsensiState();
}

class _HalamanAbsensiState extends State<HalamanAbsensi> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _kegiatanController = TextEditingController();

  bool _sedangMenyimpan = false;
  String _status = 'Belum ada data.';

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _kegiatanController.dispose();
    super.dispose();
  }

  Future<void> _simpan() async {
    if (!_formKey.currentState!.validate()) {
      setState(() => _status = 'Input belum valid.');
      return;
    }

    // PERBAIKAN BUG: Cegah eksekusi ganda
    if (_sedangMenyimpan) return;

    setState(() {
      _sedangMenyimpan = true;
      _status = 'Memproses data...';
    });

    // Simulasi pengiriman ke API (jeda 1 detik)
    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;
    setState(() {
      _sedangMenyimpan = false;
      _status = 'Data atas nama ${_namaController.text} berhasil disimpan.';
      // Kosongkan form setelah simpan
      _namaController.clear();
      _nimController.clear();
      _kegiatanController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Absensi + Testing')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Anggota',
                border: OutlineInputBorder(),
              ),
              validator: (v) =>
                  v == null || v.trim().isEmpty ? 'Nama wajib diisi' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _nimController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'NIM',
                border: OutlineInputBorder(),
              ),
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'NIM wajib diisi';
                if (!RegExp(r'^[0-9]+$').hasMatch(v))
                  return 'NIM hanya boleh angka';
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _kegiatanController,
              decoration: const InputDecoration(
                labelText: 'Nama Kegiatan',
                border: OutlineInputBorder(),
              ),
              validator: (v) =>
                  v == null || v.trim().isEmpty ? 'Kegiatan wajib diisi' : null,
            ),
            const SizedBox(height: 24),
            FilledButton(
              // Tombol dinonaktifkan (null) jika _sedangMenyimpan bernilai true
              onPressed: _sedangMenyimpan ? null : _simpan,
              child: Text(_sedangMenyimpan ? 'Menyimpan...' : 'Simpan Absensi'),
            ),
            const SizedBox(height: 20),
            Text(_status, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
