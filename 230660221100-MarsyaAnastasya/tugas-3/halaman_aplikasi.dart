import 'package:flutter/material.dart';

void main() {
  runApp(const LaporFtiApp());
}

const Color navy = Color(0xFF172554);
const Color blue = Color(0xFF3B82F6);
const Color bg = Color(0xFFF4F7FC);
const Color green = Color(0xFF059669);
const Color orange = Color(0xFFEA580C);
const Color red = Color(0xFFDC2626);

class LaporFtiApp extends StatelessWidget {
  const LaporFtiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lapor Fasilitas FTI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: bg,
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        appBarTheme: const AppBarTheme(
          backgroundColor: bg,
          foregroundColor: navy,
          elevation: 0,
          centerTitle: false,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: Color(0xFFE2E8F0),
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
      ),
      home: const BerandaPage(),
    );
  }
}

class Laporan {
  final String fasilitas;
  final String lokasi;
  final String deskripsi;
  final String tanggal;
  String status;

  Laporan({
    required this.fasilitas,
    required this.lokasi,
    required this.deskripsi,
    required this.tanggal,
    this.status = 'Menunggu',
  });
}

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  int halaman = 0;

  final List<Laporan> laporan = [
    Laporan(
      fasilitas: 'Proyektor',
      lokasi: 'Ruang Kelas 201',
      deskripsi: 'Proyektor tidak dapat menampilkan gambar.',
      tanggal: '26 Okt 2026',
    ),
    Laporan(
      fasilitas: 'AC',
      lokasi: 'Ruang Kelas 105',
      deskripsi: 'AC kurang dingin saat digunakan.',
      tanggal: '25 Okt 2026',
      status: 'Dikerjakan',
    ),
    Laporan(
      fasilitas: 'Kursi',
      lokasi: 'Laboratorium Komputer',
      deskripsi: 'Terdapat kursi yang rusak.',
      tanggal: '24 Okt 2026',
      status: 'Selesai',
    ),
    Laporan(
      fasilitas: 'Lampu',
      lokasi: 'Ruang Kelas 202',
      deskripsi: 'Lampu ruangan tidak menyala dengan baik.',
      tanggal: '23 Okt 2026',
      status: 'Menunggu',
    ),
  ];

  Future<void> bukaForm() async {
    final hasil = await Navigator.push<Laporan>(
      context,
      MaterialPageRoute(
        builder: (context) => const FormLaporanPage(),
      ),
    );

    if (!mounted || hasil == null) return;

    setState(() {
      laporan.insert(0, hasil);
      halaman = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(
              backgroundColor: navy,
              child: Icon(
                Icons.apartment_rounded,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lapor Fasilitas',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: navy,
                  ),
                ),
                Text(
                  'Fakultas Teknologi Informasi',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: halaman,
          children: [
            halamanBeranda(),
            halamanLaporan(),
            halamanPanduan(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: bukaForm,
        backgroundColor: navy,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_rounded),
        label: const Text('Buat Laporan'),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: halaman,
        onDestinationSelected: (index) {
          setState(() => halaman = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),
            selectedIcon: Icon(Icons.assignment_rounded),
            label: 'Laporan',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book_rounded),
            label: 'Panduan',
          ),
        ],
      ),
    );
  }

  Widget halamanBeranda() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 100),
      children: [
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [navy, blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.campaign_rounded,
                color: Colors.white,
                size: 34,
              ),
              SizedBox(height: 18),
              Text(
                'Fasilitas Bermasalah?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Laporkan kerusakan fasilitas kampus agar dapat segera ditindaklanjuti.',
                style: TextStyle(
                  color: Colors.white,
                  height: 1.5,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: 18,
                  ),
                  SizedBox(width: 7),
                  Text(
                    'Mudah • Cepat • Transparan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          'Ringkasan Laporan',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: navy,
          ),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: kartuRingkasan(
                'Total',
                laporan.length.toString(),
                Icons.assignment_rounded,
                blue,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: kartuRingkasan(
                'Dikerjakan',
                laporan
                    .where((item) => item.status == 'Dikerjakan')
                    .length
                    .toString(),
                Icons.sync_rounded,
                orange,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: kartuRingkasan(
                'Selesai',
                laporan
                    .where((item) => item.status == 'Selesai')
                    .length
                    .toString(),
                Icons.check_circle_rounded,
                green,
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Laporan Terbaru',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: navy,
              ),
            ),
            TextButton(
              onPressed: () => setState(() => halaman = 1),
              child: const Text('Lihat Semua'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (laporan.isEmpty)
          const Center(child: Text('Belum ada laporan.'))
        else
          ...laporan.take(3).map(kartuLaporan),
      ],
    );
  }

  Widget kartuRingkasan(
    String judul,
    String angka,
    IconData ikon,
    Color warna,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 17,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),
      child: Column(
        children: [
          Icon(ikon, color: warna, size: 25),
          const SizedBox(height: 10),
          Text(
            angka,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: navy,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            judul,
            style: const TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget kartuLaporan(Laporan item) {
    final Color warna;

    switch (item.status) {
      case 'Selesai':
        warna = green;
        break;
      case 'Dikerjakan':
        warna = orange;
        break;
      default:
        warna = blue;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(11),
                decoration: BoxDecoration(
                  color: warna.withAlpha(25),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.build_rounded,
                  color: warna,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.fasilitas,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: navy,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.lokasi,
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuButton<String>(
                tooltip: 'Ubah status',
                onSelected: (status) {
                  setState(() => item.status = status);
                },
                itemBuilder: (context) => const [
                  PopupMenuItem(
                    value: 'Menunggu',
                    child: Text('Menunggu'),
                  ),
                  PopupMenuItem(
                    value: 'Dikerjakan',
                    child: Text('Dikerjakan'),
                  ),
                  PopupMenuItem(
                    value: 'Selesai',
                    child: Text('Selesai'),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 13),
          Text(
            item.deskripsi,
            style: const TextStyle(height: 1.4),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(
                Icons.calendar_today_rounded,
                size: 14,
                color: Colors.blueGrey,
              ),
              const SizedBox(width: 6),
              Text(
                item.tanggal,
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: warna.withAlpha(25),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  item.status,
                  style: TextStyle(
                    color: warna,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget halamanLaporan() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 100),
      children: [
        const Text(
          'Daftar Laporan',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: navy,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          '${laporan.length} laporan fasilitas tercatat',
          style: const TextStyle(color: Colors.blueGrey),
        ),
        const SizedBox(height: 20),
        if (laporan.isEmpty)
          const Padding(
            padding: EdgeInsets.all(30),
            child: Center(
              child: Text('Belum ada laporan fasilitas.'),
            ),
          )
        else
          ...laporan.map(kartuLaporan),
      ],
    );
  }

  Widget halamanPanduan() {
    final List<Map<String, dynamic>> panduan = [
      {
        'ikon': Icons.edit_note_rounded,
        'judul': '1. Buat laporan',
        'deskripsi':
            'Tekan tombol Buat Laporan untuk mengisi formulir.',
      },
      {
        'ikon': Icons.location_on_outlined,
        'judul': '2. Isi lokasi',
        'deskripsi':
            'Pilih fasilitas dan tuliskan lokasi kerusakan.',
      },
      {
        'ikon': Icons.description_outlined,
        'judul': '3. Jelaskan masalah',
        'deskripsi':
            'Berikan keterangan yang jelas tentang kerusakan.',
      },
      {
        'ikon': Icons.track_changes_rounded,
        'judul': '4. Pantau status',
        'deskripsi':
            'Lihat status laporan pada menu Laporan.',
      },
    ];

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 100),
      children: [
        const Text(
          'Panduan Penggunaan',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: navy,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Ikuti langkah berikut untuk melaporkan fasilitas kampus.',
          style: TextStyle(
            color: Colors.blueGrey,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 22),
        ...panduan.map(
          (item) => Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: const Color(0xFFE2E8F0),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  item['ikon'] as IconData,
                  color: blue,
                  size: 30,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['judul'] as String,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: navy,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        item['deskripsi'] as String,
                        style: const TextStyle(
                          height: 1.5,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FormLaporanPage extends StatefulWidget {
  const FormLaporanPage({super.key});

  @override
  State<FormLaporanPage> createState() => _FormLaporanPageState();
}

class _FormLaporanPageState extends State<FormLaporanPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController lokasiController =
      TextEditingController();
  final TextEditingController deskripsiController =
      TextEditingController();

  String? fasilitas;

  final List<String> pilihanFasilitas = [
    'AC',
    'Proyektor',
    'Kursi',
    'Meja',
    'Komputer',
    'Jaringan Internet',
    'Lampu',
    'Papan Tulis',
    'Lainnya',
  ];

  @override
  void dispose() {
    lokasiController.dispose();
    deskripsiController.dispose();
    super.dispose();
  }

  void kirimLaporan() {
    if (!_formKey.currentState!.validate()) return;

    final sekarang = DateTime.now();
    final tanggal =
        '${sekarang.day.toString().padLeft(2, '0')} '
        '${_namaBulan(sekarang.month)} ${sekarang.year}';

    final hasil = Laporan(
      fasilitas: fasilitas!,
      lokasi: lokasiController.text.trim(),
      deskripsi: deskripsiController.text.trim(),
      tanggal: tanggal,
    );

    Navigator.pop(context, hasil);
  }

  String _namaBulan(int bulan) {
    const namaBulan = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des',
    ];

    return namaBulan[bulan - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Buat Laporan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: navy,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.post_add_rounded,
                    color: Colors.white,
                    size: 34,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Laporkan Fasilitas',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'Lengkapi informasi di bawah ini agar laporan mudah ditindaklanjuti.',
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Jenis Fasilitas',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: navy,
              ),
            ),
            const SizedBox(height: 9),
            DropdownButtonFormField<String>(
              value: fasilitas,
              isExpanded: true,
              decoration: const InputDecoration(
                hintText: 'Pilih fasilitas',
                prefixIcon: Icon(Icons.category_outlined),
              ),
              items: pilihanFasilitas.map((nama) {
                return DropdownMenuItem<String>(
                  value: nama,
                  child: Text(nama),
                );
              }).toList(),
              onChanged: (nilai) {
                setState(() => fasilitas = nilai);
              },
              validator: (nilai) {
                if (nilai == null || nilai.isEmpty) {
                  return 'Silakan pilih jenis fasilitas';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Lokasi Fasilitas',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: navy,
              ),
            ),
            const SizedBox(height: 9),
            TextFormField(
              controller: lokasiController,
              decoration: const InputDecoration(
                hintText: 'Contoh: Ruang Kelas 201',
                prefixIcon: Icon(Icons.location_on_outlined),
              ),
              validator: (nilai) {
                if (nilai == null || nilai.trim().isEmpty) {
                  return 'Lokasi wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Deskripsi Kerusakan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: navy,
              ),
            ),
            const SizedBox(height: 9),
            TextFormField(
              controller: deskripsiController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText:
                    'Jelaskan masalah fasilitas secara rinci...',
                alignLabelWithHint: true,
              ),
              validator: (nilai) {
                if (nilai == null || nilai.trim().isEmpty) {
                  return 'Deskripsi kerusakan wajib diisi';
                }
                if (nilai.trim().length < 10) {
                  return 'Deskripsi minimal 10 karakter';
                }
                return null;
              },
            ),
            const SizedBox(height: 28),
            SizedBox(
              height: 54,
              child: ElevatedButton.icon(
                onPressed: kirimLaporan,
                style: ElevatedButton.styleFrom(
                  backgroundColor: navy,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                icon: const Icon(Icons.send_rounded),
                label: const Text(
                  'Kirim Laporan',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 