import 'package:flutter/material.dart';

import 'data_pengajuan.dart';
import 'form-interaksi.dart';

class HalamanCrudLokal extends StatefulWidget {
  const HalamanCrudLokal({super.key});

  @override
  State<HalamanCrudLokal> createState() => _HalamanCrudLokalState();
}

class _HalamanCrudLokalState extends State<HalamanCrudLokal> {
  static const Color merahAkademik = Color(0xFFB21F32);
  static const Color latar = Color(0xFFF7F7F9);

  // Data pengajuan disimpan sementara di memori aplikasi.
  final List<DataPengajuan> _daftarPengajuan = [];

  // Daftar fasilitas untuk pilihan pada FormInteraksi.
  final List<Map<String, String>> _daftarFasilitas = [
    {'nama': 'Aula Kampus'},
    {'nama': 'Ruang Kelas'},
    {'nama': 'Laboratorium'},
    {'nama': 'Proyektor'},
    {'nama': 'Sound System'},
    {'nama': 'Mikrofon'},
    {'nama': 'Meja'},
    {'nama': 'Kursi'},
  ];

  void _tampilkanPesan(String pesan) {
    if (!mounted) return;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(pesan)),
      );
  }

  // CREATE: membuka FormInteraksi untuk menambahkan pengajuan.
  Future<void> _bukaFormPengajuan() async {
    await Navigator.push<bool>(
      context,
      MaterialPageRoute<bool>(
        builder: (context) => FormInteraksi(
          daftarFasilitas: _daftarFasilitas,
          onSimpan: (pengajuan) {
            setState(() {
              _daftarPengajuan.add(pengajuan);
            });
          },
        ),
      ),
    );

    if (!mounted) return;
  }

  // UPDATE: mengubah pengajuan yang sudah ada.
  Future<void> _ubahPengajuan(DataPengajuan data) async {
    final fasilitasController =
        TextEditingController(text: data.namaFasilitas);
    final tanggalController =
        TextEditingController(text: data.tanggal);
    final mulaiController =
        TextEditingController(text: data.jamMulai);
    final selesaiController =
        TextEditingController(text: data.jamSelesai);
    final tujuanController =
        TextEditingController(text: data.tujuan);

    String status = data.status;

    try {
      final hasil = await showDialog<DataPengajuan>(
        context: context,
        builder: (dialogContext) {
          return StatefulBuilder(
            builder: (context, setDialogState) {
              return AlertDialog(
                title: const Text('Ubah Pengajuan'),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: fasilitasController,
                        decoration: const InputDecoration(
                          labelText: 'Nama fasilitas',
                        ),
                      ),
                      TextField(
                        controller: tanggalController,
                        decoration: const InputDecoration(
                          labelText: 'Tanggal peminjaman',
                          hintText: 'Contoh: 28/10/2026',
                        ),
                      ),
                      TextField(
                        controller: mulaiController,
                        decoration: const InputDecoration(
                          labelText: 'Jam mulai',
                          hintText: 'Contoh: 08.00',
                        ),
                      ),
                      TextField(
                        controller: selesaiController,
                        decoration: const InputDecoration(
                          labelText: 'Jam selesai',
                          hintText: 'Contoh: 10.00',
                        ),
                      ),
                      TextField(
                        controller: tujuanController,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          labelText: 'Tujuan peminjaman',
                        ),
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: status,
                        decoration: const InputDecoration(
                          labelText: 'Status pengajuan',
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'Menunggu',
                            child: Text('Menunggu'),
                          ),
                          DropdownMenuItem(
                            value: 'Disetujui',
                            child: Text('Disetujui'),
                          ),
                          DropdownMenuItem(
                            value: 'Ditolak',
                            child: Text('Ditolak'),
                          ),
                        ],
                        onChanged: (nilai) {
                          if (nilai != null) {
                            setDialogState(() {
                              status = nilai;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                    },
                    child: const Text('Batal'),
                  ),
                  FilledButton(
                    onPressed: () {
                      final fasilitas =
                          fasilitasController.text.trim();
                      final tanggal =
                          tanggalController.text.trim();
                      final mulai = mulaiController.text.trim();
                      final selesai =
                          selesaiController.text.trim();
                      final tujuan = tujuanController.text.trim();

                      if (fasilitas.isEmpty ||
                          tanggal.isEmpty ||
                          mulai.isEmpty ||
                          selesai.isEmpty ||
                          tujuan.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Semua kolom harus diisi.',
                            ),
                          ),
                        );
                        return;
                      }

                      final pengajuan = DataPengajuan(
                        id: data.id,
                        namaFasilitas: fasilitas,
                        tanggal: tanggal,
                        jamMulai: mulai,
                        jamSelesai: selesai,
                        tujuan: tujuan,
                        status: status,
                      );

                      Navigator.pop(dialogContext, pengajuan);
                    },
                    child: const Text('Simpan'),
                  ),
                ],
              );
            },
          );
        },
      );

      if (!mounted || hasil == null) return;

      final index =
          _daftarPengajuan.indexWhere((item) => item.id == data.id);

      if (index == -1) {
        _tampilkanPesan('Data pengajuan tidak ditemukan.');
        return;
      }

      setState(() {
        _daftarPengajuan[index] = hasil;
      });

      _tampilkanPesan('Pengajuan berhasil diperbarui.');
    } finally {
      fasilitasController.dispose();
      tanggalController.dispose();
      mulaiController.dispose();
      selesaiController.dispose();
      tujuanController.dispose();
    }
  }

  // DELETE: menampilkan konfirmasi sebelum menghapus data.
  Future<void> _konfirmasiHapus(DataPengajuan data) async {
    final yakin = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Hapus Pengajuan'),
          content: Text(
            'Apakah kamu yakin ingin menghapus pengajuan '
            '${data.namaFasilitas}?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext, false);
              },
              child: const Text('Batal'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(dialogContext, true);
              },
              style: FilledButton.styleFrom(
                backgroundColor: merahAkademik,
              ),
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );

    if (yakin != true || !mounted) return;

    setState(() {
      _daftarPengajuan.removeWhere(
        (item) => item.id == data.id,
      );
    });

    _tampilkanPesan('Pengajuan berhasil dihapus.');
  }

  // Menentukan warna status pengajuan.
  Color _warnaStatus(String status) {
    switch (status) {
      case 'Disetujui':
        return Colors.green;
      case 'Ditolak':
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: latar,
      appBar: AppBar(
        title: const Text('Data Pengajuan FasKampus'),
        backgroundColor: merahAkademik,
        foregroundColor: Colors.white,
      ),
      body: _daftarPengajuan.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.assignment_outlined,
                      size: 60,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Belum ada pengajuan.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Tekan tombol Tambah Pengajuan untuk '
                      'membuat pengajuan baru.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _daftarPengajuan.length,
              itemBuilder: (context, index) {
                final data = _daftarPengajuan[index];

                return Card(
                  key: ValueKey(data.id),
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xFFFBE9EC),
                        child: Icon(
                          Icons.meeting_room_outlined,
                          color: merahAkademik,
                        ),
                      ),
                      title: Text(
                        data.namaFasilitas,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Tanggal: ${data.tanggal}'),
                            Text(
                              'Waktu: ${data.jamMulai} - '
                              '${data.jamSelesai}',
                            ),
                            Text('Tujuan: ${data.tujuan}'),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Text('Status: '),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _warnaStatus(data.status)
                                        .withValues(alpha: 0.12),
                                    borderRadius:
                                        BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    data.status,
                                    style: TextStyle(
                                      color: _warnaStatus(data.status),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      trailing: PopupMenuButton<String>(
                        tooltip: 'Aksi pengajuan',
                        onSelected: (pilihan) {
                          if (pilihan == 'ubah') {
                            _ubahPengajuan(data);
                          } else if (pilihan == 'hapus') {
                            _konfirmasiHapus(data);
                          }
                        },
                        itemBuilder: (context) => const [
                          PopupMenuItem<String>(
                            value: 'ubah',
                            child: Row(
                              children: [
                                Icon(Icons.edit_outlined),
                                SizedBox(width: 8),
                                Text('Ubah'),
                              ],
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'hapus',
                            child: Row(
                              children: [
                                Icon(Icons.delete_outline),
                                SizedBox(width: 8),
                                Text('Hapus'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: merahAkademik,
        foregroundColor: Colors.white,
        onPressed: _bukaFormPengajuan,
        icon: const Icon(Icons.add),
        label: const Text('Tambah Pengajuan'),
      ),
    );
  }
}