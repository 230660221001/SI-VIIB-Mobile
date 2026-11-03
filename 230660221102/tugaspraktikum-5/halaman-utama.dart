import 'package:flutter/material.dart';

void main() => runApp(const MantraAttendanceApp());

class MantraAttendanceApp extends StatelessWidget {
  const MantraAttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mantra Attendance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HalamanUtama(),
    );
  }
}

class Kehadiran {
  final String tanggal;
  final String masuk;
  final String keluar;
  final String status; // 'Hadir', 'Terlambat', 'Alpa'

  const Kehadiran(this.tanggal, this.masuk, this.keluar, this.status);
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  // Uji keadaan kosong: ganti isi list menjadi [] lalu jalankan ulang.
  final List<Kehadiran> _riwayat = [
    const Kehadiran('Selasa, 27 Okt 2026', '07:58', '17:05', 'Hadir'),
    const Kehadiran('Senin, 26 Okt 2026', '08:21', '17:10', 'Terlambat'),
    const Kehadiran('Jumat, 23 Okt 2026', '-', '-', 'Alpa'),
    const Kehadiran('Kamis, 22 Okt 2026', '07:55', '17:02', 'Hadir'),
  ];

  bool _sudahCheckIn = false;
  bool _sudahCheckOut = false;
  String _jamMasuk = '-';
  String _jamKeluar = '-';

  void _aksiUtama() {
    final jam = TimeOfDay.now().format(context);
    setState(() {
      if (!_sudahCheckIn) {
        _sudahCheckIn = true;
        _jamMasuk = jam;
      } else if (!_sudahCheckOut) {
        _sudahCheckOut = true;
        _jamKeluar = jam;
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _sudahCheckOut ? 'Check-out berhasil dicatat' : 'Check-in berhasil dicatat',
        ),
      ),
    );
  }

  Widget _chipStatus(String status, ColorScheme warna) {
    final Color latar = status == 'Hadir'
        ? warna.primaryContainer
        : status == 'Terlambat'
            ? warna.tertiaryContainer
            : warna.errorContainer;
    final Color teks = status == 'Hadir'
        ? warna.onPrimaryContainer
        : status == 'Terlambat'
            ? warna.onTertiaryContainer
            : warna.onErrorContainer;
    return Chip(
      label: Text(status, style: TextStyle(color: teks)),
      backgroundColor: latar,
      side: BorderSide.none,
      visualDensity: VisualDensity.compact,
    );
  }

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;
    final teksTema = Theme.of(context).textTheme;

    final String statusHariIni = !_sudahCheckIn
        ? 'Belum check-in'
        : !_sudahCheckOut
            ? 'Sudah check-in'
            : 'Absensi hari ini selesai';

    return Scaffold(
      appBar: AppBar(title: const Text('Mantra Attendance')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sapaan (hierarki: judul tebal, keterangan redup)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Halo, Raka',
                    style: teksTema.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold)),
                Text('Rabu, 28 Oktober 2026',
                    style: teksTema.bodyMedium
                        ?.copyWith(color: warna.onSurfaceVariant)),
              ],
            ),
          ),
          // Status kehadiran hari ini (F-02)
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Status hari ini',
                      style: teksTema.bodyMedium
                          ?.copyWith(color: warna.onSurfaceVariant)),
                  const SizedBox(height: 4),
                  Text(statusHariIni,
                      style: teksTema.titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Masuk: $_jamMasuk   |   Keluar: $_jamKeluar',
                      style: teksTema.bodyMedium),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text('Riwayat Kehadiran', style: teksTema.titleMedium),
          ),
          // Daftar riwayat (F-05) atau keadaan kosong
          Expanded(
            child: _riwayat.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.event_busy,
                            size: 64, color: warna.onSurfaceVariant),
                        const SizedBox(height: 8),
                        Text('Belum ada riwayat kehadiran',
                            style: teksTema.bodyLarge),
                        Text('Lakukan check-in untuk memulai.',
                            style: teksTema.bodyMedium
                                ?.copyWith(color: warna.onSurfaceVariant)),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 88),
                    itemCount: _riwayat.length,
                    itemBuilder: (context, index) {
                      final item = _riwayat[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: ListTile(
                          leading: const Icon(Icons.calendar_today),
                          title: Text(item.tanggal),
                          subtitle: Text(
                              'Masuk ${item.masuk}  |  Keluar ${item.keluar}'),
                          trailing: _chipStatus(item.status, warna),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      // Satu aksi utama (F-03 / F-04)
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _sudahCheckOut ? null : _aksiUtama,
        icon: Icon(_sudahCheckIn ? Icons.logout : Icons.login),
        label: Text(_sudahCheckOut
            ? 'Selesai'
            : _sudahCheckIn
                ? 'Check-out'
                : 'Check-in'),
      ),
    );
  }
}