import 'package:flutter/material.dart';

void main() => runApp(const PresentGoApp());

class PresentGoApp extends StatelessWidget {
  const PresentGoApp({super.key});

  static const Color ink = Color(0xFF172B3A);
  static const Color teal = Color(0xFF087F75);
  static const Color canvas = Color(0xFFF4F7F8);

  @override
  Widget build(BuildContext context) {
    final scheme = ColorScheme.fromSeed(seedColor: teal, brightness: Brightness.light);
    return MaterialApp(
      title: 'PresentGo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: scheme,
        scaffoldBackgroundColor: canvas,
        appBarTheme: const AppBarTheme(
          backgroundColor: canvas,
          foregroundColor: ink,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
      home: const DashboardPage(),
    );
  }
}

class AttendanceRecord {
  final String day, date, time, status, note;
  final IconData icon;
  final Color color;

  const AttendanceRecord({
    required this.day,
    required this.date,
    required this.time,
    required this.status,
    required this.note,
    required this.icon,
    required this.color,
  });
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _checkedIn = false;

  static const _records = <AttendanceRecord>[
    AttendanceRecord(
      day: 'Hari ini', date: 'Senin, 9 Nov', time: '08.02',
      status: 'Hadir', note: 'Tepat waktu',
      icon: Icons.check_circle_rounded, color: Color(0xFF0B9A83),
    ),
    AttendanceRecord(
      day: 'Kemarin', date: 'Jumat, 6 Nov', time: '08.16',
      status: 'Terlambat', note: 'Terlambat 16 menit',
      icon: Icons.schedule_rounded, color: Color(0xFFE49A36),
    ),
    AttendanceRecord(
      day: '2 hari lalu', date: 'Kamis, 5 Nov', time: '—',
      status: 'Izin', note: 'Pengajuan izin',
      icon: Icons.event_available_rounded, color: Color(0xFF718096),
    ),
  ];

  void _handleAttendance() {
    setState(() => _checkedIn = !_checkedIn);
    final message = _checkedIn
        ? 'Absensi masuk berhasil dicatat (simulasi).'
        : 'Absensi pulang berhasil dicatat (simulasi).';
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isDesktop = width >= 900;
    final horizontalPadding = width >= 1100 ? 36.0 : (isDesktop ? 28.0 : 20.0);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1180),
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(horizontalPadding, 18, horizontalPadding, 28),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      _buildTopBar(),
                      const SizedBox(height: 28),
                      _buildWelcome(),
                      const SizedBox(height: 24),
                      if (isDesktop)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 6,
                              child: Column(
                                children: [
                                  _buildTodayCard(),
                                  const SizedBox(height: 18),
                                  _buildWeeklyOverview(),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  _buildStatsGrid(),
                                  const SizedBox(height: 18),
                                  _buildQuickInfo(),
                                ],
                              ),
                            ),
                          ],
                        )
                      else ...[
                        _buildTodayCard(),
                        const SizedBox(height: 16),
                        _buildStatsGrid(),
                        const SizedBox(height: 18),
                        _buildWeeklyOverview(),
                      ],
                      const SizedBox(height: 28),
                      _buildSectionHeading(
                        'Aktivitas terbaru',
                        'Lihat riwayat',
                        onAction: () => _showMessage('Halaman riwayat akan dihubungkan pada Tugas 6.'),
                      ),
                      const SizedBox(height: 12),
                      ..._records.map(_buildRecordTile),
                      const SizedBox(height: 16),
                      if (!isDesktop) _buildQuickInfo(),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _handleAttendance,
        backgroundColor: PresentGoApp.teal,
        foregroundColor: Colors.white,
        elevation: 2,
        icon: Icon(_checkedIn ? Icons.logout_rounded : Icons.fingerprint_rounded),
        label: Text(
          _checkedIn ? 'Absen Pulang' : 'Absen Sekarang',
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: PresentGoApp.teal,
            borderRadius: BorderRadius.circular(13),
          ),
          child: const Icon(Icons.event_available_rounded, color: Colors.white, size: 23),
        ),
        const SizedBox(width: 11),
        const Text(
          'PresentGo',
          style: TextStyle(
            color: PresentGoApp.ink, fontSize: 21,
            fontWeight: FontWeight.w800, letterSpacing: -0.5,
          ),
        ),
        const Spacer(),
        IconButton(
          tooltip: 'Notifikasi',
          onPressed: () => _showMessage('Belum ada notifikasi baru.'),
          style: IconButton.styleFrom(backgroundColor: Colors.white, foregroundColor: PresentGoApp.ink),
          icon: const Icon(Icons.notifications_none_rounded),
        ),
        const SizedBox(width: 8),
        const CircleAvatar(
          radius: 20,
          backgroundColor: Color(0xFFDCEFEB),
          child: Text('R', style: TextStyle(color: PresentGoApp.teal, fontWeight: FontWeight.w800)),
        ),
      ],
    );
  }

  Widget _buildWelcome() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat pagi, Rian',
                style: TextStyle(
                  color: PresentGoApp.ink, fontSize: 25, height: 1.2,
                  fontWeight: FontWeight.w800, letterSpacing: -0.7,
                ),
              ),
              SizedBox(height: 7),
              Text(
                'Semoga harimu produktif. Jangan lupa absen, ya!',
                style: TextStyle(color: Color(0xFF71808B), fontSize: 13, height: 1.4),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: const Row(
            children: [
              Icon(Icons.calendar_today_rounded, size: 14, color: PresentGoApp.teal),
              SizedBox(width: 7),
              Text('9 Nov 2026', style: TextStyle(
                color: PresentGoApp.ink, fontSize: 11, fontWeight: FontWeight.w700,
              )),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTodayCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFF087F75),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF087F75).withOpacity(0.13),
            blurRadius: 22, offset: const Offset(0, 9),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text('KEHADIRAN HARI INI', style: TextStyle(
                  color: Color(0xFFC7E8E2), fontSize: 10,
                  fontWeight: FontWeight.w800, letterSpacing: 1.2,
                )),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.14),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.circle, size: 7, color: Color(0xFF8DE0C6)),
                    SizedBox(width: 6),
                    Text('Hari kerja', style: TextStyle(
                      color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600,
                    )),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              Expanded(child: _timeColumn('MASUK', _checkedIn ? '08.02' : '--:--')),
              Container(width: 1, height: 48, color: Colors.white.withOpacity(0.22)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: _timeColumn('PULANG', '--:--'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(height: 1, color: Colors.white.withOpacity(0.18)),
          const SizedBox(height: 15),
          Row(
            children: [
              const Icon(Icons.info_outline_rounded, size: 15, color: Color(0xFFD7F0EB)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  _checkedIn ? 'Absensi masuk sudah tercatat.' : 'Kamu belum melakukan absensi hari ini.',
                  style: const TextStyle(color: Color(0xFFD7F0EB), fontSize: 11),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _timeColumn(String label, String time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(
          color: Color(0xFFC7E8E2), fontSize: 10,
          fontWeight: FontWeight.w700, letterSpacing: 1,
        )),
        const SizedBox(height: 7),
        Text(time, style: const TextStyle(
          color: Colors.white, fontSize: 27,
          fontWeight: FontWeight.w800, letterSpacing: -0.7,
        )),
      ],
    );
  }

  Widget _buildStatsGrid() {
    return Row(
      children: [
        Expanded(child: _statCard(
          icon: Icons.verified_user_outlined, label: 'Kehadiran', value: '87%',
          tint: const Color(0xFFE4F3EF), accent: const Color(0xFF087F75),
        )),
        const SizedBox(width: 12),
        Expanded(child: _statCard(
          icon: Icons.event_busy_outlined, label: 'Total izin', value: '2 hari',
          tint: const Color(0xFFEEF0F8), accent: const Color(0xFF6877A5),
        )),
        const SizedBox(width: 12),
        Expanded(child: _statCard(
          icon: Icons.schedule_rounded, label: 'Terlambat', value: '1 kali',
          tint: const Color(0xFFFFF2E2), accent: const Color(0xFFD88B2D),
        )),
      ],
    );
  }

  Widget _statCard({
    required IconData icon,
    required String label,
    required String value,
    required Color tint,
    required Color accent,
  }) {
    return Container(
      constraints: const BoxConstraints(minHeight: 132),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFEBF0F1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32, height: 32,
            decoration: BoxDecoration(color: tint, borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: accent, size: 17),
          ),
          const SizedBox(height: 13),
          Text(value, style: const TextStyle(
            color: PresentGoApp.ink, fontSize: 18, fontWeight: FontWeight.w800,
          )),
          const SizedBox(height: 3),
          Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(
            color: Color(0xFF53636D), fontSize: 10, fontWeight: FontWeight.w700,
          )),
          const SizedBox(height: 2),
          const Text('Bulan ini', style: TextStyle(color: Color(0xFF9AA5AB), fontSize: 9)),
        ],
      ),
    );
  }

  Widget _buildWeeklyOverview() {
    const days = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];
    const values = [0.82, 0.95, 0.72, 0.88, 0.92, 0.0, 0.0];
    return _panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Ringkasan mingguan', style: TextStyle(
            color: PresentGoApp.ink, fontSize: 15, fontWeight: FontWeight.w800,
          )),
          const SizedBox(height: 4),
          const Text('Kedisiplinan kehadiran minggu ini',
              style: TextStyle(color: Color(0xFF89969D), fontSize: 11)),
          const SizedBox(height: 20),
          SizedBox(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(days.length, (index) {
                final hasData = values[index] > 0;
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: hasData ? 66 * values[index] : 5,
                        width: 18,
                        decoration: BoxDecoration(
                          color: hasData ? const Color(0xFF2AA997) : const Color(0xFFE9EEEE),
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(days[index], style: const TextStyle(
                        color: Color(0xFF8A979D), fontSize: 10,
                      )),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickInfo() {
    return _panel(
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lightbulb_outline_rounded, color: PresentGoApp.teal, size: 21),
          SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pengingat', style: TextStyle(
                  color: PresentGoApp.ink, fontSize: 13, fontWeight: FontWeight.w800,
                )),
                SizedBox(height: 5),
                Text(
                  'Lakukan absensi saat tiba di kantor dan pastikan waktu perangkat sudah sesuai.',
                  style: TextStyle(color: Color(0xFF77858D), fontSize: 11, height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeading(String title, String action, {required VoidCallback onAction}) {
    return Row(
      children: [
        Expanded(child: Text(title, style: const TextStyle(
          color: PresentGoApp.ink, fontSize: 17, fontWeight: FontWeight.w800,
        ))),
        TextButton(
          onPressed: onAction,
          style: TextButton.styleFrom(
            foregroundColor: PresentGoApp.teal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
          ),
          child: Text(action, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700)),
        ),
      ],
    );
  }

  Widget _buildRecordTile(AttendanceRecord record) {
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEBF0F1)),
      ),
      child: Row(
        children: [
          Container(
            width: 40, height: 40,
            decoration: BoxDecoration(
              color: record.color.withOpacity(0.10),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(record.icon, color: record.color, size: 19),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(record.day, style: const TextStyle(
                  color: PresentGoApp.ink, fontSize: 13, fontWeight: FontWeight.w800,
                )),
                const SizedBox(height: 3),
                Text('${record.date}  •  ${record.note}', style: const TextStyle(
                  color: Color(0xFF89969D), fontSize: 10,
                )),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(record.time, style: const TextStyle(
                color: PresentGoApp.ink, fontSize: 13, fontWeight: FontWeight.w800,
              )),
              const SizedBox(height: 4),
              Text(record.status, style: TextStyle(
                color: record.color, fontSize: 10, fontWeight: FontWeight.w700,
              )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _panel({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFEBF0F1)),
      ),
      child: child,
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
