
import 'package:flutter/material.dart';

void main() {
  runApp(const SipuskamCrudApp());
}

// MODEL DATA BUKU
class DataBuku {
  const DataBuku({
    required this.id,
    required this.judul,
    required this.penulis,
    required this.kategori,
    required this.status,
  });

  final String id;
  final String judul;
  final String penulis;
  final String kategori;
  final String status;

  @override
  String toString() => '$judul — $penulis';
}

// APLIKASI
class SipuskamCrudApp extends StatelessWidget {
  const SipuskamCrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIPUSKAM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0),
        ),
      ),
      home: const HalamanDaftarBuku(),
    );
  }
}

// HALAMAN DAFTAR DAN CRUD
class HalamanDaftarBuku extends StatefulWidget {
  const HalamanDaftarBuku({super.key});

  @override
  State<HalamanDaftarBuku> createState() =>
      _HalamanDaftarBukuState();
}

class _HalamanDaftarBukuState
    extends State<HalamanDaftarBuku> {
  final List<DataBuku> _daftar = [
    const DataBuku(
      id: 'B001',
      judul: 'Pemrograman Dart',
      penulis: 'Andi Saputra',
      kategori: 'Pemrograman',
      status: 'Tersedia',
    ),
    const DataBuku(
      id: 'B002',
      judul: 'Sistem Informasi',
      penulis: 'Budi Raharjo',
      kategori: 'Sistem Informasi',
      status: 'Tersedia',
    ),
    const DataBuku(
      id: 'B003',
      judul: 'Basis Data',
      penulis: 'Siti Aminah',
      kategori: 'Basis Data',
      status: 'Dipinjam',
    ),
  ];

  final _formKey = GlobalKey<FormState>();
  final _judulController = TextEditingController();
  final _penulisController = TextEditingController();
  final _kategoriController = TextEditingController();

  @override
  void dispose() {
    _judulController.dispose();
    _penulisController.dispose();
    _kategoriController.dispose();
    super.dispose();
  }

  // CREATE: tambah buku
  void _tambahBuku() {
    _judulController.clear();
    _penulisController.clear();
    _kategoriController.clear();

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Tambah Buku'),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _judulController,
                    decoration: const InputDecoration(
                      labelText: 'Judul Buku',
                    ),
                    validator: (value) =>
                        value == null || value.trim().isEmpty
                            ? 'Judul wajib diisi'
                            : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _penulisController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Penulis',
                    ),
                    validator: (value) =>
                        value == null || value.trim().isEmpty
                            ? 'Penulis wajib diisi'
                            : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _kategoriController,
                    decoration: const InputDecoration(
                      labelText: 'Kategori',
                    ),
                    validator: (value) =>
                        value == null || value.trim().isEmpty
                            ? 'Kategori wajib diisi'
                            : null,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pop(dialogContext),
              child: const Text('Batal'),
            ),
            FilledButton(
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }

                final bukuBaru = DataBuku(
                  id: DateTime.now()
                      .microsecondsSinceEpoch
                      .toString(),
                  judul: _judulController.text.trim(),
                  penulis: _penulisController.text.trim(),
                  kategori: _kategoriController.text.trim(),
                  status: 'Tersedia',
                );

                setState(() {
                  _daftar.add(bukuBaru);
                });

                Navigator.pop(dialogContext);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Buku berhasil ditambahkan'),
                  ),
                );
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  // UPDATE: ubah status buku berdasarkan ID
  void _ubahStatus(DataBuku buku) {
    final statusBaru =
        buku.status == 'Tersedia' ? 'Dipinjam' : 'Tersedia';

    setState(() {
      final index =
          _daftar.indexWhere((item) => item.id == buku.id);

      if (index != -1) {
        _daftar[index] = DataBuku(
          id: buku.id,
          judul: buku.judul,
          penulis: buku.penulis,
          kategori: buku.kategori,
          status: statusBaru,
        );
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Status buku menjadi $statusBaru'),
      ),
    );
  }

  // DELETE: konfirmasi sebelum menghapus
  Future<void> _konfirmasiHapus(DataBuku buku) async {
    final yakin = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Hapus Buku?'),
        content: Text(
          'Apakah buku "${buku.judul}" ingin dihapus?',
        ),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.pop(dialogContext, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () =>
                Navigator.pop(dialogContext, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (!mounted || yakin != true) return;

    setState(() {
      _daftar.removeWhere((item) => item.id == buku.id);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Buku berhasil dihapus')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SIPUSKAM'),
            Text(
              'Pengelolaan Data Buku',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      body: _daftar.isEmpty
          ? const Center(child: Text('Belum ada data buku'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _daftar.length,
              itemBuilder: (context, index) {
                final buku = _daftar[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.menu_book),
                      ),
                      title: Text(
                        buku.judul,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text('Penulis: ${buku.penulis}'),
                          Text('Kategori: ${buku.kategori}'),
                          Text(
                            'Status: ${buku.status}',
                            style: TextStyle(
                              color: buku.status == 'Tersedia'
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      isThreeLine: true,
                      trailing: PopupMenuButton<String>(
                        onSelected: (aksi) {
                          if (aksi == 'ubah') {
                            _ubahStatus(buku);
                          } else if (aksi == 'hapus') {
                            _konfirmasiHapus(buku);
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'ubah',
                            child: Text('Ubah Status'),
                          ),
                          const PopupMenuItem(
                            value: 'hapus',
                            child: Text('Hapus Buku'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _tambahBuku,
        icon: const Icon(Icons.add),
        label: const Text('Tambah Buku'),
      ),
    );
  }
}
