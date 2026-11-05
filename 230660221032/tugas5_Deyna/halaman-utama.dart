import 'package:flutter/material.dart';

void main() {
  runApp(const RadiActApp());
}

/// Aplikasi Utama RadiAct
class RadiActApp extends StatelessWidget {
  const RadiActApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RadiAct - UNSAP Radio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFD700),
          primary: const Color(0xFFFFD700),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F5F7),
      ),
      home: const HalamanUtama(),
    );
  }
}

/// Halaman utama aplikasi RadiAct.
class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  /// Ubah menjadi true untuk menguji keadaan kosong (Empty State).
  static const bool semuaJadwalKosong = false;

  static const List<Map<String, String>> daftarJadwal = [
    {
      'judul': 'Edufan Radio',
      'divisi': 'DIVISI EDUKASI',
      'tanggal': '1 Oktober 2026',
      'status': 'Tayang',
      'catatan': 'Tidak ada hambatan.',
    },
    {
      'judul': 'Redaksi Insight',
      'divisi': 'DIVISI REDAKSI',
      'tanggal': '20 Oktober 2026',
      'status': 'Tayang',
      'catatan': 'Tidak ada hambatan.',
    },
    {
      'judul': 'Unsap Tranding',
      'divisi': 'DIVISI ENTERTAIN',
      'tanggal': '24 Oktober 2026',
      'status': 'Progres',
      'catatan': 'Tahap Editing.',
    },
    {
      'judul': 'Minggu Opini',
      'divisi': 'DIVISI REDAKSI',
      'tanggal': '28 Oktober 2026',
      'status': 'Terkendala',
      'catatan': 'Talent Sakit. Diundur.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final tampilkanKeadaanKosong = daftarJadwal.isEmpty || semuaJadwalKosong;

    final totalProgram = tampilkanKeadaanKosong ? 0 : daftarJadwal.length;
    final totalProgres = tampilkanKeadaanKosong
        ? 0
        : daftarJadwal.where((j) => j['status'] == 'Progres').length;
    final totalTayang = tampilkanKeadaanKosong
        ? 0
        : daftarJadwal.where((j) => j['status'] == 'Tayang').length;
    final totalTerkendala = tampilkanKeadaanKosong
        ? 0
        : daftarJadwal.where((j) => j['status'] == 'Terkendala').length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 238, 7),
        title: const Text(
          'RadiAct',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
        ),
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Sapaan User
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
            child: Text(
              'Hallo Deyna! Selamat Datang.',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),

          // Section Ringkasan
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ringkasan',
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _ItemBadgeRingkasan(
                      label: 'Total Program',
                      jumlah: totalProgram,
                    ),
                    const SizedBox(width: 8),
                    _ItemBadgeRingkasan(label: 'Progres', jumlah: totalProgres),
                    const SizedBox(width: 8),
                    _ItemBadgeRingkasan(label: 'Tayang', jumlah: totalTayang),
                    const SizedBox(width: 8),
                    _ItemBadgeRingkasan(
                      label: 'Terkendala',
                      jumlah: totalTerkendala,
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Title Daftar Jadwal
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Daftar Jadwal',
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Area Konten Utama
          Expanded(
            child: tampilkanKeadaanKosong
                ? const KeadaanKosong()
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    itemCount: daftarJadwal.length,
                    itemBuilder: (context, index) {
                      final jadwal = daftarJadwal[index];
                      return KartuJadwal(jadwal: jadwal);
                    },
                  ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Aksi Tambah Jadwal Baru (Form dibuka pada Pertemuan Berikutnya)',
              ),
            ),
          );
        },
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }
}

/// Widget 4 Badge Ringkasan Bulat
class _ItemBadgeRingkasan extends StatelessWidget {
  const _ItemBadgeRingkasan({required this.label, required this.jumlah});

  final String label;
  final int jumlah;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              '$jumlah',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget Kartu Jadwal
class KartuJadwal extends StatelessWidget {
  const KartuJadwal({super.key, required this.jadwal});

  final Map<String, String> jadwal;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Baris Atas: Badge Tanggal & Status Chip
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  jadwal['tanggal'] ?? '',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ChipStatus(status: jadwal['status'] ?? 'Progres'),
            ],
          ),

          const SizedBox(height: 10),

          // Baris Tengah: Judul + Catatan (Di kanan) dan Tombol Tombol
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kiri: Judul dan Divisi
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jadwal['judul'] ?? '-',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      jadwal['divisi'] ?? '',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),

              // Kanan: Box Catatan Kendala/Progres
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Text(
                    jadwal['catatan'] ?? '-',
                    style: TextStyle(fontSize: 10, color: Colors.grey.shade800),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Baris Bawah: Tombol Edit dan Hapus (Berbentuk Button)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 28,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    side: BorderSide(color: Colors.amber.shade800),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.amber.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                height: 28,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    side: BorderSide(color: Colors.red.shade400),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Hapus',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.red.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Widget ChipStatus dengan Warna Berbeda dan Jelas (Hijau, Biru, Merah)
class ChipStatus extends StatelessWidget {
  const ChipStatus({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color fg;

    if (status == 'Tayang') {
      bg = Colors.green.shade100;
      fg = Colors.green.shade900;
    } else if (status == 'Terkendala') {
      bg = Colors.red.shade100;
      fg = Colors.red.shade900;
    } else {
      // Progres
      bg = Colors.blue.shade100;
      fg = Colors.blue.shade900;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: TextStyle(color: fg, fontWeight: FontWeight.bold, fontSize: 11),
      ),
    );
  }
}

/// Keadaan Kosong (Empty State)
class KeadaanKosong extends StatelessWidget {
  const KeadaanKosong({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.radio_outlined, size: 64, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          const Text(
            'Belum Ada Jadwal',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Jadwal program radio belum ditambahkan.\nGunakan tombol + di bawah untuk membuat jadwal baru.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
