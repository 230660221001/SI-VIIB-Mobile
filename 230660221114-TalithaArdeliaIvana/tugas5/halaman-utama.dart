
import 'package:flutter/material.dart';

void main() {
  runApp(const AkademikPKBMApp());
}

// ================= WARNA APLIKASI =================

const Color navy = Color(0xFF172554);
const Color blue = Color(0xFF3B82F6);
const Color bg = Color(0xFFF4F7FC);
const Color green = Color(0xFF059669);
const Color orange = Color(0xFFEA580C);

// ================= MAIN APP =================

class AkademikPKBMApp extends StatelessWidget {
  const AkademikPKBMApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Akademik PKBM Al Qosimmiyah',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: bg,
        colorScheme: ColorScheme.fromSeed(
          seedColor: navy,
          primary: navy,
          secondary: blue,
        ),
        fontFamily: 'Roboto',
      ),
      home: const BerandaAkademik(),
    );
  }
}

// ================= HALAMAN BERANDA =================

class BerandaAkademik extends StatelessWidget {
  const BerandaAkademik({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,

      // HEADER
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 16,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: navy,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.school,
                color: Colors.white,
                size: 23,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'PKBM Al Qosimmiyah',
              style: TextStyle(
                color: navy,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Belum ada notifikasi baru.'),
                ),
              );
            },
            icon: const Icon(
              Icons.notifications_none,
              color: navy,
              size: 27,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),

      // KONTEN UTAMA
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // SAPAAN
            const Text(
              'SELAMAT DATANG 👋',
              style: TextStyle(
                color: blue,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Semangat Belajar, Warga Belajar!',
              style: TextStyle(
                color: navy,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // KARTU IDENTITAS PKBM
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF172554),
                    Color(0xFF3157A5),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.school,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),

                  const SizedBox(width: 14),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PUSAT KEGIATAN BELAJAR MASYARAKAT',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 8,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'PKBM Al Qosimmiyah',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Layanan Informasi Akademik',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // JUDUL LAYANAN
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Layanan Akademik',
                  style: TextStyle(
                    color: navy,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '3 Layanan',
                  style: TextStyle(
                    color: blue,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // KARTU NILAI DAN PELAJARAN
            Row(
              children: [
                Expanded(
                  child: kartuLayanan(
                    icon: Icons.bar_chart_rounded,
                    warna: blue,
                    judul: 'Nilai Akademik',
                    keterangan: 'Lihat hasil belajar',
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: kartuLayanan(
                    icon: Icons.menu_book_rounded,
                    warna: green,
                    judul: 'Jadwal Pelajaran',
                    keterangan: 'Jadwal kegiatan belajar',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // KARTU JADWAL UJIAN
            Container(
              width: double.infinity,
              decoration: kartuStyle(),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 5,
                ),
                leading: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEDD5),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: const Icon(
                    Icons.event_available,
                    color: orange,
                    size: 23,
                  ),
                ),
                title: const Text(
                  'Jadwal Ujian',
                  style: TextStyle(
                    color: navy,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                subtitle: const Text(
                  'Informasi tanggal dan waktu ujian',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 10,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: navy,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // UJIAN MENDATANG
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Ujian Mendatang',
                  style: TextStyle(
                    color: navy,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Lihat jadwal',
                  style: TextStyle(
                    color: blue,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // HANYA UJIAN MATEMATIKA
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: kartuStyle(),
              child: Row(
                children: [
                  Container(
                    width: 56,
                    height: 65,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEDD5),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '02',
                          style: TextStyle(
                            color: Color(0xFF9A3412),
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'NOV',
                          style: TextStyle(
                            color: Color(0xFF9A3412),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 14),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Matematika',
                          style: TextStyle(
                            color: navy,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Senin • 08.00 - 10.00',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Icon(
                    Icons.calendar_month,
                    color: orange,
                    size: 23,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFDBEAFE),
        selectedIndex: 0,
        height: 72,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: navy),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart),
            label: 'Nilai',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book),
            label: 'Pelajaran',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month),
            label: 'Ujian',
          ),
        ],
      ),
    );
  }

  // KARTU LAYANAN
  Widget kartuLayanan({
    required IconData icon,
    required Color warna,
    required String judul,
    required String keterangan,
  }) {
    return Container(
      height: 122,
      padding: const EdgeInsets.all(14),
      decoration: kartuStyle(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: warna.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: warna,
              size: 21,
            ),
          ),

          const Spacer(),

          Text(
            judul,
            style: const TextStyle(
              color: navy,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            keterangan,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }

  // STYLE KARTU
  BoxDecoration kartuStyle() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(17),
      border: Border.all(
        color: const Color(0xFFE8EDF5),
      ),
      boxShadow: [
        BoxShadow(
          color: navy.withValues(alpha: 0.035),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}