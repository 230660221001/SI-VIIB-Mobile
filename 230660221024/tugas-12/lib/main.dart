import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HalamanFormAbsensi(),
    ),
  );
}

class HalamanFormAbsensi extends StatefulWidget {
  const HalamanFormAbsensi({super.key});

  @override
  State<HalamanFormAbsensi> createState() => _HalamanFormAbsensiState();
}

class _HalamanFormAbsensiState extends State<HalamanFormAbsensi> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _kegiatanController = TextEditingController();

  String _statusValidasi = 'Belum divalidasi.';

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _kegiatanController.dispose();
    super.dispose();
  }

  void _simpanData() {
    if (!_formKey.currentState!.validate()) {
      setState(() {
        _statusValidasi = 'Input belum valid. Periksa kembali form.';
      });
      return;
    }
    setState(() {
      _statusValidasi = 'Input valid! Siap dikirim ke server.';
    });
    // Di sini logika HTTP POST akan diletakkan pada implementasi nyata
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Absensi (Validasi)')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // VALIDATOR 1: Nama Anggota
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Anggota',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                final nama = value?.trim() ?? '';
                if (nama.isEmpty) return 'Nama wajib diisi.';
                if (nama.length > 50) return 'Nama maksimal 50 karakter.';
                return null;
              },
            ),
            const SizedBox(height: 16),

            // VALIDATOR 2: NIM (Hanya Angka)
            TextFormField(
              controller: _nimController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'NIM',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                final nim = value?.trim() ?? '';
                if (nim.isEmpty) return 'NIM wajib diisi.';
                // Cek apakah semua karakter adalah angka
                if (!RegExp(r'^[0-9]+$').hasMatch(nim)) {
                  return 'NIM hanya boleh berisi angka.';
                }
                if (nim.length != 12) return 'NIM harus 12 digit.';
                return null;
              },
            ),
            const SizedBox(height: 16),

            // VALIDATOR 3: Nama Kegiatan
            TextFormField(
              controller: _kegiatanController,
              decoration: const InputDecoration(
                labelText: 'Nama Kegiatan',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                final kegiatan = value?.trim() ?? '';
                if (kegiatan.isEmpty) return 'Nama kegiatan wajib diisi.';
                if (kegiatan.length < 5)
                  return 'Nama kegiatan minimal 5 karakter.';
                return null;
              },
            ),
            const SizedBox(height: 24),

            FilledButton.icon(
              onPressed: _simpanData,
              icon: const Icon(Icons.check),
              label: const Text('Simpan Absensi'),
            ),
            const SizedBox(height: 20),

            // Menampilkan status hasil validasi
            Text(
              _statusValidasi,
              style: TextStyle(
                color: _statusValidasi.contains('valid!')
                    ? Colors.green
                    : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
