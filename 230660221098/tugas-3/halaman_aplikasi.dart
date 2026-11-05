void main() {
  runApp(const MyApp());
}

final List<Map<String, String>> daftarLaporan = [
  {
    'judul': 'AC ruang B201 tidak dingin',
    'lokasi': 'Gedung B, Lantai 2',
    'kategori': 'AC',
    'status': 'Diproses',
  },
  {
    'judul': 'Lampu koridor mati',
    'lokasi': 'Gedung A, Lantai 1',
    'kategori': 'Listrik',
    'status': 'Menunggu',
  },
  {
    'judul': 'Keran wastafel bocor',
    'lokasi': 'Gedung C, Toilet Lantai 1',
    'kategori': 'Air',
    'status': 'Selesai',
  },
  {
    'judul': 'Kursi kelas patah',
    'lokasi': 'Gedung A, Ruang A105',
    'kategori': 'Perabot',
    'status': 'Menunggu',
  },
  {
    'judul': 'Proyektor tidak menyala',
    'lokasi': 'Gedung B, Ruang B102',
    'kategori': 'Lainnya',
    'status': 'Diproses',
  },
];

int hitungStatus(String status) =>
    daftarLaporan.where((l) => l['status'] == status).length;

Color warnaStatus(String status) {
  switch (status) {
    case 'Diproses':
      return Colors.orange;
    case 'Selesai':
      return Colors.green;
    default:
      return Colors.grey;
  }
}

IconData ikonKategori(String kategori) {
  switch (kategori) {
    case 'AC':
      return Icons.ac_unit;
    case 'Listrik':
      return Icons.lightbulb_outline;
    case 'Air':
      return Icons.water_drop_outlined;
    case 'Perabot':
      return Icons.chair_outlined;
    default:
      return Icons.build_outlined;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pengaduan Fasilitas Kampus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaduan Fasilitas'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: KartuRingkasan(
                    label: 'Menunggu',
                    jumlah: hitungStatus('Menunggu'),
                    warna: warnaStatus('Menunggu'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: KartuRingkasan(
                    label: 'Diproses',
                    jumlah: hitungStatus('Diproses'),
                    warna: warnaStatus('Diproses'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: KartuRingkasan(
                    label: 'Selesai',
                    jumlah: hitungStatus('Selesai'),
                    warna: warnaStatus('Selesai'),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Laporan Terbaru',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: daftarLaporan.length,
              itemBuilder: (context, index) {
                return BarisLaporan(laporan: daftarLaporan[index]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text('Buat Laporan'),
      ),
    );
  }
}

class KartuRingkasan extends StatelessWidget {
  final String label;
  final int jumlah;
  final Color warna;

  const KartuRingkasan({
    super.key,
    required this.label,
    required this.jumlah,
    required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            Text(
              '$jumlah',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: warna,
              ),
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}

class BarisLaporan extends StatelessWidget {
  final Map<String, String> laporan;

  const BarisLaporan({super.key, required this.laporan});

  @override
  Widget build(BuildContext context) {
    final judul = laporan['judul'] ?? '';
    final lokasi = laporan['lokasi'] ?? '';
    final kategori = laporan['kategori'] ?? '';
    final status = laporan['status'] ?? '';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(ikonKategori(kategori), size: 32),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    judul,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(lokasi),
                ],
              ),
            ),
            Text(
              status,
              style: TextStyle(
                color: warnaStatus(status),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
