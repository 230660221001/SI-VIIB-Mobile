import 'package:flutter/material.dart';

void main() {
  runApp(const PresentGoApp());
}

/// MaterialApp dengan tema terpusat (ColorScheme.fromSeed, useMaterial3).
/// Warna benih teal/mint — kontras baik untuk status hijau/oranye/abu
/// dan selaras dengan gaya kartu melengkung pada wireframe.
class PresentGoApp extends StatelessWidget {
  const PresentGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PresentGo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF17C3B2)),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4FBFA),
      ),
      home: const HalamanBeranda(),
    );
  }
}

/// Layar utama (sesuai wireframe.png area "Halaman Beranda").
/// Tanpa Navigator — sesuai batas cakupan Pertemuan 5.
class HalamanBeranda extends StatefulWidget {
  const HalamanBeranda({super.key});

  @override
  State<HalamanBeranda> createState() => _HalamanBerandaState();
}

class _HalamanBerandaState extends State<HalamanBeranda> {
  // Data statis riwayat singkat — F-04 (ditampilkan ringkas di beranda).
  final List<Map<String, String>> _riwayat = [
    {'nama': 'Hari ini', 'jam': 'Masuk 08.02', 'status': 'hijau', 'label': 'Hadir'},
    {'nama': 'Kemarin', 'jam': 'Masuk 08.16', 'status': 'oranye', 'label': 'Terlambat'},
    {'nama': '2 hari lalu', 'jam': 'Surat izin diajukan', 'status': 'abu', 'label': 'Izin'},
  ];

  // Status absen hari ini — F-02 (absen masuk) dan F-03 (absen pulang).
  bool _sudahAbsenMasuk = false;

  void _tandaiAbsen() {
    setState(() {
      _sudahAbsenMasuk = !_sudahAbsenMasuk;
    });
  }

  // Status berwarna dengan ternary — bagian "Dari Wireframe ke Widget" Pertemuan 5.
  Color _warnaStatus(String kode, ColorScheme scheme) {
    return kode == 'hijau'
        ? const Color(0xFF17C3B2)
        : kode == 'oranye'
            ? const Color(0xFFFFA447)
            : scheme.outline;
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('PresentGo'),
        backgroundColor: Colors.transparent,
        foregroundColor: scheme.onSurface,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sapaan — Row dengan avatar, bagian atas layar.
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: scheme.primaryContainer,
                  child: Icon(Icons.person, color: scheme.primary),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hi, Rian', style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    Text('Senin, 9 November 2026',
                        style: textTheme.bodySmall?.copyWith(color: scheme.outline)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 18),

            // Kartu gradien — ringkasan kehadiran bulan ini (F-04).
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [scheme.primary, scheme.primary.withOpacity(0.7)],
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 84,
                    height: 84,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: 0.87,
                          strokeWidth: 7,
                          backgroundColor: Colors.white.withOpacity(0.25),
                          valueColor: const AlwaysStoppedAnimation(Colors.white),
                        ),
                        const Text('87%',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Kehadiran Bulan Ini',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                        SizedBox(height: 4),
                        Text('27 dari 31 hari kerja',
                            style: TextStyle(color: Colors.white70, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Dua kartu status kecil pelengkap.
            Row(
              children: [
                Expanded(child: _KartuStatusKecil(label: 'Izin', nilai: '2 hari', warna: scheme.outline)),
                const SizedBox(width: 12),
                Expanded(child: _KartuStatusKecil(label: 'Terlambat', nilai: '1 hari', warna: const Color(0xFFFFA447))),
              ],
            ),
            const SizedBox(height: 20),

            Text('Riwayat Terbaru',
                style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            // Daftar item — ListView.builder dengan Card + ListTile per item.
            Expanded(
              child: _riwayat.isEmpty
                  // Keadaan kosong — pola "Center + Text + ikon" Pertemuan 5.
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.event_busy, size: 48, color: scheme.outline),
                          const SizedBox(height: 12),
                          Text('Belum ada riwayat bulan ini', style: textTheme.bodyMedium),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: _riwayat.length,
                      itemBuilder: (context, index) {
                        final item = _riwayat[index];
                        final warna = _warnaStatus(item['status']!, scheme);
                        return Card(
                          elevation: 0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: warna.withOpacity(0.15),
                              child: Icon(Icons.event, color: warna, size: 20),
                            ),
                            title: Text(item['nama']!, style: const TextStyle(fontWeight: FontWeight.w600)),
                            subtitle: Text(item['jam']!),
                            trailing: Chip(
                              label: Text(item['label']!),
                              backgroundColor: warna.withOpacity(0.15),
                              side: BorderSide.none,
                              labelStyle: TextStyle(color: warna, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      // Aksi utama — satu FloatingActionButton.extended per layar (F-02/F-03).
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _tandaiAbsen,
        backgroundColor: scheme.primary,
        icon: Icon(_sudahAbsenMasuk ? Icons.check_circle : Icons.login),
        label: Text(_sudahAbsenMasuk ? 'Absen Pulang' : 'Absen Sekarang'),
      ),
    );
  }
}

/// Kartu status kecil (Izin / Terlambat) di bawah kartu gradien utama.
class _KartuStatusKecil extends StatelessWidget {
  final String label;
  final String nilai;
  final Color warna;

  const _KartuStatusKecil({required this.label, required this.nilai, required this.warna});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      decoration: BoxDecoration(
        color: warna.withOpacity(0.10),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(nilai, style: TextStyle(color: warna, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 2),
          Text(label, style: TextStyle(color: warna, fontSize: 12)),
        ],
      ),
    );
  }
}
