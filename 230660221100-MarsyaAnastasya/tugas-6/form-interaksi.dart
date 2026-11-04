
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ==========================================
// 1. MODEL DATA LAPORAN
// ==========================================

class DataLaporan {
  final String id;
  final String fasilitas;
  final String lokasi;
  final String deskripsi;
  final String status;

  DataLaporan({
    required this.id,
    required this.fasilitas,
    required this.lokasi,
    required this.deskripsi,
    required this.status,
  });
}

// Data awal aplikasi
final List<DataLaporan> daftarLaporan = [
  DataLaporan(
    id: 'LP001',
    fasilitas: 'Proyektor',
    lokasi: 'Kelas 5B',
    deskripsi: 'Gambar tidak tampil.',
    status: 'Menunggu',
  ),
  DataLaporan(
    id: 'LP002',
    fasilitas: 'AC',
    lokasi: 'Ruang Dosen',
    deskripsi: 'AC tidak dingin.',
    status: 'Dikerjakan',
  ),
];

// ==========================================
// 2. MY APP DAN NAMED ROUTES
// ==========================================

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

      initialRoute: '/',

      routes: {
        '/': (context) => const HalamanUtama(),
        '/form': (context) => const FormLaporan(),
        '/detail': (context) => const DetailLaporan(),
      },
    );
  }
}

// ==========================================
// 3. HALAMAN BERANDA PELAPOR
// ==========================================

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {

  // Membuka form dan menerima laporan baru
  Future<void> _bukaForm() async {
    final hasil = await Navigator.pushNamed(
      context,
      '/form',
    );

    if (!mounted) return;

    if (hasil is DataLaporan) {
      setState(() {
        daftarLaporan.insert(0, hasil);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Laporan berhasil dikirim!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  // Membuka detail laporan
  void _bukaDetail(DataLaporan laporan) {
    Navigator.pushNamed(
      context,
      '/detail',
      arguments: laporan,
    );
  }

  @override
  Widget build(BuildContext context) {
    final jumlahMenunggu = daftarLaporan
        .where((laporan) => laporan.status == 'Menunggu')
        .length;

    final jumlahDikerjakan = daftarLaporan
        .where((laporan) => laporan.status == 'Dikerjakan')
        .length;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lapor Fasilitas FTI',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // HEADER
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
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // RINGKASAN LAPORAN
          const Text(
            'Ringkasan Laporan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: RingkasanLaporan(
                  judul: 'Menunggu',
                  jumlah: jumlahMenunggu,
                  warna: Colors.orange,
                  icon: Icons.hourglass_empty,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: RingkasanLaporan(
                  judul: 'Dikerjakan',
                  jumlah: jumlahDikerjakan,
                  warna: Colors.blue,
                  icon: Icons.build_outlined,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // DAFTAR LAPORAN
          const Text(
            'Daftar Laporan Saya',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          if (daftarLaporan.isEmpty)
            const KeadaanKosong()
          else
            ...daftarLaporan.map(
              (laporan) => KartuLaporan(
                laporan: laporan,
                onTap: () => _bukaDetail(laporan),
              ),
            ),

          const SizedBox(height: 80),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _bukaForm,
        backgroundColor: const Color(0xFF6D28D9),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Buat Laporan'),
      ),
    );
  }
}

// ==========================================
// 4. KOMPONEN RINGKASAN LAPORAN
// ==========================================

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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: warna, size: 28),
            const SizedBox(height: 12),
            Text(
              '$jumlah',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(judul),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 5. KARTU LAPORAN
// ==========================================

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
        contentPadding: const EdgeInsets.all(16),
        leading: const CircleAvatar(
          backgroundColor: Color(0xFFEDE9FE),
          child: Icon(
            Icons.build_outlined,
            color: Color(0xFF6D28D9),
          ),
        ),
        title: Text(
          laporan.fasilitas,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(laporan.lokasi),
              const SizedBox(height: 6),
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

// ==========================================
// 6. CHIP STATUS
// ==========================================

class ChipStatus extends StatelessWidget {
  final String status;

  const ChipStatus({
    super.key,
    required this.status,
  });

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
        style: TextStyle(
          color: warna,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: warna.withOpacity(0.12),
      side: BorderSide.none,
      visualDensity: VisualDensity.compact,
    );
  }
}

// ==========================================
// 7. KEADAAN KOSONG
// ==========================================

class KeadaanKosong extends StatelessWidget {
  const KeadaanKosong({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(32),
      child: Column(
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 60,
            color: Colors.grey,
          ),
          SizedBox(height: 12),
          Text('Belum ada laporan.'),
        ],
      ),
    );
  }
}

// ==========================================
// 8. FORM BUAT LAPORAN
// ==========================================

class FormLaporan extends StatefulWidget {
  const FormLaporan({super.key});

  @override
  State<FormLaporan> createState() => _FormLaporanState();
}

class _FormLaporanState extends State<FormLaporan> {
  final _formKey = GlobalKey<FormState>();

  final _deskripsiController = TextEditingController();

  String? _fasilitasTerpilih;
  String? _lokasiTerpilih;

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

  @override
  void dispose() {
    _deskripsiController.dispose();
    super.dispose();
  }

  // Proses pengiriman laporan
  void _kirimLaporan() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final laporanBaru = DataLaporan(
      id: 'LP${DateTime.now().millisecondsSinceEpoch}',
      fasilitas: _fasilitasTerpilih!,
      lokasi: _lokasiTerpilih!,
      deskripsi: _deskripsiController.text.trim(),
      status: 'Menunggu',
    );

    Navigator.pop(context, laporanBaru);
  }

  // Simulasi tombol lampiran
  void _pesanLampiran(String jenis) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Fitur pemilihan $jenis belum diintegrasikan.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Laporan Kerusakan'),
      ),

      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [

            // JENIS FASILITAS
            const Text(
              'Jenis Fasilitas',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              value: _fasilitasTerpilih,
              decoration: const InputDecoration(
                hintText: 'Pilih jenis fasilitas',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
              items: jenisFasilitas.map((jenis) {
                return DropdownMenuItem<String>(
                  value: jenis,
                  child: Text(jenis),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _fasilitasTerpilih = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Pilih jenis fasilitas terlebih dahulu.';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // LOKASI
            const Text(
              'Lokasi Kerusakan',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              value: _lokasiTerpilih,
              decoration: const InputDecoration(
                hintText: 'Pilih lokasi',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
              items: daftarLokasi.map((lokasi) {
                return DropdownMenuItem<String>(
                  value: lokasi,
                  child: Text(lokasi),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _lokasiTerpilih = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Pilih lokasi kerusakan.';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // DESKRIPSI
            const Text(
              'Deskripsi Kerusakan',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
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

            // LAMPIRAN
            const Text(
              'Lampiran',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  OutlinedButton.icon(
                    onPressed: () => _pesanLampiran('foto'),
                    icon: const Icon(Icons.camera_alt_outlined),
                    label: const Text('Tambah Foto'),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(
                        double.infinity,
                        44,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    onPressed: () => _pesanLampiran('video'),
                    icon: const Icon(Icons.video_library_outlined),
                    label: const Text('Tambah Video (Opsional)'),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(
                        double.infinity,
                        44,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),

      // TOMBOL KIRIM DI BAGIAN BAWAH
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: FilledButton.icon(
              onPressed: _kirimLaporan,
              icon: const Icon(Icons.send),
              label: const Text('Kirim Laporan'),
            ),
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 9. DETAIL LAPORAN
// ==========================================

class DetailLaporan extends StatelessWidget {
  const DetailLaporan({super.key});

  @override
  Widget build(BuildContext context) {

    // Mengambil arguments dari halaman sebelumnya
    final args = ModalRoute.of(context)?.settings.arguments;

    // Memeriksa tipe data arguments
    final laporan = args is DataLaporan ? args : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Laporan'),
      ),

      body: laporan == null
          ? const Center(
              child: Text('Data laporan tidak tersedia.'),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Informasi Laporan',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          'ID Laporan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(laporan.id),

                        const SizedBox(height: 16),

                        const Text(
                          'Jenis Fasilitas',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(laporan.fasilitas),

                        const SizedBox(height: 16),

                        const Text(
                          'Lokasi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(laporan.lokasi),

                        const SizedBox(height: 16),

                        const Text(
                          'Deskripsi Kerusakan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(laporan.deskripsi),

                        const SizedBox(height: 16),

                        const Text(
                          'Status Laporan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),

                        ChipStatus(status: laporan.status),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                FilledButton.tonalIcon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Kembali ke Beranda'),
                ),
              ],
            ),
    );
  }
}
