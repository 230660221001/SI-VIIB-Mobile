import 'package:flutter/material.dart';

void main() {
  runApp(const CeriaReadsApp());
}

class DataPengajuan {
  final String id;
  final String judulBuku;
  final String namaPeminjam;
  final int durasiHari;
  final String status;

  const DataPengajuan({
    required this.id,
    required this.judulBuku,
    required this.namaPeminjam,
    required this.durasiHari,
    required this.status,
  });

  @override
  String toString() => 'Pengajuan $judulBuku oleh $namaPeminjam';
}

class CeriaReadsApp extends StatelessWidget {
  const CeriaReadsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CeriaReads CRUD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4F46E5)),
        scaffoldBackgroundColor: const Color(0xFFF1F5F9),
      ),
      home: const HalamanDaftarPengajuan(),
    );
  }
}

class HalamanDaftarPengajuan extends StatefulWidget {
  const HalamanDaftarPengajuan({super.key});

  @override
  State<HalamanDaftarPengajuan> createState() => _HalamanDaftarPengajuanState();
}

class _HalamanDaftarPengajuanState extends State<HalamanDaftarPengajuan> {
  final _daftarPengajuan = [];

  // ==========================================
  // OPERASI CREATE & UPDATE (FORM MODAL)
  // ==========================================
  void _tampilkanForm([DataPengajuan? dataLama]) {
    final formKey = GlobalKey<FormState>();
    final judulController = TextEditingController(text: dataLama?.judulBuku ?? '');
    final namaController = TextEditingController(text: dataLama?.namaPeminjam ?? '');
    final durasiController = TextEditingController(text: dataLama?.durasiHari.toString() ?? '');

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 24, right: 24, top: 24,
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  dataLama == null ? 'Pengajuan Baru' : 'Ubah Pengajuan',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: judulController,
                  decoration: const InputDecoration(labelText: 'Judul Buku', border: OutlineInputBorder()),
                  validator: (val) => val == null || val.trim().isEmpty ? 'Wajib diisi' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: namaController,
                  decoration: const InputDecoration(labelText: 'Nama Peminjam', border: OutlineInputBorder()),
                  validator: (val) => val == null || val.trim().isEmpty ? 'Wajib diisi' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: durasiController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Durasi (Hari)', border: OutlineInputBorder()),
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) return 'Wajib diisi';
                    if (int.tryParse(val.trim()) == null) return 'Harus berupa angka';
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: () {
                    if (!formKey.currentState!.validate()) return;
                    
                    final dataBaru = DataPengajuan(
                      id: dataLama?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
                      judulBuku: judulController.text.trim(),
                      namaPeminjam: namaController.text.trim(),
                      durasiHari: int.parse(durasiController.text.trim()),
                      status: 'Menunggu',
                    );

                    setState(() {
                      if (dataLama == null) {
                        // CREATE
                        _daftarPengajuan.add(dataBaru);
                      } else {
                        // UPDATE
                        final index = _daftarPengajuan.indexWhere((p) => p.id == dataLama.id);
                        if (index != -1) _daftarPengajuan[index] = dataBaru;
                      }
                    });

                    Navigator.pop(context); // Tutup form
                  },
                  icon: const Icon(Icons.save),
                  label: const Text('Simpan Data'),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }

  // ==========================================
  // OPERASI DELETE (DENGAN KONFIRMASI)
  // ==========================================
  Future<void> _konfirmasiHapus(DataPengajuan pengajuan) async {
    final yakin = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Batalkan Pengajuan?'),
        content: Text('Pengajuan buku "${pengajuan.judulBuku}" akan dihapus permanen.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Batal')),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (yakin == true) {
      setState(() {
        // DELETE
        _daftarPengajuan.removeWhere((p) => p.id == pengajuan.id);
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Pengajuan dibatalkan.')),
        );
      }
    }
  }

  // ==========================================
  // OPERASI READ (LISTVIEW BUILDER)
  // ==========================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Pengajuan Pinjam')),
      body: _daftarPengajuan.isEmpty
          ? const Center(child: Text('Belum ada pengajuan peminjaman.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _daftarPengajuan.length,
              itemBuilder: (context, index) {
                final DataPengajuan pengajuan = _daftarPengajuan[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(pengajuan.judulBuku, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Oleh: ${pengajuan.namaPeminjam} • ${pengajuan.durasiHari} Hari\nStatus: ${pengajuan.status}'),
                    isThreeLine: true,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _tampilkanForm(pengajuan),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _konfirmasiHapus(pengajuan),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _tampilkanForm(),
        icon: const Icon(Icons.add),
        label: const Text('Pengajuan Baru'),
      ),
    );
  }
}