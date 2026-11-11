import 'package:flutter/material.dart';

import 'form-interaksi.dart';

/// Data satu mahasiswa yang terlibat dalam pengajuan.
class AnggotaPengajuan {
  final String nama;
  final String nimNpm;

  const AnggotaPengajuan({required this.nama, required this.nimNpm});

  @override
  String toString() {
    return 'AnggotaPengajuan(nama: $nama, nimNpm: $nimNpm)';
  }
}

/// Model utama pengajuan surat SIPORA.
class PengajuanSurat {
  final String id;
  final String jenisPengajuan;
  final String jenisPelaksanaan;
  final List<AnggotaPengajuan> anggota;
  final String semester;
  final String programStudi;
  final String whatsapp;
  final String tempat;
  final String alamat;
  final DateTime tanggalMulai;
  final DateTime tanggalSelesai;
  final String topik;
  final bool untukMataKuliah;
  final String? mataKuliah;
  final String status;

  PengajuanSurat({
    required this.id,
    required this.jenisPengajuan,
    required this.jenisPelaksanaan,
    required List<AnggotaPengajuan> anggota,
    required this.semester,
    required this.programStudi,
    required this.whatsapp,
    required this.tempat,
    required this.alamat,
    required this.tanggalMulai,
    required this.tanggalSelesai,
    required this.topik,
    required this.untukMataKuliah,
    required this.mataKuliah,
    required this.status,
  }) : anggota = List.unmodifiable(anggota);

  /// Membentuk model dari hasil formulir.
  /// ID dan status awal ditentukan oleh sistem.
  factory PengajuanSurat.dariForm(Map<String, dynamic> data) {
    final dataAnggota = data['anggota'] as List<dynamic>? ?? [];

    final anggota = dataAnggota.map((item) {
      final map = Map<String, dynamic>.from(item as Map);

      return AnggotaPengajuan(
        nama: map['nama']?.toString() ?? '',
        nimNpm: map['nimNpm']?.toString() ?? '',
      );
    }).toList();

    return PengajuanSurat(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      jenisPengajuan: data['jenisPengajuan'] as String,
      jenisPelaksanaan: data['jenisPelaksanaan'] as String? ?? 'Individu',
      anggota: anggota,
      semester: data['semester'] as String,
      programStudi: data['programStudi'] as String,
      whatsapp: data['whatsapp'] as String,
      tempat: data['tempat'] as String,
      alamat: data['alamat'] as String,
      tanggalMulai: data['tanggalMulai'] as DateTime,
      tanggalSelesai: data['tanggalSelesai'] as DateTime,
      topik: data['topik'] as String,
      untukMataKuliah: data['untukMataKuliah'] as bool? ?? false,
      mataKuliah: data['mataKuliah'] as String?,
      status: 'Diproses',
    );
  }

  /// Membuat objek pengganti dengan ID yang tetap sama.
  PengajuanSurat copyWith({
    String? whatsapp,
    String? tempat,
    String? alamat,
    String? topik,
  }) {
    return PengajuanSurat(
      id: id,
      jenisPengajuan: jenisPengajuan,
      jenisPelaksanaan: jenisPelaksanaan,
      anggota: anggota,
      semester: semester,
      programStudi: programStudi,
      whatsapp: whatsapp ?? this.whatsapp,
      tempat: tempat ?? this.tempat,
      alamat: alamat ?? this.alamat,
      tanggalMulai: tanggalMulai,
      tanggalSelesai: tanggalSelesai,
      topik: topik ?? this.topik,
      untukMataKuliah: untukMataKuliah,
      mataKuliah: mataKuliah,
      status: status,
    );
  }

  @override
  String toString() {
    return 'PengajuanSurat('
        'id: $id, '
        'jenisPengajuan: $jenisPengajuan, '
        'tempat: $tempat, '
        'status: $status)';
  }
}

/// Halaman daftar dan pengelolaan pengajuan lokal.
class DaftarPengajuanLokalPage extends StatefulWidget {
  const DaftarPengajuanLokalPage({super.key});

  @override
  State<DaftarPengajuanLokalPage> createState() =>
      _DaftarPengajuanLokalPageState();
}

class _DaftarPengajuanLokalPageState extends State<DaftarPengajuanLokalPage> {
  static const Color primary = Color(0xFF2457C5);
  static const Color ink = Color(0xFF182B49);
  static const Color muted = Color(0xFF718096);
  static const Color line = Color(0xFFE2E8F0);

  // Data disimpan di State selama halaman ini tetap hidup.
  final List<PengajuanSurat> _daftarPengajuan = [];

  String _formatTanggal(DateTime tanggal) {
    final hari = tanggal.day.toString().padLeft(2, '0');
    final bulan = tanggal.month.toString().padLeft(2, '0');
    return '$hari/$bulan/${tanggal.year}';
  }

  /// CREATE: membuka form, menerima hasilnya, lalu menambah data.
  Future<void> _tambahPengajuan() async {
    final hasil = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(builder: (_) => const FormInteraksiPage()),
    );

    if (!mounted || hasil == null) return;

    final pengajuan = PengajuanSurat.dariForm(hasil);

    setState(() {
      _daftarPengajuan.add(pengajuan);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Pengajuan berhasil ditambahkan ke daftar lokal.'),
      ),
    );
  }

  /// UPDATE: mengedit informasi kegiatan yang dapat diperbarui mahasiswa.
  Future<void> _editPengajuan(PengajuanSurat pengajuan) async {
    final tempatController = TextEditingController(text: pengajuan.tempat);
    final alamatController = TextEditingController(text: pengajuan.alamat);
    final topikController = TextEditingController(text: pengajuan.topik);
    final whatsappController = TextEditingController(text: pengajuan.whatsapp);

    final hasil = await showDialog<Map<String, String>>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Edit Pengajuan'),
          content: SizedBox(
            width: 440,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: tempatController,
                    decoration: const InputDecoration(
                      labelText: 'Tempat kegiatan',
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: alamatController,
                    maxLines: 2,
                    decoration: const InputDecoration(labelText: 'Alamat'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: topikController,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      labelText: 'Topik kegiatan',
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: whatsappController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Nomor WhatsApp',
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Batal'),
            ),
            FilledButton(
              onPressed: () {
                if (tempatController.text.trim().isEmpty ||
                    alamatController.text.trim().isEmpty ||
                    topikController.text.trim().isEmpty ||
                    whatsappController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(dialogContext).showSnackBar(
                    const SnackBar(content: Text('Semua kolom harus diisi.')),
                  );
                  return;
                }

                Navigator.pop(dialogContext, {
                  'tempat': tempatController.text.trim(),
                  'alamat': alamatController.text.trim(),
                  'topik': topikController.text.trim(),
                  'whatsapp': whatsappController.text.trim(),
                });
              },
              child: const Text('Simpan Perubahan'),
            ),
          ],
        );
      },
    );

    tempatController.dispose();
    alamatController.dispose();
    topikController.dispose();
    whatsappController.dispose();

    if (!mounted || hasil == null) return;

    // Cari berdasarkan ID, bukan indeks yang disimpan sebelumnya.
    final index = _daftarPengajuan.indexWhere(
      (item) => item.id == pengajuan.id,
    );

    if (index == -1) return;

    setState(() {
      _daftarPengajuan[index] = pengajuan.copyWith(
        tempat: hasil['tempat'],
        alamat: hasil['alamat'],
        topik: hasil['topik'],
        whatsapp: hasil['whatsapp'],
      );
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Perubahan pengajuan berhasil disimpan.')),
    );
  }

  /// DELETE: minta konfirmasi sebelum menghapus data berdasarkan ID.
  Future<void> _hapusPengajuan(PengajuanSurat pengajuan) async {
    final konfirmasi = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Hapus Pengajuan?'),
          content: Text(
            'Pengajuan "${pengajuan.jenisPengajuan}" di '
            '${pengajuan.tempat} akan dihapus dari daftar lokal. '
            'Tindakan ini tidak dapat dibatalkan.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('Batal'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red.shade700,
              ),
              onPressed: () => Navigator.pop(dialogContext, true),
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );

    if (!mounted || konfirmasi != true) return;

    setState(() {
      _daftarPengajuan.removeWhere((item) => item.id == pengajuan.id);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pengajuan dihapus dari daftar lokal.')),
    );
  }

  /// READ: menampilkan seluruh informasi pengajuan dalam modal.
  void _lihatDetail(PengajuanSurat pengajuan) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Detail Pengajuan Surat'),
          content: SizedBox(
            width: 480,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _barisDetail('ID Pengajuan', pengajuan.id),
                  _barisDetail('Jenis Pengajuan', pengajuan.jenisPengajuan),
                  _barisDetail('Jenis Pelaksanaan', pengajuan.jenisPelaksanaan),
                  _barisDetail('Semester', pengajuan.semester),
                  _barisDetail('Program Studi', pengajuan.programStudi),
                  _barisDetail('WhatsApp', pengajuan.whatsapp),
                  _barisDetail('Tempat', pengajuan.tempat),
                  _barisDetail('Alamat', pengajuan.alamat),
                  _barisDetail(
                    'Tanggal Mulai',
                    _formatTanggal(pengajuan.tanggalMulai),
                  ),
                  _barisDetail(
                    'Tanggal Selesai',
                    _formatTanggal(pengajuan.tanggalSelesai),
                  ),
                  _barisDetail('Topik', pengajuan.topik),
                  _barisDetail(
                    'Untuk Mata Kuliah',
                    pengajuan.untukMataKuliah ? 'Ya' : 'Tidak',
                  ),
                  if (pengajuan.mataKuliah != null &&
                      pengajuan.mataKuliah!.trim().isNotEmpty)
                    _barisDetail('Mata Kuliah', pengajuan.mataKuliah!),
                  _barisDetail('Status', pengajuan.status),
                  const SizedBox(height: 12),
                  const Text(
                    'Anggota Pengajuan',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  if (pengajuan.anggota.isEmpty)
                    const Text('Belum ada data anggota.')
                  else
                    ...pengajuan.anggota.map(
                      (anggota) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text('${anggota.nama} — ${anggota.nimNpm}'),
                      ),
                    ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  /// Menampilkan satu informasi dengan label dan nilai.
  Widget _barisDetail(String label, String nilai) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: muted, fontSize: 12)),
          const SizedBox(height: 3),
          SelectableText(
            nilai.trim().isEmpty ? '-' : nilai,
            style: const TextStyle(color: ink, fontSize: 14, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildKartuPengajuan(PengajuanSurat pengajuan) {
    final namaAnggota = pengajuan.anggota
        .map((anggota) => anggota.nama)
        .join(', ');

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 14),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: line),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF0FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.description_outlined, color: primary),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pengajuan.jenisPengajuan,
                        style: const TextStyle(
                          color: ink,
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        pengajuan.tempat,
                        style: const TextStyle(color: muted, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF0FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    pengajuan.status,
                    style: const TextStyle(
                      color: primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            _barisInfo('Mahasiswa', namaAnggota),
            _barisInfo('Program Studi', pengajuan.programStudi),
            _barisInfo(
              'Periode',
              '${_formatTanggal(pengajuan.tanggalMulai)} – '
                  '${_formatTanggal(pengajuan.tanggalSelesai)}',
            ),
            _barisInfo('Topik', pengajuan.topik),
            const Divider(height: 24, color: line),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton.icon(
                  onPressed: () => _lihatDetail(pengajuan),
                  icon: const Icon(Icons.visibility_outlined, size: 18),
                  label: const Text('Detail'),
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: () => _editPengajuan(pengajuan),
                  icon: const Icon(Icons.edit_outlined, size: 18),
                  label: const Text('Edit'),
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: () => _hapusPengajuan(pengajuan),
                  icon: const Icon(Icons.delete_outline, size: 18),
                  label: const Text('Hapus'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red.shade700,
                    side: BorderSide(color: Colors.red.shade200),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _barisInfo(String label, String nilai) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 112,
            child: Text(
              label,
              style: const TextStyle(color: muted, fontSize: 12),
            ),
          ),
          const Text(': '),
          Expanded(
            child: Text(
              nilai,
              style: const TextStyle(color: ink, fontSize: 12, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FC),
      appBar: AppBar(
        title: const Text(
          'Daftar Pengajuan',
          style: TextStyle(color: ink, fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
        foregroundColor: ink,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _tambahPengajuan,
        backgroundColor: primary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Ajukan Surat'),
      ),
      body: _daftarPengajuan.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 76,
                      height: 76,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF0FF),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: const Icon(
                        Icons.inbox_outlined,
                        size: 38,
                        color: primary,
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'Belum Ada Pengajuan',
                      style: TextStyle(
                        color: ink,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Pengajuan yang kamu tambahkan melalui formulir '
                      'akan muncul di halaman ini.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: muted, height: 1.5),
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 850),
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 18, 16, 100),
                  itemCount: _daftarPengajuan.length,
                  itemBuilder: (context, index) {
                    final pengajuan = _daftarPengajuan[index];
                    return _buildKartuPengajuan(pengajuan);
                  },
                ),
              ),
            ),
    );
  }
}
