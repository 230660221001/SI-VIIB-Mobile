import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Laporan {
  final String id;
  final String judul;
  final String kategori;
  final String lokasi;
  final String deskripsi;
  final DateTime tanggal;
  final String status;

  const Laporan({
    required this.id,
    required this.judul,
    required this.kategori,
    required this.lokasi,
    required this.deskripsi,
    required this.tanggal,
    required this.status,
  });

  Laporan copyWith({
    String? judul,
    String? kategori,
    String? lokasi,
    String? deskripsi,
    String? status,
  }) {
    return Laporan(
      id: id,
      judul: judul ?? this.judul,
      kategori: kategori ?? this.kategori,
      lokasi: lokasi ?? this.lokasi,
      deskripsi: deskripsi ?? this.deskripsi,
      tanggal: tanggal,
      status: status ?? this.status,
    );
  }

  @override
  String toString() =>
      'Laporan(id: $id, judul: $judul, kategori: $kategori, status: $status)';
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
      home: const HalamanDaftarLaporan(),
    );
  }
}

class HalamanDaftarLaporan extends StatefulWidget {
  const HalamanDaftarLaporan({super.key});

  @override
  State<HalamanDaftarLaporan> createState() => _HalamanDaftarLaporanState();
}

class _HalamanDaftarLaporanState extends State<HalamanDaftarLaporan> {
  final List<Laporan> _laporan = [
    Laporan(
      id: 'L004',
      judul: 'Kursi kelas patah',
      kategori: 'Perabot',
      lokasi: 'Gedung A, Ruang A105',
      deskripsi:
          'Dua kursi di barisan belakang patah sehingga tidak bisa dipakai.',
      tanggal: DateTime(2026, 10, 29),
      status: 'Menunggu',
    ),
    Laporan(
      id: 'L003',
      judul: 'Lampu koridor mati',
      kategori: 'Listrik',
      lokasi: 'Gedung A, Lantai 1',
      deskripsi: 'Dua lampu koridor padam sehingga area gelap saat sore hari.',
      tanggal: DateTime(2026, 10, 28),
      status: 'Menunggu',
    ),
    Laporan(
      id: 'L002',
      judul: 'AC ruang B201 tidak dingin',
      kategori: 'AC',
      lokasi: 'Gedung B, Lantai 2',
      deskripsi: 'AC menyala tetapi tidak mengeluarkan udara dingin.',
      tanggal: DateTime(2026, 10, 27),
      status: 'Diproses',
    ),
    Laporan(
      id: 'L001',
      judul: 'Keran wastafel bocor',
      kategori: 'Air',
      lokasi: 'Gedung C, Toilet Lantai 1',
      deskripsi: 'Keran terus menetes dan membuat lantai basah.',
      tanggal: DateTime(2026, 10, 20),
      status: 'Selesai',
    ),
  ];

  void _pesan(String teks) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(teks)));
  }

  Future<void> _tambah() async {
    final hasil = await Navigator.push<Laporan>(
      context,
      MaterialPageRoute(builder: (_) => const HalamanFormLaporan()),
    );
    if (!mounted || hasil == null) return;
    setState(() => _laporan.insert(0, hasil));
    debugPrint('Tambah: $hasil');
    _pesan('Laporan ditambahkan');
  }

  Future<void> _ubah(Laporan lama) async {
    final hasil = await Navigator.push<Laporan>(
      context,
      MaterialPageRoute(builder: (_) => HalamanFormLaporan(awal: lama)),
    );
    if (!mounted || hasil == null) return;
    final index = _laporan.indexWhere((l) => l.id == hasil.id);
    if (index == -1) return;
    setState(() => _laporan[index] = hasil);
    debugPrint('Ubah: $hasil');
    _pesan('Laporan diperbarui');
  }

  Future<void> _hapus(Laporan target) async {
    final yakin = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus laporan?'),
        content: Text(
          'Laporan "${target.judul}" akan dihapus dan tidak dapat dikembalikan.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
    if (!mounted || yakin != true) return;
    setState(() => _laporan.removeWhere((l) => l.id == target.id));
    debugPrint('Hapus: $target');
    _pesan('Laporan dihapus');
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
                  onUbah: () => _ubah(l),
                  onHapus: () => _hapus(l),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _tambah,
        icon: const Icon(Icons.add),
        label: const Text('Buat Laporan'),
      ),
    );
  }
}

class KartuLaporan extends StatelessWidget {
  final Laporan laporan;
  final VoidCallback onUbah;
  final VoidCallback onHapus;

  const KartuLaporan({
    super.key,
    required this.laporan,
    required this.onUbah,
    required this.onHapus,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;
    final warna = warnaStatus(cs, laporan.status);
    final bolehDiubah = laporan.status == 'Menunggu';

    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        leading: Icon(
          ikonKategori(laporan.kategori),
          size: 32,
          color: cs.primary,
        ),
        title: Text(
          laporan.judul,
          style: teks.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(laporan.lokasi, style: teks.bodySmall),
            Text(
              '${laporan.kategori}  -  ${formatTanggal(laporan.tanggal)}',
              style: teks.bodySmall,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(ikonStatus(laporan.status), size: 16, color: warna),
                const SizedBox(width: 4),
                Text(
                  laporan.status,
                  style: teks.labelLarge?.copyWith(
                    color: warna,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        isThreeLine: true,

        trailing: bolehDiubah
            ? PopupMenuButton<String>(
                onSelected: (aksi) {
                  if (aksi == 'ubah') {
                    onUbah();
                  } else {
                    onHapus();
                  }
                },
                itemBuilder: (context) => const [
                  PopupMenuItem<String>(value: 'ubah', child: Text('Ubah')),
                  PopupMenuItem<String>(value: 'hapus', child: Text('Hapus')),
                ],
              )
            : null,
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

class HalamanFormLaporan extends StatefulWidget {
  final Laporan? awal;

  const HalamanFormLaporan({super.key, this.awal});

  @override
  State<HalamanFormLaporan> createState() => _HalamanFormLaporanState();
}

class _HalamanFormLaporanState extends State<HalamanFormLaporan> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _judulCtrl;
  late final TextEditingController _lokasiCtrl;
  late final TextEditingController _deskripsiCtrl;
  String? _kategori;

  @override
  void initState() {
    super.initState();
    final awal = widget.awal;
    _judulCtrl = TextEditingController(text: awal?.judul ?? '');
    _lokasiCtrl = TextEditingController(text: awal?.lokasi ?? '');
    _deskripsiCtrl = TextEditingController(text: awal?.deskripsi ?? '');
    _kategori = awal?.kategori;
  }

  @override
  void dispose() {
    _judulCtrl.dispose();
    _lokasiCtrl.dispose();
    _deskripsiCtrl.dispose();
    super.dispose();
  }

  void _simpan() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final awal = widget.awal;
    final Laporan hasil;
    if (awal == null) {
      hasil = Laporan(
        id: 'L${DateTime.now().microsecondsSinceEpoch}',
        judul: _judulCtrl.text.trim(),
        kategori: _kategori ?? '',
        lokasi: _lokasiCtrl.text.trim(),
        deskripsi: _deskripsiCtrl.text.trim(),
        tanggal: DateTime.now(),
        status: 'Menunggu',
      );
    } else {
      hasil = awal.copyWith(
        judul: _judulCtrl.text.trim(),
        kategori: _kategori,
        lokasi: _lokasiCtrl.text.trim(),
        deskripsi: _deskripsiCtrl.text.trim(),
      );
    }
    Navigator.pop(context, hasil);
  }

  @override
  Widget build(BuildContext context) {
    final sedangUbah = widget.awal != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(sedangUbah ? 'Ubah Laporan' : 'Buat Laporan'),
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
              value: _kategori,
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
              onPressed: _simpan,
              icon: const Icon(Icons.save),
              label: Text(sedangUbah ? 'Simpan Perubahan' : 'Simpan Laporan'),
            ),
          ],
        ),
      ),
    );
  }
}
