void main() {
  runApp(const MyApp());
}

class Rute {
  static const String daftar = '/';
  static const String detail = '/detail';
  static const String form = '/form';
}

const List<String> kategoriList = [
  'AC',
  'Listrik',
  'Air',
  'Perabot',
  'Lainnya',
];

String formatTanggal(DateTime t) => '${t.day}/${t.month}/${t.year}';

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

Color warnaStatus(ColorScheme cs, String status) => status == 'Selesai'
    ? cs.primary
    : status == 'Diproses'
    ? cs.tertiary
    : cs.outline;

IconData ikonStatus(String status) => status == 'Selesai'
    ? Icons.check_circle
    : status == 'Diproses'
    ? Icons.autorenew
    : Icons.schedule;

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
      initialRoute: Rute.daftar,
      routes: {
        Rute.daftar: (context) => const HalamanDaftarLaporan(),
        Rute.detail: (context) => const HalamanDetailLaporan(),
        Rute.form: (context) => const HalamanFormLaporan(),
      },
    );
  }
}

class HalamanDaftarLaporan extends StatefulWidget {
  const HalamanDaftarLaporan({super.key});

  @override
  State<HalamanDaftarLaporan> createState() => _HalamanDaftarLaporanState();
}

class _HalamanDaftarLaporanState extends State<HalamanDaftarLaporan> {
  final List<Map<String, String>> _laporan = [
    {
      'judul': 'AC ruang B201 tidak dingin',
      'lokasi': 'Gedung B, Lantai 2',
      'kategori': 'AC',
      'tanggal': '27/10/2026',
      'status': 'Diproses',
      'deskripsi': 'AC menyala tetapi tidak mengeluarkan udara dingin sejak minggu lalu.',
    },
    {
      'judul': 'Lampu koridor mati',
      'lokasi': 'Gedung A, Lantai 1',
      'kategori': 'Listrik',
      'tanggal': '28/10/2026',
      'status': 'Menunggu',
      'deskripsi':
          'Dua lampu koridor padam sehingga area gelap saat sore hari.',
    },
    {
      'judul': 'Keran wastafel bocor',
      'lokasi': 'Gedung C, Toilet Lantai 1',
      'kategori': 'Air',
      'tanggal': '20/10/2026',
      'status': 'Selesai',
      'deskripsi': 'Keran terus menetes dan membuat lantai basah.',
    },
  ];

  Future<void> _bukaForm() async {
    final hasil = await Navigator.pushNamed(context, Rute.form);
    if (!mounted) return;
    if (hasil is Map<String, String>) {
      setState(() => _laporan.insert(0, hasil));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Laporan "${hasil['judul']}" berhasil dikirim'),
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaduan Fasilitas'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _laporan.isEmpty
          ? const KeadaanKosong()
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 88),
              itemCount: _laporan.length,
              itemBuilder: (context, index) {
                final l = _laporan[index];
                return KartuLaporan(
                  laporan: l,

                  onTap: () =>
                      Navigator.pushNamed(context, Rute.detail, arguments: l),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _bukaForm,
        icon: const Icon(Icons.add),
        label: const Text('Buat Laporan'),
      ),
    );
  }
}

class KartuLaporan extends StatelessWidget {
  final Map<String, String> laporan;
  final VoidCallback onTap;

  const KartuLaporan({super.key, required this.laporan, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;
    final status = laporan['status'] ?? '';
    final warna = warnaStatus(cs, status);

    return Card(
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Icon(
          ikonKategori(laporan['kategori'] ?? ''),
          size: 32,
          color: cs.primary,
        ),
        title: Text(
          laporan['judul'] ?? '',
          style: teks.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${laporan['lokasi'] ?? ''}\n${laporan['kategori'] ?? ''}  -  ${laporan['tanggal'] ?? ''}',
          style: teks.bodySmall,
        ),
        isThreeLine: true,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(ikonStatus(status), size: 18, color: warna),
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

class HalamanDetailLaporan extends StatelessWidget {
  const HalamanDetailLaporan({super.key});

  Widget _halamanGalat(BuildContext context, String pesan) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Laporan')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(pesan, textAlign: TextAlign.center),
        ),
      ),
    );
  }

  Widget _baris(String label, String isi) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 2),
          Text(isi, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    if (args == null) {
      return _halamanGalat(context, 'Tidak ada data laporan yang dikirim.');
    }

    if (args is! Map<String, String>) {
      return _halamanGalat(context, 'Format data laporan tidak dikenali.');
    }

    final cs = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;
    final status = args['status'] ?? '';
    final warna = warnaStatus(cs, status);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Laporan'),
        backgroundColor: cs.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(args['judul'] ?? '', style: teks.headlineSmall),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(ikonStatus(status), size: 20, color: warna),
              const SizedBox(width: 6),
              Text(
                status,
                style: teks.titleMedium?.copyWith(
                  color: warna,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _baris('Kategori', args['kategori'] ?? '-'),
                  _baris('Lokasi', args['lokasi'] ?? '-'),
                  _baris('Tanggal', args['tanggal'] ?? '-'),
                  _baris('Deskripsi', args['deskripsi'] ?? '-'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          FilledButton.tonal(
            onPressed: () => Navigator.pop(context),
            child: const Text('Kembali ke Daftar'),
          ),
        ],
      ),
    );
  }
}

class HalamanFormLaporan extends StatefulWidget {
  const HalamanFormLaporan({super.key});

  @override
  State<HalamanFormLaporan> createState() => _HalamanFormLaporanState();
}

class _HalamanFormLaporanState extends State<HalamanFormLaporan> {
  final _formKey = GlobalKey<FormState>();
  final _judulCtrl = TextEditingController();
  final _lokasiCtrl = TextEditingController();
  final _deskripsiCtrl = TextEditingController();
  String? _kategori;

  @override
  void dispose() {
    _judulCtrl.dispose();
    _lokasiCtrl.dispose();
    _deskripsiCtrl.dispose();
    super.dispose();
  }

  void _kirim() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final laporan = <String, String>{
      'judul': _judulCtrl.text.trim(),
      'lokasi': _lokasiCtrl.text.trim(),
      'kategori': _kategori ?? '',
      'tanggal': formatTanggal(DateTime.now()),
      'status': 'Menunggu',
      'deskripsi': _deskripsiCtrl.text.trim(),
    };

    Navigator.pop(context, laporan);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Laporan'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _judulCtrl,
              decoration: const InputDecoration(
                labelText: 'Judul laporan',
                border: OutlineInputBorder(),
              ),
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return 'Judul wajib diisi';
                }
                if (v.trim().length < 5) {
                  return 'Judul minimal 5 karakter';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Kategori',
                border: OutlineInputBorder(),
              ),
              items: kategoriList
                  .map(
                    (k) => DropdownMenuItem<String>(value: k, child: Text(k)),
                  )
                  .toList(),
              onChanged: (v) => setState(() => _kategori = v),
              validator: (v) => v == null ? 'Pilih salah satu kategori' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _lokasiCtrl,
              decoration: const InputDecoration(
                labelText: 'Lokasi (gedung, lantai, ruang)',
                border: OutlineInputBorder(),
              ),
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return 'Lokasi wajib diisi';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _deskripsiCtrl,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Deskripsi kerusakan',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return 'Deskripsi wajib diisi';
                }
                if (v.trim().length < 10) {
                  return 'Deskripsi minimal 10 karakter';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _kirim,
              icon: const Icon(Icons.send),
              label: const Text('Kirim Laporan'),
            ),
          ],
        ),
      ),
    );
  }
}
