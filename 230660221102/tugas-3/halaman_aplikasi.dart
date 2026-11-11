import 'package:flutter/material.dart';

final daftarAbsensi = [
  {
    'tanggal': '30 September 2026',
    'hari': 'Rabu',
    'checkIn': '07:52',
    'checkOut': '17:03',
    'status': 'Hadir',
  },
  {
    'tanggal': '29 September 2026',
    'hari': 'Selasa',
    'checkIn': '07:58',
    'checkOut': '17:01',
    'status': 'Hadir',
  },
  {
    'tanggal': '28 September 2026',
    'hari': 'Senin',
    'checkIn': '08:12',
    'checkOut': '17:05',
    'status': 'Terlambat',
  },
  {
    'tanggal': '25 September 2026',
    'hari': 'Jumat',
    'checkIn': '07:55',
    'checkOut': '16:58',
    'status': 'Hadir',
  },
];

void main() {
  runApp(const MantraAttendanceApp());
}

class MantraAttendanceApp extends StatelessWidget {
  const MantraAttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mantra Attendance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mantra Attendance'),
        centerTitle: false,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selamat Datang!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            const Text(
              'Pantau kehadiran Anda hari ini.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            // Layout menggunakan Row
            Row(
              children: [
                Expanded(
                  child: _InfoCard(
                    title: 'Check-in',
                    value: '07:52',
                    icon: Icons.login,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _InfoCard(
                    title: 'Check-out',
                    value: '17:03',
                    icon: Icons.logout,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              'Riwayat Absensi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Expanded mencegah RenderFlex overflow
            Expanded(
              child: ListView.builder(
                itemCount: daftarAbsensi.length,
                itemBuilder: (context, index) {
                  final absensi = daftarAbsensi[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          absensi['status'] == 'Hadir'
                              ? Icons.check
                              : Icons.access_time,
                        ),
                      ),

                      title: Text(
                        absensi['tanggal']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      subtitle: Text(
                        '${absensi['hari']} • '
                        'Check-in ${absensi['checkIn']} • '
                        'Check-out ${absensi['checkOut']}',
                      ),

                      trailing: Text(
                        absensi['status']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: absensi['status'] == 'Hadir'
                              ? Colors.green
                              : Colors.orange,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.fingerprint),
        label: const Text('Absensi'),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _InfoCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              child: Icon(icon),
            ),

            const SizedBox(width: 12),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}