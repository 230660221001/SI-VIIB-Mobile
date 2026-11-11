void main() {
  runApp(const MyApp());
}

const bool simulasiKosong = false;

final List<Map<String, String>> daftarLaporan = simulasiKosong
    ? <Map<String, String>>[]
    : [
        {
          'judul': 'AC ruang B201 tidak dingin',
          'lokasi': 'Gedung B, Lantai 2',
          'kategori': 'AC',
          'tanggal': '27/10/2026',
          'status': 'Diproses',
        },
        {
          'judul': 'Lampu koridor mati',
          'lokasi': 'Gedung A, Lantai 1',
          'kategori': 'Listrik',
          'tanggal': '28/10/2026',
          'status': 'Menunggu',
        },
        {
          'judul': 'Keran wastafel bocor',
          'lokasi': 'Gedung C, Toilet Lantai 1',
          'kategori': 'Air',
          'tanggal': '20/10/2026',
          'status': 'Selesai',
        },
        {
          'judul': 'Kursi kelas patah',
          'lokasi': 'Gedung A, Ruang A105',
          'kategori': 'Perabot',
          'tanggal': '29/10/2026',
          'status': 'Menunggu',
        },
        {
          'judul': 'Proyektor tidak menyala',
          'lokasi': 'Gedung B, Ruang B102',
          'kategori': 'Lainnya',
          'tanggal': '26/10/2026',
          'status': 'Diproses',
        },
      ];

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
      home: const HalamanDaftarLaporan(),
    );
  }
}

class HalamanDaftarLaporan extends StatelessWidget {
  const HalamanDaftarLaporan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaduan Fasilitas'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: daftarLaporan.isEmpty
          ? const KeadaanKosong()
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 88),
              itemCount: daftarLaporan.length,
              itemBuilder: (context, index) {
                return KartuLaporan(laporan: daftarLaporan[index]);
              },
            ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text('Buat Laporan'),
      ),
    );
  }
}

class KartuLaporan extends StatelessWidget {
  final Map<String, String> laporan;

  const KartuLaporan({super.key, required this.laporan});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    final judul = laporan['judul'] ?? '';
    final lokasi = laporan['lokasi'] ?? '';
    final kategori = laporan['kategori'] ?? '';
    final tanggal = laporan['tanggal'] ?? '';
    final status = laporan['status'] ?? '';

    final warna = status == 'Selesai'
        ? cs.primary
        : status == 'Diproses'
        ? cs.tertiary
        : cs.outline;
    final ikon = status == 'Selesai'
        ? Icons.check_circle
        : status == 'Diproses'
        ? Icons.autorenew
        : Icons.schedule;

    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Icon(ikonKategori(kategori), size: 32, color: cs.primary),
        title: Text(
          judul,
          style: teks.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '$lokasi\n$kategori  -  $tanggal',
          style: teks.bodySmall,
        ),
        isThreeLine: true,

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(ikon, size: 18, color: warna),
            const SizedBox(width: 4),
            Text(
              status,
              style: teks.labelLarge?.copyWith(
                color: warna,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KeadaanKosong extends StatelessWidget {
  const KeadaanKosong({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.inbox_outlined, size: 96, color: cs.outline),
            const SizedBox(height: 16),
            Text('Belum ada laporan', style: teks.titleLarge),
            const SizedBox(height: 8),
            Text(
              'Ketuk Buat Laporan untuk melaporkan kerusakan fasilitas.',
              style: teks.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
