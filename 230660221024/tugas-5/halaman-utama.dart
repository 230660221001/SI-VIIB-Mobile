// ============================================================================
// PAB — Tugas 5: Prototype UI/UX
// Domain   : Aplikasi Absensi Organisasi Mahasiswa
// Layar    : Halaman Utama (Daftar Kegiatan)
// ============================================================================
// Bantuan: AI coding assistant — membantu menerapkan ColorScheme.fromSeed,
//          menyusun KartuKegiatan, dan logika ternary pada ChipStatus.
// ============================================================================

import 'package:flutter/material.dart';

void main() {
  runApp(const AbsensiApp());
}

class AbsensiApp extends StatelessWidget {
  const AbsensiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Absensi Organisasi Mahasiswa',
      debugShowCheckedModeBanner: false,
      // Tema Terpusat (Bagian 7.1)
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HalamanDaftarKegiatan(),
    );
  }
}

class HalamanDaftarKegiatan extends StatelessWidget {
  const HalamanDaftarKegiatan({super.key});

  // Ubah menjadi true untuk menguji keadaan kosong
  static const bool semuaKosong = false;

  static const List<Map<String, String>> daftarKegiatan = [
    {
      'nama': 'Rapat Rutin Bulanan',
      'tanggal': '12 Okt 2026',
      'lokasi': 'Aula F',
      'status': 'Dibuka',
    },
    {
      'nama': 'Pelatihan Kepemimpinan',
      'tanggal': '15 Okt 2026',
      'lokasi': 'Ruang B.201',
      'status': 'Dibuka',
    },
    {
      'nama': 'Bakti Sosial Desa',
      'tanggal': '20 Okt 2026',
      'lokasi': 'Desa Sukamaju',
      'status': 'Ditutup',
    },
    {
      'nama': 'Evaluasi Program Kerja',
      'tanggal': '25 Okt 2026',
      'lokasi': 'Sekretariat',
      'status': 'Belum Dibuka',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final tampilkanKosong = daftarKegiatan.isEmpty || semuaKosong;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Absensi Organisasi'),
        centerTitle: true,
      ),
      body: tampilkanKosong
          ? const KeadaanKosong()
          : Column(
              children: [
                // Hierarki Visual (Bagian 7.2)
                const RingkasanAtas(),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: daftarKegiatan.length,
                    itemBuilder: (context, index) {
                      return KartuKegiatan(kegiatan: daftarKegiatan[index]);
                    },
                  ),
                ),
              ],
            ),
      // Aksi Utama (Bagian 7.2)
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigasi ke form check-in / tambah kegiatan (Pertemuan 6)
        },
        icon: const Icon(Icons.assignment_turned_in),
        label: const Text('Kehadiran Saya'),
      ),
    );
  }
}

class RingkasanAtas extends StatelessWidget {
  const RingkasanAtas({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Halo, Anggota!', style: textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(
              'Pilih kegiatan di bawah untuk melakukan check-in kehadiran.',
              style: textTheme.bodyMedium?.copyWith(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

class KartuKegiatan extends StatelessWidget {
  const KartuKegiatan({super.key, required this.kegiatan});

  final Map<String, String> kegiatan;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.indigo,
          child: Icon(Icons.event, color: Colors.white),
        ),
        title: Text(kegiatan['nama'] ?? '-', style: textTheme.titleMedium),
        subtitle: Text(
          '${kegiatan['tanggal']} • ${kegiatan['lokasi']}',
          style: textTheme.bodySmall,
        ),
        trailing: ChipStatus(status: kegiatan['status'] ?? 'Belum Dibuka'),
      ),
    );
  }
}

// Status Berwarna (Bagian 7.2 & 7.3)
class ChipStatus extends StatelessWidget {
  const ChipStatus({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // Ternary untuk memilih warna dari tema
    final (Color bg, Color fg) = status == 'Dibuka'
        ? (colorScheme.tertiaryContainer, colorScheme.onTertiaryContainer)
        : status == 'Ditutup'
        ? (colorScheme.errorContainer, colorScheme.onErrorContainer)
        : (colorScheme.secondaryContainer, colorScheme.onSecondaryContainer);

    return Chip(
      label: Text(
        status,
        style: TextStyle(color: fg, fontWeight: FontWeight.bold, fontSize: 11),
      ),
      backgroundColor: bg,
      visualDensity: VisualDensity.compact,
    );
  }
}

class KeadaanKosong extends StatelessWidget {
  const KeadaanKosong({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.inbox_outlined, size: 64, color: colorScheme.outline),
          const SizedBox(height: 16),
          Text('Belum ada kegiatan', style: textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            'Saat ini tidak ada sesi absensi yang tersedia.\nSilakan cek kembali nanti.',
            style: textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
