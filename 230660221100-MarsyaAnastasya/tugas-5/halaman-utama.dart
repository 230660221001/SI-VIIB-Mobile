import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lapor Fasilitas FTI',
      debugShowCheckedModeBanner: false,
     theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF6D28D9),
  ),
  scaffoldBackgroundColor: const Color(0xFFF5F3FF),
  useMaterial3: true,
),
      home: const HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  // Ubah menjadi true untuk menguji keadaan kosong.
  static const bool daftarKosong = false;

  static const List<Map<String, String>> daftarLaporan = [
    {
      'fasilitas': 'Proyektor',
      'lokasi': 'Kelas 5B',
      'deskripsi': 'Gambar tidak tampil',
      'status': 'Menunggu',
    },
    {
      'fasilitas': 'AC',
      'lokasi': 'Ruang Dosen',
      'deskripsi': 'AC tidak dingin',
      'status': 'Dikerjakan',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final kosong = daftarKosong || daftarLaporan.isEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lapor Fasilitas FTI'),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RingkasanLaporan(),

          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              'Laporan Saya',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: kosong
                ? const KeadaanKosong()
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: daftarLaporan.length,
                    itemBuilder: (context, index) {
                      return KartuLaporan(
                        laporan: daftarLaporan[index],
                      );
                    },
                  ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigator dibuat pada Pertemuan 6.
        },
        icon: const Icon(Icons.add),
        label: const Text('Buat Laporan'),
      ),
    );
  }
}

class RingkasanLaporan extends StatelessWidget {
  const RingkasanLaporan({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 4),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Laporan Fasilitas',
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: 6),
            Text(
              'Pantau laporan kerusakan fasilitas fakultas.',
              style: textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class KartuLaporan extends StatelessWidget {
  const KartuLaporan({
    super.key,
    required this.laporan,
  });

  final Map<String, String> laporan;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),

        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.image_outlined),
        ),

        title: Text(
          laporan['fasilitas']!,
          style: textTheme.titleMedium,
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            '${laporan['lokasi']}\n${laporan['deskripsi']}',
            style: textTheme.bodySmall,
          ),
        ),

        isThreeLine: true,

        trailing: ChipStatus(
          status: laporan['status']!,
        ),
      ),
    );
  }
}

class ChipStatus extends StatelessWidget {
  const ChipStatus({
    super.key,
    required this.status,
  });

  final String status;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    Color bg;
    Color fg;

    if (status == 'Dikerjakan') {
      bg = colors.primaryContainer;
      fg = colors.onPrimaryContainer;
    } else if (status == 'Selesai') {
      bg = colors.tertiaryContainer;
      fg = colors.onTertiaryContainer;
    } else {
      bg = colors.secondaryContainer;
      fg = colors.onSecondaryContainer;
    }

    return Chip(
      label: Text(status),
      backgroundColor: bg,
      labelStyle: TextStyle(
        color: fg,
        fontWeight: FontWeight.w600,
      ),
      visualDensity: VisualDensity.compact,
    );
  }
}

class KeadaanKosong extends StatelessWidget {
  const KeadaanKosong({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.inbox_outlined,
              size: 60,
              color: colors.outline,
            ),
            const SizedBox(height: 12),
            Text(
              'Belum ada laporan',
              style: textTheme.titleMedium,
            ),
            const SizedBox(height: 6),
            Text(
              'Tekan tombol Buat Laporan untuk melaporkan kerusakan fasilitas.',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}