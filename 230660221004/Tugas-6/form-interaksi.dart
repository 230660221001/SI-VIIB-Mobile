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
      // Peta route bernama — satu sumber kebenaran untuk seluruh layar (Bagian 4.1).
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardPage(),
        '/pengajuan-izin': (context) => const FormPengajuanIzinPage(),
        '/detail-absensi': (context) => const DetailAbsensiPage(),
      },
    );
  }
}

/// Data riwayat absensi — dipakai di Beranda dan dikirim ke Detail via arguments.
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

  // Maju ke form pengajuan izin — F-05 (Bagian 4.2: pushNamed).
  void _openPengajuanIzin() {
    Navigator.pushNamed(context, '/pengajuan-izin');
  }

  // Maju ke detail riwayat, mengirim data lewat arguments — F-04 (Bagian 5.1).
  void _openDetail(AttendanceRecord record) {
    Navigator.pushNamed(context, '/detail-absensi', arguments: record);
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
                                  _buildIzinAction(),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              flex: 5,
                              child: Column(children: [_buildStatsGrid()]),
                            ),
                          ],
                        )
                      else ...[
                        _buildTodayCard(),
                        const SizedBox(height: 16),
                        _buildStatsGrid(),
                        const SizedBox(height: 16),
                        _buildIzinAction(),
                      ],
                      const SizedBox(height: 28),
                      const Text('Aktivitas terbaru', style: TextStyle(
                        color: PresentGoApp.ink, fontSize: 17, fontWeight: FontWeight.w800,
                      )),
                      const SizedBox(height: 4),
                      const Text('Ketuk kartu untuk melihat detail riwayat',
                          style: TextStyle(color: Color(0xFF89969D), fontSize: 11)),
                      const SizedBox(height: 12),
                      ..._records.map((r) => _buildRecordTile(r)),
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
        const CircleAvatar(
          radius: 20,
          backgroundColor: Color(0xFFDCEFEB),
          child: Text('R', style: TextStyle(color: PresentGoApp.teal, fontWeight: FontWeight.w800)),
        ),
      ],
    );
  }

  Widget _buildWelcome() {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
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
          const Text('KEHADIRAN HARI INI', style: TextStyle(
            color: Color(0xFFC7E8E2), fontSize: 10,
            fontWeight: FontWeight.w800, letterSpacing: 1.2,
          )),
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
      constraints: const BoxConstraints(minHeight: 110),
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
        ],
      ),
    );
  }

  // Tombol aksi menuju form pengajuan izin — F-05.
  Widget _buildIzinAction() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFEBF0F1)),
      ),
      child: Row(
        children: [
          const Icon(Icons.note_alt_outlined, color: PresentGoApp.teal, size: 21),
          const SizedBox(width: 11),
          const Expanded(
            child: Text('Perlu mengajukan izin?', style: TextStyle(
              color: PresentGoApp.ink, fontSize: 13, fontWeight: FontWeight.w800,
            )),
          ),
          FilledButton(
            onPressed: _openPengajuanIzin,
            style: FilledButton.styleFrom(backgroundColor: PresentGoApp.teal),
            child: const Text('Ajukan Izin'),
          ),
        ],
      ),
    );
  }

  Widget _buildRecordTile(AttendanceRecord record) {
    return InkWell(
      onTap: () => _openDetail(record),
      borderRadius: BorderRadius.circular(16),
      child: Container(
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
            const SizedBox(width: 4),
            const Icon(Icons.chevron_right_rounded, color: Color(0xFFB6C0C4), size: 18),
          ],
        ),
      ),
    );
  }
}

/// Layar detail — dibuka dari kartu riwayat, hanya menampilkan data (read-only).
/// Dibuka melalui push, sehingga selalu menyediakan tombol Kembali (Bagian 4.2).
class DetailAbsensiPage extends StatelessWidget {
  const DetailAbsensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Membaca arguments dengan pemeriksaan tipe dan cabang null (Bagian 5.1).
    final args = ModalRoute.of(context)?.settings.arguments;
    final record = args is AttendanceRecord ? args : null;

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Riwayat Absensi')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: record == null
              // Data tidak tersedia — layar tidak berhenti dengan error (Bagian 5.2).
              ? const Center(
                  child: Text(
                    'Data riwayat tidak tersedia. Buka layar ini melalui kartu riwayat pada Beranda.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF79747E)),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFEBF0F1)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 44, height: 44,
                                decoration: BoxDecoration(
                                  color: record.color.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Icon(record.icon, color: record.color, size: 22),
                              ),
                              const SizedBox(width: 14),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(record.day, style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w800, color: PresentGoApp.ink,
                                  )),
                                  Text(record.date, style: const TextStyle(
                                    fontSize: 12, color: Color(0xFF89969D),
                                  )),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          const Divider(height: 1),
                          const SizedBox(height: 16),
                          _detailRow('Status', record.status, valueColor: record.color),
                          const SizedBox(height: 10),
                          _detailRow('Jam', record.time),
                          const SizedBox(height: 10),
                          _detailRow('Keterangan', record.note),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () => Navigator.pop(context),
                        style: FilledButton.styleFrom(backgroundColor: PresentGoApp.teal),
                        child: const Text('Kembali'),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value, {Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFF89969D), fontSize: 12)),
        Text(value, style: TextStyle(
          color: valueColor ?? PresentGoApp.ink, fontSize: 13, fontWeight: FontWeight.w700,
        )),
      ],
    );
  }
}

/// Form pengajuan izin — F-05. Dibuka melalui push dari Beranda.
class FormPengajuanIzinPage extends StatefulWidget {
  const FormPengajuanIzinPage({super.key});

  @override
  State<FormPengajuanIzinPage> createState() => _FormPengajuanIzinPageState();
}

class _FormPengajuanIzinPageState extends State<FormPengajuanIzinPage> {
  final _formKey = GlobalKey<FormState>();
  final _jenisController = TextEditingController();
  final _tanggalController = TextEditingController();
  final _alasanController = TextEditingController();

  @override
  void dispose() {
    // Controller dibersihkan agar tidak menumpuk setiap layar dibuka (Bagian 6.3).
    _jenisController.dispose();
    _tanggalController.dispose();
    _alasanController.dispose();
    super.dispose();
  }

  // Urutan aksi kirim: validasi → feedback → pop (Bagian 6.2).
  void _kirim() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final jenis = _jenisController.text.trim();
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('Pengajuan izin "$jenis" berhasil dikirim (simulasi).')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengajuan Izin')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _jenisController,
                  decoration: const InputDecoration(
                    labelText: 'Jenis izin (mis. Sakit, Cuti)',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Jenis izin wajib diisi.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _tanggalController,
                  decoration: const InputDecoration(
                    labelText: 'Tanggal (contoh: 10 November 2026)',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Tanggal wajib diisi.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _alasanController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Alasan',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Alasan wajib diisi.';
                    }
                    if (value.trim().length < 5) {
                      return 'Alasan terlalu singkat, minimal 5 karakter.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: _kirim,
                  style: FilledButton.styleFrom(
                    backgroundColor: PresentGoApp.teal,
                    minimumSize: const Size.fromHeight(48),
                  ),
                  child: const Text('Kirim Pengajuan'),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                  child: const Text('Kembali'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
