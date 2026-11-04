import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// =====================================================
// 1. MODEL DATA LAPORAN
// =====================================================

class DataLaporan {
  final String id;
  final String fasilitas;
  final String lokasi;
  final String deskripsi;
  final String status;
  final DateTime tanggalLaporan;
  final String? fotoPath;
  final String? videoPath;
  final String? catatan;
  final String? fotoBuktiPath;

  DataLaporan({
    required this.id,
    required this.fasilitas,
    required this.lokasi,
    required this.deskripsi,
    required this.status,
    required this.tanggalLaporan,
    this.fotoPath,
    this.videoPath,
    this.catatan,
    this.fotoBuktiPath,
  });

  DataLaporan copyWith({
    String? fasilitas,
    String? lokasi,
    String? deskripsi,
    String? status,
    String? catatan,
    String? fotoPath,
    String? videoPath,
    String? fotoBuktiPath,
  }) {
    return DataLaporan(
      id: id,
      fasilitas: fasilitas ?? this.fasilitas,
      lokasi: lokasi ?? this.lokasi,
      deskripsi: deskripsi ?? this.deskripsi,
      status: status ?? this.status,
      tanggalLaporan: tanggalLaporan,
      fotoPath: fotoPath ?? this.fotoPath,
      videoPath: videoPath ?? this.videoPath,
      catatan: catatan ?? this.catatan,
      fotoBuktiPath: fotoBuktiPath ?? this.fotoBuktiPath,
    );
  }

  @override
  String toString() {
    return 'DataLaporan(id: $id, fasilitas: $fasilitas, '
        'lokasi: $lokasi, status: $status)';
  }
}

// =====================================================
// 2. MY APP DAN SUMBER DATA BERSAMA
// =====================================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lapor Fasilitas FTI',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6D28D9),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F3FF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFAF5FF),
          foregroundColor: Color(0xFF25212B),
          elevation: 0,
        ),
      ),
      home: const AplikasiLapor(),
    );
  }
}

class AplikasiLapor extends StatefulWidget {
  const AplikasiLapor({super.key});

  @override
  State<AplikasiLapor> createState() => _AplikasiLaporState();
}

class _AplikasiLaporState extends State<AplikasiLapor> {
  final List<DataLaporan> _daftarLaporan = [
    DataLaporan(
      id: 'LP001',
      fasilitas: 'Proyektor',
      lokasi: 'Kelas 5B',
      deskripsi: 'Gambar tidak tampil.',
      status: 'Menunggu',
      tanggalLaporan: DateTime(2026, 10, 20),
    ),
    DataLaporan(
      id: 'LP002',
      fasilitas: 'AC',
      lokasi: 'Ruang Dosen',
      deskripsi: 'AC tidak dingin.',
      status: 'Dikerjakan',
      tanggalLaporan: DateTime(2026, 10, 21),
    ),
  ];

  void _tambahLaporan(DataLaporan laporan) {
    setState(() {
      _daftarLaporan.insert(0, laporan);
    });
  }

  void _ubahLaporan(DataLaporan laporanBaru) {
    setState(() {
      final index = _daftarLaporan.indexWhere(
        (item) => item.id == laporanBaru.id,
      );

      if (index != -1) {
        _daftarLaporan[index] = laporanBaru;
      }
    });
  }

  void _hapusLaporan(String id) {
    setState(() {
      _daftarLaporan.removeWhere((item) => item.id == id);
    });
  }

  void _masukPelapor() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => HalamanPelapor(
          daftarLaporan: _daftarLaporan,
          onTambah: _tambahLaporan,
          onUbah: _ubahLaporan,
          onHapus: _hapusLaporan,
        ),
      ),
    );
  }

  void _masukPetugas() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => HalamanPetugas(
          daftarLaporan: _daftarLaporan,
          onUbah: _ubahLaporan,
          onHapus: _hapusLaporan,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return HalamanPilihPeran(
      onPelapor: _masukPelapor,
      onPetugas: _masukPetugas,
    );
  }
}

// =====================================================
// 3. HALAMAN PILIH PERAN
// =====================================================

class HalamanPilihPeran extends StatelessWidget {
  final VoidCallback onPelapor;
  final VoidCallback onPetugas;

  const HalamanPilihPeran({
    super.key,
    required this.onPelapor,
    required this.onPetugas,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 42,
                backgroundColor: Color(0xFFEDE9FE),
                child: Icon(
                  Icons.apartment,
                  size: 44,
                  color: Color(0xFF6D28D9),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Lapor Fasilitas FTI',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('Pilih peran untuk melanjutkan'),
              const SizedBox(height: 32),
              KartuPeran(
                judul: 'Pelapor',
                deskripsi: 'Buat laporan dan pantau status fasilitas.',
                icon: Icons.person_outline,
                onTap: onPelapor,
              ),
              const SizedBox(height: 16),
              KartuPeran(
                judul: 'Petugas Fasilitas',
                deskripsi: 'Periksa laporan dan perbarui status perbaikan.',
                icon: Icons.engineering_outlined,
                onTap: onPetugas,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KartuPeran extends StatelessWidget {
  final String judul;
  final String deskripsi;
  final IconData icon;
  final VoidCallback onTap;

  const KartuPeran({
    super.key,
    required this.judul,
    required this.deskripsi,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(18),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFEDE9FE),
          child: Icon(icon, color: const Color(0xFF6D28D9)),
        ),
        title: Text(judul, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(deskripsi),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

// =====================================================
// 4. HALAMAN PELAPOR
// =====================================================

class HalamanPelapor extends StatefulWidget {
  final List<DataLaporan> daftarLaporan;
  final ValueChanged<DataLaporan> onTambah;
  final ValueChanged<DataLaporan> onUbah;
  final ValueChanged<String> onHapus;

  const HalamanPelapor({
    super.key,
    required this.daftarLaporan,
    required this.onTambah,
    required this.onUbah,
    required this.onHapus,
  });

  @override
  State<HalamanPelapor> createState() => _HalamanPelaporState();
}

class _HalamanPelaporState extends State<HalamanPelapor> {
  int _menuAktif = 0;

  Future<void> _bukaForm({DataLaporan? laporan}) async {
    final hasil = await Navigator.push<DataLaporan>(
      context,
      MaterialPageRoute(builder: (_) => FormLaporan(laporan: laporan)),
    );

    if (!mounted || hasil == null) return;

    if (laporan == null) {
      widget.onTambah(hasil);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Laporan berhasil dikirim!')),
      );
    } else {
      widget.onUbah(hasil);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Laporan berhasil diperbarui!')),
      );
    }

    setState(() {});
  }

  Future<void> _bukaDetail(DataLaporan laporan) async {
    final berubah = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => DetailPelapor(
          laporan: laporan,
          onEdit: () => _bukaForm(laporan: laporan),
          onHapus: widget.onHapus,
        ),
      ),
    );

    if (!mounted) return;
    if (berubah == true) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final daftar = widget.daftarLaporan;
    final menunggu = daftar.where((e) => e.status == 'Menunggu').length;
    final dikerjakan = daftar.where((e) => e.status == 'Dikerjakan').length;
    final selesai = daftar.where((e) => e.status == 'Selesai').length;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lapor Fasilitas FTI',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            tooltip: 'Ganti Peran',
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.swap_horiz),
          ),
        ],
      ),
      body: _menuAktif == 0
          ? _halamanBeranda(menunggu, dikerjakan, selesai)
          : _menuAktif == 1
              ? _halamanDaftar()
              : const PanduanPelapor(),
      floatingActionButton: _menuAktif == 2
          ? null
          : FloatingActionButton.extended(
              onPressed: () => _bukaForm(),
              backgroundColor: const Color(0xFF6D28D9),
              foregroundColor: Colors.white,
              icon: const Icon(Icons.add),
              label: const Text('Buat Laporan'),
            ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _menuAktif,
        onDestinationSelected: (index) {
          setState(() => _menuAktif = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),
            selectedIcon: Icon(Icons.assignment),
            label: 'Laporan',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book),
            label: 'Panduan',
          ),
        ],
      ),
    );
  }

  Widget _halamanBeranda(int menunggu, int dikerjakan, int selesai) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF6D28D9),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Halo, Pelapor!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Laporkan kerusakan fasilitas agar segera ditangani.',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Ringkasan Laporan',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: RingkasanLaporan(
                judul: 'Menunggu',
                jumlah: menunggu,
                warna: Colors.orange,
                icon: Icons.hourglass_empty,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: RingkasanLaporan(
                judul: 'Dikerjakan',
                jumlah: dikerjakan,
                warna: Colors.blue,
                icon: Icons.build_outlined,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: RingkasanLaporan(
                judul: 'Selesai',
                jumlah: selesai,
                warna: Colors.green,
                icon: Icons.check_circle_outline,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Laporan Terbaru',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        if (widget.daftarLaporan.isEmpty)
          const KeadaanKosong()
        else
          ...widget.daftarLaporan.take(2).map(
                (item) => KartuLaporan(
                  laporan: item,
                  onTap: () => _bukaDetail(item),
                ),
              ),
        const SizedBox(height: 90),
      ],
    );
  }

  Widget _halamanDaftar() {
    return DaftarLaporanPelapor(
      daftarLaporan: widget.daftarLaporan,
      onTap: _bukaDetail,
    );
  }
}

// =====================================================
// 5. DAFTAR LAPORAN PELAPOR
// =====================================================

class DaftarLaporanPelapor extends StatefulWidget {
  final List<DataLaporan> daftarLaporan;
  final ValueChanged<DataLaporan> onTap;

  const DaftarLaporanPelapor({
    super.key,
    required this.daftarLaporan,
    required this.onTap,
  });

  @override
  State<DaftarLaporanPelapor> createState() => _DaftarLaporanPelaporState();
}

class _DaftarLaporanPelaporState extends State<DaftarLaporanPelapor> {
  String _filter = 'Semua';

  @override
  Widget build(BuildContext context) {
    final daftar = widget.daftarLaporan.where((item) {
      return _filter == 'Semua' || item.status == _filter;
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Semua Laporan Saya',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: ['Semua', 'Menunggu', 'Dikerjakan', 'Selesai']
                .map(
                  (status) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(status),
                      selected: _filter == status,
                      onSelected: (_) => setState(() => _filter = status),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: daftar.isEmpty
              ? const KeadaanKosong()
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: daftar.length,
                  itemBuilder: (context, index) {
                    final item = daftar[index];
                    return KartuLaporan(
                      laporan: item,
                      onTap: () => widget.onTap(item),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

// =====================================================
// 6. DETAIL LAPORAN PELAPOR: EDIT DAN DELETE
// =====================================================

class DetailPelapor extends StatelessWidget {
  final DataLaporan laporan;
  final Future<void> Function() onEdit;
  final ValueChanged<String> onHapus;

  const DetailPelapor({
    super.key,
    required this.laporan,
    required this.onEdit,
    required this.onHapus,
  });

  Future<void> _konfirmasiHapus(BuildContext context) async {
    final konfirmasi = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Hapus Laporan?'),
          content: Text(
            'Apakah kamu yakin ingin menghapus laporan ${laporan.id}? '
            'Laporan yang dihapus tidak dapat dikembalikan.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('Batal'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => Navigator.pop(dialogContext, true),
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );

    if (konfirmasi == true && context.mounted) {
      onHapus(laporan.id);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Laporan berhasil dihapus.')),
      );

      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bisaEdit = laporan.status == 'Menunggu';
    final bisaHapus = laporan.status == 'Menunggu';

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Laporan')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          KartuInformasiLaporan(laporan: laporan),
          const SizedBox(height: 16),
          if (bisaEdit)
            FilledButton.icon(
              onPressed: () async {
                await onEdit();
                if (context.mounted) Navigator.pop(context, true);
              },
              icon: const Icon(Icons.edit_outlined),
              label: const Text('Edit Laporan'),
            )
          else
            const Card(
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Text(
                  'Laporan tidak dapat diedit karena sudah ditangani '
                  'atau diselesaikan.',
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ),
            ),
          const SizedBox(height: 12),
          if (bisaHapus)
            OutlinedButton.icon(
              onPressed: () => _konfirmasiHapus(context),
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              label: const Text(
                'Hapus Laporan',
                style: TextStyle(color: Colors.red),
              ),
            )
          else
            const Card(
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Text(
                  'Laporan tidak dapat dihapus karena sudah dalam proses '
                  'penanganan atau telah selesai.',
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ),
            ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () => Navigator.pop(context, false),
            icon: const Icon(Icons.arrow_back),
            label: const Text('Kembali'),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// 7. FORM CREATE DAN EDIT LAPORAN
// =====================================================

class FormLaporan extends StatefulWidget {
  final DataLaporan? laporan;

  const FormLaporan({super.key, this.laporan});

  @override
  State<FormLaporan> createState() => _FormLaporanState();
}

class _FormLaporanState extends State<FormLaporan> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _deskripsiController;

  String? _fasilitas;
  String? _lokasi;

  final List<String> jenisFasilitas = [
    'Proyektor',
    'AC',
    'Kursi',
    'Lampu',
    'Wi-Fi',
    'Lainnya',
  ];

  final List<String> daftarLokasi = [
    'Kelas 5A',
    'Kelas 5B',
    'Ruang Dosen',
    'Laboratorium',
    'Perpustakaan',
    'Lainnya',
  ];

  bool get modeEdit => widget.laporan != null;

  @override
  void initState() {
    super.initState();
    _fasilitas = widget.laporan?.fasilitas;
    _lokasi = widget.laporan?.lokasi;
    _deskripsiController = TextEditingController(
      text: widget.laporan?.deskripsi ?? '',
    );
  }

  @override
  void dispose() {
    _deskripsiController.dispose();
    super.dispose();
  }

  void _simpanLaporan() {
    if (!_formKey.currentState!.validate()) return;

    final lama = widget.laporan;

    final laporan = DataLaporan(
      id: lama?.id ?? 'LP${DateTime.now().microsecondsSinceEpoch}',
      fasilitas: _fasilitas!,
      lokasi: _lokasi!,
      deskripsi: _deskripsiController.text.trim(),
      status: lama?.status ?? 'Menunggu',
      tanggalLaporan: lama?.tanggalLaporan ?? DateTime.now(),
      fotoPath: lama?.fotoPath,
      videoPath: lama?.videoPath,
      catatan: lama?.catatan,
      fotoBuktiPath: lama?.fotoBuktiPath,
    );

    Navigator.pop(context, laporan);
  }

  void _pesanLampiran(String jenis) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Pemilihan $jenis belum tersedia pada MVP DartPad.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(modeEdit ? 'Edit Laporan' : 'Buat Laporan Kerusakan'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text('Jenis Fasilitas'),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _fasilitas,
              decoration: const InputDecoration(
                hintText: 'Pilih jenis fasilitas',
                border: OutlineInputBorder(),
              ),
              items: jenisFasilitas.map((item) {
                return DropdownMenuItem(value: item, child: Text(item));
              }).toList(),
              onChanged: (value) => setState(() => _fasilitas = value),
              validator: (value) =>
                  value == null ? 'Pilih jenis fasilitas.' : null,
            ),
            const SizedBox(height: 16),
            const Text('Lokasi Kerusakan'),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _lokasi,
              decoration: const InputDecoration(
                hintText: 'Pilih lokasi',
                border: OutlineInputBorder(),
              ),
              items: daftarLokasi.map((item) {
                return DropdownMenuItem(value: item, child: Text(item));
              }).toList(),
              onChanged: (value) => setState(() => _lokasi = value),
              validator: (value) =>
                  value == null ? 'Pilih lokasi kerusakan.' : null,
            ),
            const SizedBox(height: 16),
            const Text('Deskripsi Kerusakan'),
            const SizedBox(height: 8),
            TextFormField(
              controller: _deskripsiController,
              maxLines: 5,
              maxLength: 200,
              decoration: const InputDecoration(
                hintText: 'Jelaskan kerusakan yang terjadi...',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Deskripsi kerusakan wajib diisi.';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            const Text('Lampiran (Opsional)'),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () => _pesanLampiran('foto'),
              icon: const Icon(Icons.camera_alt_outlined),
              label: const Text('Tambah Foto'),
            ),
            OutlinedButton.icon(
              onPressed: () => _pesanLampiran('video'),
              icon: const Icon(Icons.video_library_outlined),
              label: const Text('Tambah Video'),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: _simpanLaporan,
              icon: const Icon(Icons.save_outlined),
              label: Text(modeEdit ? 'Simpan Perubahan' : 'Kirim Laporan'),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// 8. PANDUAN PELAPOR
// =====================================================

class PanduanPelapor extends StatelessWidget {
  const PanduanPelapor({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Panduan Pelapor',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text('Cara membuat dan memantau laporan kerusakan.'),
        const SizedBox(height: 20),
        const LangkahPanduan(
          nomor: '1',
          judul: 'Buat laporan',
          deskripsi: 'Tekan tombol Buat Laporan.',
          icon: Icons.edit_note,
        ),
        const LangkahPanduan(
          nomor: '2',
          judul: 'Isi informasi fasilitas',
          deskripsi: 'Pilih jenis fasilitas dan lokasi kerusakan.',
          icon: Icons.location_on_outlined,
        ),
        const LangkahPanduan(
          nomor: '3',
          judul: 'Tuliskan deskripsi',
          deskripsi: 'Jelaskan masalah yang terjadi dengan jelas.',
          icon: Icons.description_outlined,
        ),
        const LangkahPanduan(
          nomor: '4',
          judul: 'Kirim laporan',
          deskripsi: 'Kirim laporan agar dapat diperiksa petugas.',
          icon: Icons.send_outlined,
        ),
        const LangkahPanduan(
          nomor: '5',
          judul: 'Edit atau hapus laporan',
          deskripsi: 'Selama status masih Menunggu, laporan dapat diedit '
              'atau dihapus melalui halaman detail.',
          icon: Icons.edit_outlined,
        ),
        const LangkahPanduan(
          nomor: '6',
          judul: 'Pantau status',
          deskripsi: 'Buka menu Laporan untuk melihat perkembangan '
              'penanganan.',
          icon: Icons.track_changes,
        ),
      ],
    );
  }
}

// =====================================================
// 9. HALAMAN PETUGAS
// =====================================================

class HalamanPetugas extends StatefulWidget {
  final List<DataLaporan> daftarLaporan;
  final ValueChanged<DataLaporan> onUbah;
  final ValueChanged<String> onHapus;

  const HalamanPetugas({
    super.key,
    required this.daftarLaporan,
    required this.onUbah,
    required this.onHapus,
  });

  @override
  State<HalamanPetugas> createState() => _HalamanPetugasState();
}

class _HalamanPetugasState extends State<HalamanPetugas> {
  int _menuAktif = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lapor Fasilitas FTI',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            tooltip: 'Ganti Peran',
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.swap_horiz),
          ),
        ],
      ),
      body: _menuAktif == 0
          ? _halamanLaporanMasuk()
          : _menuAktif == 1
              ? _halamanRingkasan()
              : const PanduanPetugas(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _menuAktif,
        onDestinationSelected: (index) {
          setState(() => _menuAktif = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),
            selectedIcon: Icon(Icons.assignment),
            label: 'Laporan Masuk',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'Ringkasan',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book),
            label: 'Panduan',
          ),
        ],
      ),
    );
  }

  Widget _halamanLaporanMasuk() {
    return DaftarLaporanPetugas(
      daftarLaporan: widget.daftarLaporan,
      onUbah: widget.onUbah,
      onHapus: widget.onHapus,
    );
  }

  Widget _halamanRingkasan() {
    final daftar = widget.daftarLaporan;
    final menunggu = daftar.where((e) => e.status == 'Menunggu').length;
    final dikerjakan = daftar.where((e) => e.status == 'Dikerjakan').length;
    final selesai = daftar.where((e) => e.status == 'Selesai').length;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Ringkasan Penanganan',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text('Pantau jumlah laporan berdasarkan statusnya.'),
        const SizedBox(height: 20),
        RingkasanLaporan(
          judul: 'Menunggu',
          jumlah: menunggu,
          warna: Colors.orange,
          icon: Icons.hourglass_empty,
        ),
        RingkasanLaporan(
          judul: 'Dikerjakan',
          jumlah: dikerjakan,
          warna: Colors.blue,
          icon: Icons.build_outlined,
        ),
        RingkasanLaporan(
          judul: 'Selesai',
          jumlah: selesai,
          warna: Colors.green,
          icon: Icons.check_circle_outline,
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Text(
              'Total laporan: ${daftar.length}',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

// =====================================================
// 10. DAFTAR LAPORAN PETUGAS
// =====================================================

class DaftarLaporanPetugas extends StatefulWidget {
  final List<DataLaporan> daftarLaporan;
  final ValueChanged<DataLaporan> onUbah;
  final ValueChanged<String> onHapus;

  const DaftarLaporanPetugas({
    super.key,
    required this.daftarLaporan,
    required this.onUbah,
    required this.onHapus,
  });

  @override
  State<DaftarLaporanPetugas> createState() => _DaftarLaporanPetugasState();
}

class _DaftarLaporanPetugasState extends State<DaftarLaporanPetugas> {
  String _filter = 'Semua';

  Future<void> _bukaDetail(DataLaporan laporan) async {
    final berubah = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => DetailPetugas(
          laporan: laporan,
          onUbah: widget.onUbah,
          onHapus: widget.onHapus,
        ),
      ),
    );

    if (!mounted) return;
    if (berubah == true) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final daftar = widget.daftarLaporan.where((item) {
      return _filter == 'Semua' || item.status == _filter;
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Daftar Laporan Masuk',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: ['Semua', 'Menunggu', 'Dikerjakan', 'Selesai']
                .map(
                  (status) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(status),
                      selected: _filter == status,
                      onSelected: (_) => setState(() => _filter = status),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: daftar.isEmpty
              ? const KeadaanKosong()
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: daftar.length,
                  itemBuilder: (context, index) {
                    final item = daftar[index];
                    return KartuLaporan(
                      laporan: item,
                      onTap: () => _bukaDetail(item),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

// =====================================================
// 11. DETAIL PETUGAS
// =====================================================

class DetailPetugas extends StatelessWidget {
  final DataLaporan laporan;
  final ValueChanged<DataLaporan> onUbah;
  final ValueChanged<String> onHapus;

  const DetailPetugas({
    super.key,
    required this.laporan,
    required this.onUbah,
    required this.onHapus,
  });

  Future<void> _bukaUbahStatus(BuildContext context) async {
    final hasil = await Navigator.push<DataLaporan>(
      context,
      MaterialPageRoute(builder: (_) => FormStatus(laporan: laporan)),
    );

    if (hasil == null || !context.mounted) return;
    onUbah(hasil);
    Navigator.pop(context, true);
  }

  Future<void> _konfirmasiHapus(BuildContext context) async {
    final konfirmasi = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Hapus Laporan?'),
          content: Text('Apakah laporan ${laporan.id} ingin dihapus?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('Batal'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => Navigator.pop(dialogContext, true),
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );

    if (konfirmasi == true && context.mounted) {
      onHapus(laporan.id);
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Laporan')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          KartuInformasiLaporan(laporan: laporan),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: () => _bukaUbahStatus(context),
            icon: const Icon(Icons.edit_outlined),
            label: const Text('Ubah Status'),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () => _konfirmasiHapus(context),
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            label: const Text(
              'Hapus Laporan',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// 12. FORM UBAH STATUS PETUGAS
// =====================================================

class FormStatus extends StatefulWidget {
  final DataLaporan laporan;

  const FormStatus({super.key, required this.laporan});

  @override
  State<FormStatus> createState() => _FormStatusState();
}

class _FormStatusState extends State<FormStatus> {
  late String _status;
  late TextEditingController _catatanController;

  @override
  void initState() {
    super.initState();
    _status = widget.laporan.status;
    _catatanController = TextEditingController(
      text: widget.laporan.catatan ?? '',
    );
  }

  @override
  void dispose() {
    _catatanController.dispose();
    super.dispose();
  }

  void _simpan() {
    final hasil = widget.laporan.copyWith(
      status: _status,
      catatan: _catatanController.text.trim(),
    );
    Navigator.pop(context, hasil);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ubah Status Laporan')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: ${widget.laporan.id}'),
                  const SizedBox(height: 8),
                  Text('Fasilitas: ${widget.laporan.fasilitas}'),
                  const SizedBox(height: 8),
                  Text('Lokasi: ${widget.laporan.lokasi}'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Pilih Status Baru',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                RadioListTile<String>(
                  value: 'Dikerjakan',
                  groupValue: _status,
                  title: const Text('Dikerjakan'),
                  onChanged: (value) => setState(() => _status = value!),
                ),
                RadioListTile<String>(
                  value: 'Selesai',
                  groupValue: _status,
                  title: const Text('Selesai'),
                  onChanged: (value) => setState(() => _status = value!),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Catatan Penanganan (Opsional)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _catatanController,
            maxLines: 4,
            maxLength: 200,
            decoration: const InputDecoration(
              hintText: 'Tuliskan catatan penanganan...',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Pemilihan foto bukti belum tersedia di DartPad.',
                  ),
                ),
              );
            },
            icon: const Icon(Icons.camera_alt_outlined),
            label: const Text('Tambah Foto Bukti (Opsional)'),
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: _simpan,
            child: const Text('Simpan Perubahan'),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// 13. PANDUAN PETUGAS
// =====================================================

class PanduanPetugas extends StatelessWidget {
  const PanduanPetugas({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Panduan Petugas',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text('Cara memeriksa dan menangani laporan fasilitas.'),
        const SizedBox(height: 20),
        const LangkahPanduan(
          nomor: '1',
          judul: 'Periksa laporan masuk',
          deskripsi: 'Buka menu Laporan Masuk untuk melihat laporan.',
          icon: Icons.inbox_outlined,
        ),
        const LangkahPanduan(
          nomor: '2',
          judul: 'Buka detail laporan',
          deskripsi: 'Periksa fasilitas, lokasi, dan deskripsi kerusakan.',
          icon: Icons.article_outlined,
        ),
        const LangkahPanduan(
          nomor: '3',
          judul: 'Ubah status menjadi Dikerjakan',
          deskripsi: 'Lakukan ketika proses penanganan sudah dimulai.',
          icon: Icons.build_outlined,
        ),
        const LangkahPanduan(
          nomor: '4',
          judul: 'Ubah status menjadi Selesai',
          deskripsi: 'Lakukan setelah perbaikan selesai.',
          icon: Icons.check_circle_outline,
        ),
        const LangkahPanduan(
          nomor: '5',
          judul: 'Hapus laporan tidak valid',
          deskripsi: 'Hapus laporan duplikat atau tidak valid melalui '
              'tombol Hapus dan konfirmasi.',
          icon: Icons.delete_outline,
        ),
        const LangkahPanduan(
          nomor: '6',
          judul: 'Pantau ringkasan',
          deskripsi: 'Gunakan menu Ringkasan untuk melihat jumlah laporan '
              'berdasarkan status.',
          icon: Icons.bar_chart,
        ),
      ],
    );
  }
}

// =====================================================
// 14. KOMPONEN BERSAMA
// =====================================================

class RingkasanLaporan extends StatelessWidget {
  final String judul;
  final int jumlah;
  final Color warna;
  final IconData icon;

  const RingkasanLaporan({
    super.key,
    required this.judul,
    required this.jumlah,
    required this.warna,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: warna, size: 26),
            const SizedBox(height: 8),
            Text(
              '$jumlah',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(judul, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class KartuLaporan extends StatelessWidget {
  final DataLaporan laporan;
  final VoidCallback onTap;

  const KartuLaporan({
    super.key,
    required this.laporan,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(14),
        leading: const CircleAvatar(
          backgroundColor: Color(0xFFEDE9FE),
          child: Icon(Icons.build_outlined, color: Color(0xFF6D28D9)),
        ),
        title: Text(
          laporan.fasilitas,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(laporan.lokasi),
              const SizedBox(height: 4),
              Text(laporan.deskripsi),
              const SizedBox(height: 8),
              ChipStatus(status: laporan.status),
            ],
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

class ChipStatus extends StatelessWidget {
  final String status;

  const ChipStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color warna;

    switch (status) {
      case 'Menunggu':
        warna = Colors.orange;
        break;
      case 'Dikerjakan':
        warna = Colors.blue;
        break;
      case 'Selesai':
        warna = Colors.green;
        break;
      default:
        warna = Colors.grey;
    }

    return Chip(
      label: Text(
        status,
        style: TextStyle(color: warna, fontWeight: FontWeight.bold),
      ),
      backgroundColor: warna.withOpacity(0.12),
      side: BorderSide.none,
      visualDensity: VisualDensity.compact,
    );
  }
}

class KeadaanKosong extends StatelessWidget {
  const KeadaanKosong({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(32),
      child: Column(
        children: [
          Icon(Icons.inbox_outlined, size: 60, color: Colors.grey),
          SizedBox(height: 12),
          Text('Belum ada laporan.'),
        ],
      ),
    );
  }
}

class LangkahPanduan extends StatelessWidget {
  final String nomor;
  final String judul;
  final String deskripsi;
  final IconData icon;

  const LangkahPanduan({
    super.key,
    required this.nomor,
    required this.judul,
    required this.deskripsi,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(14),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFEDE9FE),
          child: Icon(icon, color: const Color(0xFF6D28D9)),
        ),
        title: Text(
          '$nomor. $judul',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(deskripsi),
        ),
      ),
    );
  }
}

class KartuInformasiLaporan extends StatelessWidget {
  final DataLaporan laporan;

  const KartuInformasiLaporan({super.key, required this.laporan});

  Widget _baris(String judul, String isi) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(judul, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(isi),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Informasi Laporan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _baris('ID Laporan', laporan.id),
            _baris('Jenis Fasilitas', laporan.fasilitas),
            _baris('Lokasi', laporan.lokasi),
            _baris('Deskripsi Kerusakan', laporan.deskripsi),
            _baris(
              'Tanggal Laporan',
              '${laporan.tanggalLaporan.day}/'
                  '${laporan.tanggalLaporan.month}/'
                  '${laporan.tanggalLaporan.year}',
            ),
            const Text(
              'Status Laporan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ChipStatus(status: laporan.status),
            if (laporan.catatan != null && laporan.catatan!.isNotEmpty) ...[
              const Divider(height: 24),
              const Text(
                'Catatan Petugas',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(laporan.catatan!),
            ],
          ],
        ),
      ),
    );
  }
}
