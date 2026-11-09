
import 'package:flutter/material.dart';

void main() {
  runApp(const AkademikPKBMApp());
}

const Color navy = Color(0xFF172554);
const Color blue = Color(0xFF3B82F6);
const Color bg = Color(0xFFF4F7FC);
const Color green = Color(0xFF059669);
const Color orange = Color(0xFFEA580C);

class AkademikPKBMApp extends StatelessWidget {
  const AkademikPKBMApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Akademik PKBM Al Qosimmiyah',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: bg,
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AkademikHome(),
        '/nilai': (context) =>
            const AkademikHome(initialTab: 1),
        '/jadwal': (context) =>
            const AkademikHome(initialTab: 2),
        '/ujian': (context) =>
            const AkademikHome(initialTab: 3),
        '/detail-nilai': (context) {
          final data = ModalRoute.of(context)!.settings.arguments
              as DetailNilaiArgs;

          return DetailNilaiPage(data: data);
        },
      },
    );
  }
}

// MODEL DATA DETAIL NILAI
class DetailNilaiArgs {
  final String mapel;
  final int nilai;
  final String kode;

  DetailNilaiArgs({
    required this.mapel,
    required this.nilai,
    required this.kode,
  });
}

class AkademikHome extends StatefulWidget {
  final int initialTab;

  const AkademikHome({
    super.key,
    this.initialTab = 0,
  });

  @override
  State<AkademikHome> createState() => _AkademikHomeState();
}

class _AkademikHomeState extends State<AkademikHome> {
  int halaman = 0;

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>();

  final TextEditingController _mapelController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    halaman = widget.initialTab;
  }

  @override
  void dispose() {
    _mapelController.dispose();
    super.dispose();
  }

  // DATA NILAI AKADEMIK
  final List<Map<String, dynamic>> nilai = [
    {'mapel': 'Matematika', 'nilai': 88, 'kode': 'MTK'},
    {'mapel': 'Bahasa Indonesia', 'nilai': 90, 'kode': 'BIN'},
    {'mapel': 'IPA', 'nilai': 85, 'kode': 'IPA'},
    {'mapel': 'Bahasa Inggris', 'nilai': 92, 'kode': 'BIG'},
  ];

  // DATA JADWAL PELAJARAN
  final List<Map<String, String>> pelajaran = [
    {
      'hari': 'SENIN',
      'jam': '07.30 - 09.00',
      'mapel': 'Matematika',
      'guru': 'Tutor Matematika',
    },
    {
      'hari': 'SENIN',
      'jam': '09.15 - 10.45',
      'mapel': 'Bahasa Indonesia',
      'guru': 'Tutor Bahasa Indonesia',
    },
    {
      'hari': 'SELASA',
      'jam': '07.30 - 09.00',
      'mapel': 'IPA',
      'guru': 'Tutor IPA',
    },
    {
      'hari': 'RABU',
      'jam': '08.00 - 09.30',
      'mapel': 'Bahasa Inggris',
      'guru': 'Tutor Bahasa Inggris',
    },
    {
      'hari': 'KAMIS',
      'jam': '09.00 - 10.30',
      'mapel': 'Pendidikan Pancasila',
      'guru': 'Tutor Pendidikan Pancasila',
    },
  ];

  // DATA JADWAL UJIAN
  final List<Map<String, String>> ujian = [
    {
      'tanggal': '02',
      'bulan': 'NOV',
      'mapel': 'Matematika',
      'hari': 'Senin',
      'jam': '08.00 - 10.00',
    },
    {
      'tanggal': '03',
      'bulan': 'NOV',
      'mapel': 'Bahasa Indonesia',
      'hari': 'Selasa',
      'jam': '08.00 - 10.00',
    },
    {
      'tanggal': '04',
      'bulan': 'NOV',
      'mapel': 'IPA',
      'hari': 'Rabu',
      'jam': '08.00 - 10.00',
    },
    {
      'tanggal': '05',
      'bulan': 'NOV',
      'mapel': 'Bahasa Inggris',
      'hari': 'Kamis',
      'jam': '08.00 - 10.00',
    },
  ];

  // FUNGSI PENCARIAN DETAIL NILAI
  void cariDetailNilai() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final String namaMapel =
        _mapelController.text.trim().toLowerCase();

    final hasil = nilai.where((item) {
      return (item['mapel'] as String).toLowerCase() ==
          namaMapel;
    }).toList();

    if (hasil.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mata pelajaran tidak ditemukan.'),
        ),
      );
      return;
    }

    final item = hasil.first;

    Navigator.pushNamed(
      context,
      '/detail-nilai',
      arguments: DetailNilaiArgs(
        mapel: item['mapel'] as String,
        nilai: item['nilai'] as int,
        kode: item['kode'] as String,
      ),
    );

    _mapelController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: navy,
        elevation: 0,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: navy,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.school_rounded,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'PKBM Al Qosimmiyah',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Notifikasi',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Belum ada notifikasi baru.'),
                ),
              );
            },
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: halaman,
          children: [
            halamanBeranda(),
            halamanNilai(),
            halamanPelajaran(),
            halamanUjian(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: halaman,
        onDestinationSelected: (index) {
          setState(() => halaman = index);
        },
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFDBEAFE),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_rounded),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'Nilai',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book_rounded),
            label: 'Pelajaran',
          ),
          NavigationDestination(
            icon: Icon(Icons.event_note_outlined),
            selectedIcon: Icon(Icons.event_note_rounded),
            label: 'Ujian',
          ),
        ],
      ),
    );
  }

  // BERANDA
  Widget halamanBeranda() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'SELAMAT DATANG 👋',
          style: TextStyle(
            color: blue,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 7),
        const Text(
          'Semangat Belajar, Warga Belajar!',
          style: TextStyle(
            color: navy,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [navy, Color(0xFF3157A4)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Row(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(
                  Icons.school_rounded,
                  color: Colors.white,
                  size: 34,
                ),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PUSAT KEGIATAN BELAJAR MASYARAKAT',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 9,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'PKBM Al Qosimmiyah',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Layanan Informasi Akademik',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 26),
        judulBagian('Layanan Akademik', '3 Layanan'),
        const SizedBox(height: 14),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: kartuMenu(
                'Nilai Akademik',
                'Lihat hasil belajar',
                Icons.bar_chart_rounded,
                const Color(0xFFDBEAFE),
                blue,
                1,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: kartuMenu(
                'Jadwal Pelajaran',
                'Jadwal kegiatan belajar',
                Icons.menu_book_rounded,
                const Color(0xFFD1FAE5),
                green,
                2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        kartuMenu(
          'Jadwal Ujian',
          'Informasi tanggal dan waktu ujian',
          Icons.event_available_rounded,
          const Color(0xFFFFEDD5),
          orange,
          3,
          horizontal: true,
        ),
        const SizedBox(height: 26),
        judulBagian('Ujian Mendatang', 'Lihat jadwal'),
        const SizedBox(height: 12),
        if (ujian.isNotEmpty) kartuUjian(ujian.first),
        const SizedBox(height: 18),
        const Center(
          child: Text(
            'Aplikasi Akademik PKBM Al Qosimmiyah',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }

  // NILAI AKADEMIK
  Widget halamanNilai() {
    final double rata = nilai
            .map((item) => item['nilai'] as int)
            .reduce((a, b) => a + b) /
        nilai.length;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        judulBagian('Nilai Akademik', 'Semester Ganjil'),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: navy,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'RATA-RATA NILAI',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                rata.toStringAsFixed(1),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Dari ${nilai.length} mata pelajaran',
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // FORM INTERAKSI TUGAS 6
        Container(
          padding: const EdgeInsets.all(16),
          decoration: kartuStyle(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Cari Detail Nilai',
                  style: TextStyle(
                    color: navy,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Masukkan nama mata pelajaran untuk melihat detail nilai.',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _mapelController,
                  decoration: InputDecoration(
                    hintText: 'Contoh: Matematika',
                    prefixIcon: const Icon(
                      Icons.menu_book_rounded,
                      color: blue,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: Color(0xFFE8EDF5),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: blue,
                        width: 1.5,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty) {
                      return 'Nama mata pelajaran wajib diisi.';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: cariDetailNilai,
                    icon: const Icon(Icons.search_rounded),
                    label: const Text('Lihat Detail Nilai'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: navy,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Rincian Mata Pelajaran',
          style: TextStyle(
            color: navy,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 12),
        ...nilai.map((item) {
          final int angka = item['nilai'] as int;

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: kartuStyle(),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0E7FF),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    item['kode'] as String,
                    style: const TextStyle(
                      color: navy,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    item['mapel'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  '$angka',
                  style: TextStyle(
                    color: warnaNilai(angka),
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  // JADWAL PELAJARAN
  Widget halamanPelajaran() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        judulBagian('Jadwal Pelajaran', 'Mingguan'),
        const SizedBox(height: 8),
        const Text(
          'Lihat jadwal kegiatan belajar warga belajar.',
          style: TextStyle(color: Colors.blueGrey),
        ),
        const SizedBox(height: 24),
        ...pelajaran.map((item) {
          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(16),
            decoration: kartuStyle(),
            child: Row(
              children: [
                Container(
                  width: 55,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDBEAFE),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.menu_book_rounded,
                    color: blue,
                    size: 27,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['hari']!,
                        style: const TextStyle(
                          color: blue,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        item['mapel']!,
                        style: const TextStyle(
                          color: navy,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${item['jam']} • ${item['guru']}',
                        style: const TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  // JADWAL UJIAN
  Widget halamanUjian() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        judulBagian('Jadwal Ujian', 'Semester Ganjil'),
        const SizedBox(height: 8),
        const Text(
          'Periksa jadwal ujian dan persiapkan diri dengan baik.',
          style: TextStyle(color: Colors.blueGrey),
        ),
        const SizedBox(height: 22),
        ...ujian.map((item) => kartuUjian(item)),
      ],
    );
  }

  // KARTU UJIAN
  Widget kartuUjian(Map<String, String> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: kartuStyle(),
      child: Row(
        children: [
          Container(
            width: 65,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEDD5),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              children: [
                Text(
                  item['tanggal']!,
                  style: const TextStyle(
                    color: Color(0xFF9A3412),
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  item['bulan']!,
                  style: const TextStyle(
                    color: Color(0xFF9A3412),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['mapel']!,
                  style: const TextStyle(
                    color: navy,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${item['hari']} • ${item['jam']}',
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.event_note_rounded,
            color: orange,
          ),
        ],
      ),
    );
  }

  // KOMPONEN MENU
  Widget kartuMenu(
    String judul,
    String deskripsi,
    IconData ikon,
    Color latar,
    Color warna,
    int tujuan, {
    bool horizontal = false,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        setState(() {
          halaman = tujuan;
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: kartuStyle(),
        child: horizontal
            ? Row(
                children: [
                  kotakIkon(ikon, latar, warna),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          judul,
                          style: const TextStyle(
                            color: navy,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          deskripsi,
                          style: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: navy,
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kotakIkon(ikon, latar, warna),
                  const SizedBox(height: 16),
                  Text(
                    judul,
                    style: const TextStyle(
                      color: navy,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    deskripsi,
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  // KOTAK IKON
  Widget kotakIkon(
    IconData ikon,
    Color latar,
    Color warna,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: latar,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Icon(
        ikon,
        color: warna,
        size: 26,
      ),
    );
  }

  // JUDUL BAGIAN
  Widget judulBagian(
    String judul,
    String keterangan,
  ) {
    return Row(
      children: [
        Expanded(
          child: Text(
            judul,
            style: const TextStyle(
              color: navy,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          keterangan,
          style: const TextStyle(
            color: blue,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // STYLE KARTU
  BoxDecoration kartuStyle() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(
        color: const Color(0xFFE8EDF5),
      ),
      boxShadow: [
        BoxShadow(
          color: navy.withValues(alpha: 0.025),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  // WARNA NILAI
  Color warnaNilai(int angka) {
    if (angka >= 90) return green;
    if (angka >= 80) return blue;
    return orange;
  }
}

// HALAMAN DETAIL NILAI
class DetailNilaiPage extends StatelessWidget {
  final DetailNilaiArgs data;

  const DetailNilaiPage({
    super.key,
    required this.data,
  });

  Color warnaNilai(int angka) {
    if (angka >= 90) return green;
    if (angka >= 80) return blue;
    return orange;
  }

  String keteranganNilai(int angka) {
    if (angka >= 90) return 'Sangat Baik';
    if (angka >= 80) return 'Baik';
    if (angka >= 70) return 'Cukup';
    return 'Perlu Ditingkatkan';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: navy,
        elevation: 0,
        title: const Text(
          'Detail Nilai',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: navy,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.school_rounded,
                  color: Colors.white,
                  size: 45,
                ),
                const SizedBox(height: 14),
                const Text(
                  'NILAI AKADEMIK',
                  style: TextStyle(
                    color: Colors.white70,
                    letterSpacing: 1.2,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '${data.nilai}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  data.mapel,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: const Color(0xFFE8EDF5),
              ),
            ),
            child: Column(
              children: [
                detailBaris('Mata Pelajaran', data.mapel),
                const Divider(height: 24),
                detailBaris('Kode Pelajaran', data.kode),
                const Divider(height: 24),
                detailBaris('Semester', 'Ganjil'),
                const Divider(height: 24),
                detailBaris(
                  'Nilai',
                  '${data.nilai}',
                  warna: warnaNilai(data.nilai),
                ),
                const Divider(height: 24),
                detailBaris(
                  'Keterangan',
                  keteranganNilai(data.nilai),
                  warna: warnaNilai(data.nilai),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded),
              label: const Text('Kembali ke Nilai Akademik'),
              style: ElevatedButton.styleFrom(
                backgroundColor: navy,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // KOMPONEN BARIS DETAIL
  Widget detailBaris(
    String judul,
    String isi, {
    Color warna = navy,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            judul,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 13,
            ),
          ),
        ),
        Flexible(
          child: Text(
            isi,
            textAlign: TextAlign.end,
            style: TextStyle(
              color: warna,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
