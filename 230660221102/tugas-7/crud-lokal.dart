import 'package:flutter/material.dart';

void main() => runApp(const MantraAttendanceApp());

// ---------- Route ----------

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

// ---------- Model data ----------

class DataKehadiran {
  const DataKehadiran({
    required this.id,
    required this.tanggal,
    required this.lokasi,
    required this.jamMasuk,
    required this.jamKeluar,
    required this.status,
  });

  final String id;
  final String tanggal;
  final String lokasi;
  final String jamMasuk;
  final String jamKeluar; // '-' berarti belum check-out
  final String status; // 'Hadir', 'Terlambat', 'Alpa'

  @override
  String toString() => 'Kehadiran $tanggal ($jamMasuk - $jamKeluar)';
}

// Batas jam masuk (asumsi prototype). Perbandingan teks HH:mm berlaku
// karena jam selalu ditulis dua digit.
const String batasJamMasuk = '08:00';

// ---------- Fungsi bantu ----------

String formatTanggal(DateTime d) {
  const hari = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'];
  const bulan = [
    'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
    'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des',
  ];
  return '${hari[d.weekday - 1]}, ${d.day} ${bulan[d.month - 1]} ${d.year}';
}

String jamSekarang() {
  final sekarang = DateTime.now();
  final jam = sekarang.hour.toString().padLeft(2, '0');
  final menit = sekarang.minute.toString().padLeft(2, '0');
  return '$jam:$menit';
}

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

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  // State: sumber data tunggal untuk seluruh layar.
  // Kosongkan list ini ([]) untuk menguji keadaan kosong.
  final List<DataKehadiran> _daftar = [
    const DataKehadiran(
      id: 'contoh-1',
      tanggal: 'Senin, 2 Nov 2026',
      lokasi: 'Kantor Pusat',
      jamMasuk: '07:58',
      jamKeluar: '17:05',
      status: 'Hadir',
    ),
    const DataKehadiran(
      id: 'contoh-2',
      tanggal: 'Jumat, 30 Okt 2026',
      lokasi: 'Kantor Pusat',
      jamMasuk: '08:21',
      jamKeluar: '17:10',
      status: 'Terlambat',
    ),
    const DataKehadiran(
      id: 'contoh-3',
      tanggal: 'Kamis, 29 Okt 2026',
      lokasi: '-',
      jamMasuk: '-',
      jamKeluar: '-',
      status: 'Alpa',
    ),
    const DataKehadiran(
      id: 'contoh-4',
      tanggal: 'Rabu, 28 Okt 2026',
      lokasi: 'Kantor Pusat',
      jamMasuk: '07:55',
      jamKeluar: '17:02',
      status: 'Hadir',
    ),
  ];

  // Catatan kehadiran hari ini (null bila belum check-in).
  DataKehadiran? get _hariIni {
    final tanggalHariIni = formatTanggal(DateTime.now());
    final index = _daftar.indexWhere((d) => d.tanggal == tanggalHariIni);
    return index == -1 ? null : _daftar[index];
  }

  void _tampilPesan(String pesan) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(pesan)),
    );
  }

  // CREATE (F-03) dan UPDATE (F-04) dimulai dari satu aksi utama.
  Future<void> _aksiUtama() async {
    final hariIni = _hariIni;
    if (hariIni == null) {
      // Buka form; form mengembalikan objek baru lewat Navigator.pop.
      final hasil = await Navigator.pushNamed(context, Rute.checkin);
      if (!mounted) return;
      if (hasil is DataKehadiran) {
        setState(() {
          _daftar.insert(0, hasil);
        });
        _tampilPesan('Check-in pukul ${hasil.jamMasuk} di ${hasil.lokasi} dicatat.');
      }
    } else if (hariIni.jamKeluar == '-') {
      _checkOut(hariIni);
    }
  }

  // UPDATE: objek baru menggantikan objek lama pada posisi yang sama.
  void _checkOut(DataKehadiran lama) {
    final jam = jamSekarang();
    setState(() {
      final index = _daftar.indexWhere((d) => d.id == lama.id);
      if (index != -1) {
        _daftar[index] = DataKehadiran(
          id: lama.id,
          tanggal: lama.tanggal,
          lokasi: lama.lokasi,
          jamMasuk: lama.jamMasuk,
          jamKeluar: jam,
          status: lama.status,
        );
      }
    });
    _tampilPesan('Check-out pukul $jam dicatat.');
  }

  // DELETE: hapus berdasarkan id.
  void _hapus(String id) {
    setState(() {
      _daftar.removeWhere((d) => d.id == id);
    });
  }

  Future<void> _konfirmasiHapus(DataKehadiran data) async {
    final yakin = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus catatan kehadiran?'),
        content: Text('Catatan ${data.tanggal} akan dihapus.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
    if (!mounted) return;
    if (yakin == true) {
      _hapus(data.id);
      _tampilPesan('Catatan ${data.tanggal} dihapus.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;
    final teksTema = Theme.of(context).textTheme;

    final hariIni = _hariIni;
    final bool selesai = hariIni != null && hariIni.jamKeluar != '-';
    final String statusHariIni = hariIni == null
        ? 'Belum check-in'
        : selesai
            ? 'Absensi hari ini selesai'
            : 'Sudah check-in';

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
                Text(formatTanggal(DateTime.now()),
                    style: teksTema.bodyMedium
                        ?.copyWith(color: warna.onSurfaceVariant)),
              ],
            ),
          ),
          // READ: status hari ini (F-02)
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
                    Text(statusHariIni,
                        style: teksTema.titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(
                      'Masuk: ${hariIni?.jamMasuk ?? '-'}   |   '
                      'Keluar: ${hariIni?.jamKeluar ?? '-'}',
                      style: teksTema.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text('Riwayat Kehadiran', style: teksTema.titleMedium),
          ),
          // READ: riwayat (F-05) atau keadaan kosong
          Expanded(
            child: _daftar.isEmpty
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
                    itemCount: _daftar.length,
                    itemBuilder: (context, index) {
                      final item = _daftar[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: ListTile(
                          leading: const Icon(Icons.calendar_today),
                          title: Text(item.tanggal),
                          subtitle: Text(
                              'Masuk ${item.jamMasuk}  |  Keluar ${item.jamKeluar}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ChipStatus(item.status),
                              IconButton(
                                icon: const Icon(Icons.delete_outline),
                                tooltip: 'Hapus catatan',
                                onPressed: () => _konfirmasiHapus(item),
                              ),
                            ],
                          ),
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
        onPressed: selesai ? null : _aksiUtama,
        icon: Icon(hariIni == null ? Icons.login : Icons.logout),
        label: Text(selesai
            ? 'Selesai'
            : hariIni == null
                ? 'Check-in'
                : 'Check-out'),
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
    _jamController = TextEditingController(text: jamSekarang());
  }

  @override
  void dispose() {
    _lokasiController.dispose();
    _jamController.dispose();
    super.dispose();
  }

  // Urutan: validasi -> buat objek -> kembalikan ke Dashboard lewat pop.
  void _simpan() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final jam = _jamController.text.trim();
    final data = DataKehadiran(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      tanggal: formatTanggal(DateTime.now()),
      lokasi: _lokasiController.text.trim(),
      jamMasuk: jam,
      jamKeluar: '-',
      status: jam.compareTo(batasJamMasuk) <= 0 ? 'Hadir' : 'Terlambat',
    );
    Navigator.pop(context, data);
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
              onPressed: _simpan,
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
    final warna = Theme.of(context).colorScheme;
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
                        _baris(context, 'Lokasi', data.lokasi),
                        _baris(context, 'Jam masuk', data.jamMasuk),
                        _baris(context, 'Jam keluar', data.jamKeluar),
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: Text('Status',
                                  style:
                                      TextStyle(color: warna.onSurfaceVariant)),
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
