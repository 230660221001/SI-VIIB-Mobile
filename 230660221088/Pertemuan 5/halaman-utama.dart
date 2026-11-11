import 'package:flutter/material.dart';

void main() {
  runApp(const AplikasiBPBD());
}

class AplikasiBPBD extends StatelessWidget {
  const AplikasiBPBD({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SI Pendataan Bencana BPBD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Warna utama navy dengan aksen merah BPBD dan aksen kuning untuk status.
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF17365D),
          tertiary: const Color(0xFFF9A825),
          error: const Color(0xFFD32F2F),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F6F9),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            borderSide: BorderSide(color: Color(0xFFE1E6ED)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            borderSide: BorderSide(color: Color(0xFF17365D), width: 1.5),
          ),
        ),
      ),
      home: const HalamanLaporanMasuk(),
    );
  }
}

class LaporanBencana {
  const LaporanBencana({
    required this.jenis,
    required this.lokasi,
    required this.tanggal,
    required this.status,
  });

  final String jenis;
  final String lokasi;
  final String tanggal;
  final String status;
}

class HalamanLaporanMasuk extends StatefulWidget {
  const HalamanLaporanMasuk({super.key});

  @override
  State<HalamanLaporanMasuk> createState() => _HalamanLaporanMasukState();
}

class _HalamanLaporanMasukState extends State<HalamanLaporanMasuk> {
  String kataKunci = '';

  // Data statis untuk prototype. Data ini belum terhubung ke database/API BPBD.
  // Ubah menjadi [] untuk menguji tampilan keadaan kosong.
  final List<LaporanBencana> dataLaporan = const [
    LaporanBencana(
      jenis: 'Tanah Longsor',
      lokasi: 'Kecamatan Sumedang Selatan',
      tanggal: '02 Okt 2026',
      status: 'Menunggu Verifikasi',
    ),
    LaporanBencana(
      jenis: 'Banjir Bandang',
      lokasi: 'Kecamatan Jatinangor',
      tanggal: '28 Sep 2026',
      status: 'Perlu Klarifikasi',
    ),
    LaporanBencana(
      jenis: 'Angin Puting Beliung',
      lokasi: 'Kecamatan Cimanggung',
      tanggal: '15 Sep 2026',
      status: 'Terverifikasi',
    ),
    LaporanBencana(
      jenis: 'Kekeringan',
      lokasi: 'Kecamatan Ujungjaya',
      tanggal: '01 Sep 2026',
      status: 'Menunggu Verifikasi',
    ),
  ];

  List<LaporanBencana> get laporanTerfilter {
    final kataKunciNormal = kataKunci.trim().toLowerCase();

    if (kataKunciNormal.isEmpty) {
      return dataLaporan;
    }

    return dataLaporan.where((laporan) {
      return laporan.jenis.toLowerCase().contains(kataKunciNormal) ||
          laporan.lokasi.toLowerCase().contains(kataKunciNormal);
    }).toList();
  }

  int get jumlahMenungguVerifikasi => dataLaporan
      .where((laporan) => laporan.status == 'Menunggu Verifikasi')
      .length;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final warna = tema.colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: warna.primary,
        foregroundColor: warna.onPrimary,
        toolbarHeight: 72,
        leading: const Icon(Icons.shield_outlined, size: 28),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'BPBD KABUPATEN SUMEDANG',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2),
            Text(
              'Sistem Informasi Pendataan Bencana',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat datang, Petugas',
                style: tema.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: warna.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Pantau dan verifikasi laporan bencana masyarakat.',
                style: tema.textTheme.bodyMedium?.copyWith(
                  color: warna.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16),
              _buildRingkasan(context),
              const SizedBox(height: 16),
              TextField(
                onChanged: (nilai) {
                  setState(() {
                    kataKunci = nilai;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Cari jenis bencana atau lokasi',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Laporan Terbaru',
                    style: tema.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${laporanTerfilter.length} laporan',
                    style: tema.textTheme.bodySmall?.copyWith(
                      color: warna.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: laporanTerfilter.isEmpty
                    ? _buildKeadaanKosong(context)
                    : ListView.builder(
                        itemCount: laporanTerfilter.length,
                        padding: const EdgeInsets.only(bottom: 92),
                        itemBuilder: (context, index) {
                          final laporan = laporanTerfilter[index];
                          return _buildKartuLaporan(context, laporan);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Form pencatatan manual akan dihubungkan pada tahap implementasi berikutnya.',
              ),
            ),
          );
        },
        backgroundColor: warna.error,
        foregroundColor: warna.onError,
        icon: const Icon(Icons.add_rounded),
        label: const Text('Catat Kejadian'),
      ),
    );
  }

  Widget _buildRingkasan(BuildContext context) {
    final tema = Theme.of(context);
    final warna = tema.colorScheme;

    return Card(
      margin: EdgeInsets.zero,
      color: warna.primary,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Laporan Menunggu Verifikasi',
                    style: tema.textTheme.bodyMedium?.copyWith(
                      color: warna.onPrimary,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '$jumlahMenungguVerifikasi',
                    style: tema.textTheme.headlineMedium?.copyWith(
                      color: warna.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Perlu ditinjau oleh petugas',
                    style: tema.textTheme.bodySmall?.copyWith(
                      color: warna.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.fact_check_outlined,
              size: 46,
              color: warna.onPrimary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKartuLaporan(
    BuildContext context,
    LaporanBencana laporan,
  ) {
    final tema = Theme.of(context);
    final warna = tema.colorScheme;

    // Warna status berasal dari ColorScheme dan dipilih menggunakan ternary.
    final Color warnaLatarStatus = laporan.status == 'Menunggu Verifikasi'
        ? warna.tertiaryContainer
        : laporan.status == 'Perlu Klarifikasi'
            ? warna.errorContainer
            : warna.primaryContainer;

    final Color warnaTeksStatus = laporan.status == 'Menunggu Verifikasi'
        ? warna.onTertiaryContainer
        : laporan.status == 'Perlu Klarifikasi'
            ? warna.onErrorContainer
            : warna.onPrimaryContainer;

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 1,
      color: warna.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        leading: CircleAvatar(
          backgroundColor: warna.primaryContainer,
          foregroundColor: warna.onPrimaryContainer,
          child: const Icon(Icons.warning_amber_rounded),
        ),
        title: Text(
          laporan.jenis,
          style: tema.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(laporan.lokasi),
              const SizedBox(height: 3),
              Text(
                laporan.tanggal,
                style: tema.textTheme.bodySmall?.copyWith(
                  color: warna.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              Chip(
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                label: Text(laporan.status),
                backgroundColor: warnaLatarStatus,
                labelStyle: tema.textTheme.labelSmall?.copyWith(
                  color: warnaTeksStatus,
                  fontWeight: FontWeight.w600,
                ),
                side: BorderSide.none,
                padding: const EdgeInsets.symmetric(horizontal: 4),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKeadaanKosong(BuildContext context) {
    final tema = Theme.of(context);
    final warna = tema.colorScheme;
    final bool sedangMencari = kataKunci.trim().isNotEmpty;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              sedangMencari ? Icons.search_off_rounded : Icons.inbox_outlined,
              size: 58,
              color: warna.outline,
            ),
            const SizedBox(height: 12),
            Text(
              sedangMencari ? 'Laporan tidak ditemukan' : 'Belum ada laporan masuk',
              textAlign: TextAlign.center,
              style: tema.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              sedangMencari
                  ? 'Coba gunakan kata kunci jenis bencana atau lokasi lain.'
                  : 'Laporan dari masyarakat akan muncul di halaman ini.',
              textAlign: TextAlign.center,
              style: tema.textTheme.bodyMedium?.copyWith(
                color: warna.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
