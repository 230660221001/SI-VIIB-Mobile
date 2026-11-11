
---

### 2. File `form-interaksi.dart`
Buat file ini di folder `tugas-6`. Kode ini menggabungkan navigasi, pengiriman data, form, dan validasi.

```dart
// ============================================================================
// PAB — Tugas 6: Navigation Flow dan Interaksi
// Domain   : Aplikasi Absensi Organisasi Mahasiswa
// ============================================================================
import 'package:flutter/material.dart';

void main() {
  runApp(const AbsensiApp());
}

// Model Data Sederhana
class DataKegiatan {
  const DataKegiatan({
    required this.nama,
    required this.tanggal,
    required this.lokasi,
    required this.status,
  });

  final String nama;
  final String tanggal;
  final String lokasi;
  final String status;
}

// Data Statis
const List<DataKegiatan> daftarKegiatan = [
  DataKegiatan(nama: 'Rapat Rutin Bulanan', tanggal: '12 Okt 2026', lokasi: 'Aula F', status: 'Dibuka'),
  DataKegiatan(nama: 'Pelatihan Kepemimpinan', tanggal: '15 Okt 2026', lokasi: 'Ruang B.201', status: 'Dibuka'),
  DataKegiatan(nama: 'Bakti Sosial Desa', tanggal: '20 Okt 2026', lokasi: 'Desa Sukamaju', status: 'Ditutup'),
];

class AbsensiApp extends StatelessWidget {
  const AbsensiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Absensi Organisasi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HalamanDaftarKegiatan(),
        '/detail': (context) => const DetailKegiatan(),
        '/check-in': (context) => const FormCheckIn(),
      },
    );
  }
}

// --- LAYAR 1: DAFTAR KEGIATAN ---
class HalamanDaftarKegiatan extends StatelessWidget {
  const HalamanDaftarKegiatan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Absensi Organisasi')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: daftarKegiatan.length,
        itemBuilder: (context, index) {
          final kegiatan = daftarKegiatan[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.event)),
              title: Text(kegiatan.nama),
              subtitle: Text('${kegiatan.tanggal} • ${kegiatan.lokasi}'),
              trailing: ChipStatus(status: kegiatan.status),
              splashColor: Theme.of(context).colorScheme.primaryContainer,
              onTap: () {
                // Navigasi maju ke detail dengan data
                Navigator.pushNamed(context, '/detail', arguments: kegiatan);
              },
            ),
          );
        },
      ),
    );
  }
}

// --- LAYAR 2: DETAIL KEGIATAN ---
class DetailKegiatan extends StatelessWidget {
  const DetailKegiatan({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final kegiatan = args is DataKegiatan ? args : null;

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Kegiatan')),
      body: kegiatan == null
          ? const Center(child: Text('Data kegiatan tidak tersedia.'))
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(kegiatan.nama, style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 8),
                        Text('Tanggal: ${kegiatan.tanggal}'),
                        Text('Lokasi: ${kegiatan.lokasi}'),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Text('Status: '),
                            ChipStatus(status: kegiatan.status),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: () {
                    // Navigasi ke form dengan membawa data
                    Navigator.pushNamed(context, '/check-in', arguments: kegiatan);
                  },
                  icon: const Icon(Icons.check_circle),
                  label: const Text('Check-in Kehadiran'),
                ),
                const SizedBox(height: 8),
                FilledButton.tonalIcon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Kembali ke Daftar'),
                ),
              ],
            ),
    );
  }
}

// --- LAYAR 3: FORM CHECK-IN ---
class FormCheckIn extends StatefulWidget {
  const FormCheckIn({super.key});

  @override
  State<FormCheckIn> createState() => _FormCheckInState();
}

class _FormCheckInState extends State<FormCheckIn> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    super.dispose();
  }

  void _kirim(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return; // Berhenti jika tidak valid
    }
    
    final nama = _namaController.text.trim();
    
    // Tampilkan Feedback SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Kehadiran atas nama $nama berhasil dicatat!')),
    );
    
    Navigator.pop(context); // Kembali ke Detail
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final kegiatan = args is DataKegiatan ? args : null;

    return Scaffold(
      appBar: AppBar(title: Text('Check-in: ${kegiatan?.nama ?? '-'}')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text('Konfirmasi Kehadiran', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Nama wajib diisi.';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _nimController,
              decoration: const InputDecoration(
                labelText: 'NIM',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'NIM wajib diisi.';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => _kirim(context),
              icon: const Icon(Icons.send),
              label: const Text('Kirim Kehadiran'),
            ),
          ],
        ),
      ),
    );
  }
}

// --- WIDGET BANTUAN: CHIP STATUS ---
class ChipStatus extends StatelessWidget {
  const ChipStatus({super.key, required this.status});
  final String status;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDibuka = status == 'Dibuka';
    return Chip(
      label: Text(status, style: TextStyle(fontSize: 11, color: isDibuka ? colorScheme.onTertiaryContainer : colorScheme.onErrorContainer)),
      backgroundColor: isDibuka ? colorScheme.tertiaryContainer : colorScheme.errorContainer,
      visualDensity: VisualDensity.compact,
    );
  }
}
