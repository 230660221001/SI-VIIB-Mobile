// ============================================================================
// PAB — Tugas 7: MVP Awal dengan Data Lokal (CRUD)
// Domain   : Aplikasi Absensi Organisasi Mahasiswa
// ============================================================================
import 'package:flutter/material.dart';

void main() {
  runApp(const AbsensiApp());
}

// --- MODEL DATA ---
class DataKegiatan {
  const DataKegiatan({
    required this.id,
    required this.nama,
    required this.tanggal,
    required this.lokasi,
    required this.status,
  });

  final String id;
  final String nama;
  final String tanggal;
  final String lokasi;
  final String status;

  @override
  String toString() => 'Kegiatan $nama — $tanggal';
}

class AbsensiApp extends StatelessWidget {
  const AbsensiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Absensi Organisasi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HalamanDaftarKegiatan(),
    );
  }
}

// --- LAYAR UTAMA (STATE) ---
class HalamanDaftarKegiatan extends StatefulWidget {
  const HalamanDaftarKegiatan({super.key});

  @override
  State<HalamanDaftarKegiatan> createState() => _HalamanDaftarKegiatanState();
}

class _HalamanDaftarKegiatanState extends State<HalamanDaftarKegiatan> {
  // State: Daftar data kegiatan
  final List<DataKegiatan> _daftar = [];

  // CREATE: Membuka form dan menambah data
  Future<void> _bukaFormTambah() async {
    final hasil = await Navigator.push<DataKegiatan>(
      context,
      MaterialPageRoute(builder: (context) => const FormTambahKegiatan()),
    );

    if (hasil != null) {
      setState(() {
        _daftar.add(hasil);
      });
    }
  }

  // UPDATE: Mengubah status kegiatan
  void _ubahStatus(String id, String statusBaru) {
    setState(() {
      final index = _daftar.indexWhere((k) => k.id == id);
      if (index != -1) {
        final lama = _daftar[index];
        _daftar[index] = DataKegiatan(
          id: lama.id,
          nama: lama.nama,
          tanggal: lama.tanggal,
          lokasi: lama.lokasi,
          status: statusBaru,
        );
      }
    });
  }

  // DELETE: Konfirmasi dan Hapus kegiatan
  Future<void> _hapusKegiatan(DataKegiatan kegiatan) async {
    final yakin = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Kegiatan?'),
        content: Text('Kegiatan "${kegiatan.nama}" akan dihapus permanen.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (yakin == true) {
      setState(() {
        _daftar.removeWhere((k) => k.id == kegiatan.id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Kegiatan (CRUD)')),
      // READ: Menampilkan data dari State
      body: _daftar.isEmpty
          ? const Center(child: Text('Belum ada data kegiatan.'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _daftar.length,
              itemBuilder: (context, index) {
                final kegiatan = _daftar[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.event)),
                    title: Text(kegiatan.nama),
                    subtitle: Text('${kegiatan.tanggal} • ${kegiatan.lokasi}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ChipStatus(status: kegiatan.status),
                        PopupMenuButton<String>(
                          onSelected: (value) {
                            if (value == 'dibuka')
                              _ubahStatus(kegiatan.id, 'Dibuka');
                            if (value == 'ditutup')
                              _ubahStatus(kegiatan.id, 'Ditutup');
                            if (value == 'hapus') _hapusKegiatan(kegiatan);
                          },
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 'dibuka',
                              child: Text('Buka Sesi'),
                            ),
                            const PopupMenuItem(
                              value: 'ditutup',
                              child: Text('Tutup Sesi'),
                            ),
                            const PopupMenuItem(
                              value: 'hapus',
                              child: Text(
                                'Hapus',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _bukaFormTambah,
        icon: const Icon(Icons.add),
        label: const Text('Tambah Kegiatan'),
      ),
    );
  }
}

// --- LAYAR FORM (CREATE) ---
class FormTambahKegiatan extends StatefulWidget {
  const FormTambahKegiatan({super.key});

  @override
  State<FormTambahKegiatan> createState() => _FormTambahKegiatanState();
}

class _FormTambahKegiatanState extends State<FormTambahKegiatan> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _tanggalController = TextEditingController();
  final _lokasiController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _tanggalController.dispose();
    _lokasiController.dispose();
    super.dispose();
  }

  void _simpan() {
    if (_formKey.currentState!.validate()) {
      final kegiatanBaru = DataKegiatan(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        nama: _namaController.text.trim(),
        tanggal: _tanggalController.text.trim(),
        lokasi: _lokasiController.text.trim(),
        status: 'Belum Dibuka',
      );
      Navigator.pop(context, kegiatanBaru); // Kembali membawa data
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
            const SizedBox(height: 12),
            TextFormField(
              controller: _lokasiController,
              decoration: const InputDecoration(
                labelText: 'Lokasi',
                border: OutlineInputBorder(),
              ),
              validator: (v) =>
                  v == null || v.trim().isEmpty ? 'Wajib diisi' : null,
            ),
            const SizedBox(height: 24),
            FilledButton(onPressed: _simpan, child: const Text('Simpan')),
          ],
        ),
      ),
    );
  }
}

// --- WIDGET BANTUAN ---
class ChipStatus extends StatelessWidget {
  const ChipStatus({super.key, required this.status});
  final String status;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDibuka = status == 'Dibuka';
    final isDitutup = status == 'Ditutup';

    Color bg = colorScheme.secondaryContainer;
    Color fg = colorScheme.onSecondaryContainer;

    if (isDibuka) {
      bg = colorScheme.tertiaryContainer;
      fg = colorScheme.onTertiaryContainer;
    } else if (isDitutup) {
      bg = colorScheme.errorContainer;
      fg = colorScheme.onErrorContainer;
    }

    return Chip(
      label: Text(status, style: TextStyle(fontSize: 10, color: fg)),
      backgroundColor: bg,
      visualDensity: VisualDensity.compact,
    );
  }
}
