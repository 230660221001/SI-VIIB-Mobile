import 'package:flutter/material.dart';

void main() => runApp(const MantraAttendanceApp());

// Daftar nama route: satu sumber kebenaran.
class Rute {
  static const dashboard = '/';
  static const checkin = '/checkin';
  static const detail = '/detail';
}

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
      initialRoute: Rute.dashboard,
      routes: {
        Rute.dashboard: (context) => const HalamanUtama(),
        Rute.checkin: (context) => const FormCheckIn(),
        Rute.detail: (context) => const DetailKehadiran(),
      },
    );
  }
}

// ---------- Data ----------

class DataKehadiran {
  final String tanggal;
  final String masuk;
  final String keluar;
  final String status; // 'Hadir', 'Terlambat', 'Alpa'

  const DataKehadiran(this.tanggal, this.masuk, this.keluar, this.status);
}

// Ubah menjadi [] untuk menguji keadaan kosong.
const List<DataKehadiran> riwayatContoh = [
  DataKehadiran('Selasa, 27 Okt 2026', '07:58', '17:05', 'Hadir'),
  DataKehadiran('Senin, 26 Okt 2026', '08:21', '17:10', 'Terlambat'),
  DataKehadiran('Jumat, 23 Okt 2026', '-', '-', 'Alpa'),
  DataKehadiran('Kamis, 22 Okt 2026', '07:55', '17:02', 'Hadir'),
];

// ---------- Komponen bersama ----------

class ChipStatus extends StatelessWidget {
  final String status;
  const ChipStatus(this.status, {super.key});

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;
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
}

// ---------- Layar 1: Dashboard (route '/') ----------

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;
    final teksTema = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Mantra Attendance')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Status hari ini',
                        style: teksTema.bodyMedium
                            ?.copyWith(color: warna.onSurfaceVariant)),
                    const SizedBox(height: 4),
                    Text('Belum check-in',
                        style: teksTema.titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text('Riwayat Kehadiran', style: teksTema.titleMedium),
          ),
          Expanded(
            child: riwayatContoh.isEmpty
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
                    itemCount: riwayatContoh.length,
                    itemBuilder: (context, index) {
                      final item = riwayatContoh[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: ListTile(
                          leading: const Icon(Icons.calendar_today),
                          title: Text(item.tanggal),
                          subtitle: Text(
                              'Masuk ${item.masuk}  |  Keluar ${item.keluar}'),
                          trailing: ChipStatus(item.status),
                          // Kirim data ke layar detail lewat arguments.
                          onTap: () => Navigator.pushNamed(
                            context,
                            Rute.detail,
                            arguments: item,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, Rute.checkin),
        icon: const Icon(Icons.login),
        label: const Text('Check-in'),
      ),
    );
  }
}

// ---------- Layar 2: Form Check-in (route '/checkin') ----------

class FormCheckIn extends StatefulWidget {
  const FormCheckIn({super.key});

  @override
  State<FormCheckIn> createState() => _FormCheckInState();
}

class _FormCheckInState extends State<FormCheckIn> {
  final _formKey = GlobalKey<FormState>();
  final _lokasiController = TextEditingController();
  late final TextEditingController _jamController;

  @override
  void initState() {
    super.initState();
    final sekarang = DateTime.now();
    final jam = sekarang.hour.toString().padLeft(2, '0');
    final menit = sekarang.minute.toString().padLeft(2, '0');
    _jamController = TextEditingController(text: '$jam:$menit');
  }

  @override
  void dispose() {
    _lokasiController.dispose();
    _jamController.dispose();
    super.dispose();
  }

  // Urutan: validasi -> feedback -> pop.
  void _kirim(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return; // Berhenti; pesan validator tampil di bawah field.
    }
    final lokasi = _lokasiController.text.trim();
    final jam = _jamController.text.trim();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Check-in pukul $jam di $lokasi dicatat (simulasi).'),
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final teksTema = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Check-in')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Catat kehadiran masuk',
                style: teksTema.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextFormField(
              controller: _lokasiController,
              decoration: const InputDecoration(
                labelText: 'Lokasi kerja',
                hintText: 'Contoh: Kantor Pusat',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Lokasi kerja wajib diisi.';
                }
                if (value.trim().length < 3) {
                  return 'Lokasi kerja minimal 3 karakter.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _jamController,
              decoration: const InputDecoration(
                labelText: 'Jam masuk (HH:mm)',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Jam masuk wajib diisi.';
                }
                final cocok =
                    RegExp(r'^([01]\d|2[0-3]):[0-5]\d$').hasMatch(value.trim());
                if (!cocok) {
                  return 'Format jam harus HH:mm, contoh 08:00.';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => _kirim(context),
              child: const Text('Kirim'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- Layar 3: Detail Hasil Absensi (route '/detail') ----------

class DetailKehadiran extends StatelessWidget {
  const DetailKehadiran({super.key});

  @override
  Widget build(BuildContext context) {
    final teksTema = Theme.of(context).textTheme;
    final args = ModalRoute.of(context)?.settings.arguments;
    final data = args is DataKehadiran ? args : null;

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Hasil Absensi')),
      body: data == null
          ? const Center(child: Text('Data absensi tidak tersedia.'))
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(data.tanggal,
                    style: teksTema.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        _baris(context, 'Jam masuk', data.masuk),
                        _baris(context, 'Jam keluar', data.keluar),
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: Text(
                                'Status',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                              ),
                            ),
                            ChipStatus(data.status),
                          ],
                        ),
                        _baris(
                          context,
                          'Keterangan',
                          data.status == 'Hadir'
                              ? 'Kehadiran tercatat tepat waktu.'
                              : data.status == 'Terlambat'
                                  ? 'Check-in tercatat setelah jam kerja dimulai.'
                                  : 'Tidak ada catatan kehadiran pada tanggal ini.',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Kembali'),
                ),
              ],
            ),
    );
  }
}

Widget _baris(BuildContext context, String label, String nilai) {
  final warna = Theme.of(context).colorScheme;
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(label, style: TextStyle(color: warna.onSurfaceVariant)),
        ),
        Expanded(child: Text(nilai)),
      ],
    ),
  );
}