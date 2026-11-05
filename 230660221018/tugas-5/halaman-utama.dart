import 'package:flutter/material.dart';

void main() {
  runApp(const SiporaApp());
}

class SiporaApp extends StatelessWidget {
  const SiporaApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF2457C5);

    return MaterialApp(
      title: 'SIPORA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF5F7FC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: primary,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF5F7FC),
          foregroundColor: Color(0xFF182B49),
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
            color: Color(0xFF182B49),
            letterSpacing: -0.6,
          ),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Color(0xFFE9EDF5)),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            minimumSize: const Size(0, 50),
            backgroundColor: primary,
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      home: const HalamanUtama(),
    );
  }
}

class Pengajuan {
  final String jenis;
  final String instansi;
  final String tanggal;
  final String status;

  const Pengajuan({
    required this.jenis,
    required this.instansi,
    required this.tanggal,
    required this.status,
  });
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int _selectedIndex = 0;

  static const Color primary = Color(0xFF2457C5);
  static const Color ink = Color(0xFF182B49);
  static const Color muted = Color(0xFF718096);
  static const Color line = Color(0xFFE9EDF5);

  final List<Pengajuan> _pengajuan = [
    const Pengajuan(
      jenis: 'Surat Observasi',
      instansi: 'PT. Maju Sejahtera',
      tanggal: '12 Okt 2026 • 09:30',
      status: 'Diproses',
    ),
    const Pengajuan(
      jenis: 'Surat Penelitian',
      instansi: 'Dinas Pendidikan',
      tanggal: '10 Okt 2026 • 14:15',
      status: 'Disetujui',
    ),
    const Pengajuan(
      jenis: 'Surat Observasi',
      instansi: 'CV. Teknologi Nusantara',
      tanggal: '08 Okt 2026 • 10:00',
      status: 'Selesai',
    ),
    const Pengajuan(
      jenis: 'Surat Penelitian',
      instansi: 'PT. Agro Mandiri',
      tanggal: '05 Okt 2026 • 13:00',
      status: 'Ditolak',
    ),
  ];

  int _jumlah(String status) =>
      _pengajuan.where((item) => item.status == status).length;

  void _tampilkanPesan(String pesan) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(pesan),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      );
  }

  void _ajukanSurat() {
    _tampilkanPesan(
      'Formulir pengajuan surat akan tersedia pada tahap pengembangan berikutnya.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIPORA'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: line),
            ),
            child: IconButton(
              tooltip: 'Notifikasi',
              onPressed: () {
                _tampilkanPesan('Belum ada notifikasi baru.');
              },
              icon: const Icon(Icons.notifications_none_rounded),
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [_buildBeranda(), _buildDaftarPengajuan(), _buildProfil()],
      ),
      bottomNavigationBar: NavigationBar(
        height: 72,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFE8EFFF),
        elevation: 0,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.description_outlined),
            selectedIcon: Icon(Icons.description_rounded),
            label: 'Pengajuan',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Akun',
          ),
        ],
      ),
    );
  }

  Widget _buildBeranda() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
      children: [
        _buildIdentitas(),
        const SizedBox(height: 20),
        _buildRingkasan(),
        const SizedBox(height: 14),
        _buildTombolAjukan(),
        const SizedBox(height: 30),
        _buildJudul(
          'Status Pengajuan',
          'Pantau perkembangan surat akademik Anda.',
        ),
        const SizedBox(height: 15),
        _buildStatistik(),
        const SizedBox(height: 30),
        _buildJudul(
          'Pengajuan Terbaru',
          'Lihat riwayat pengajuan surat Anda.',
          aksi: 'Lihat semua',
          onAksi: () => setState(() => _selectedIndex = 1),
        ),
        const SizedBox(height: 14),
        if (_pengajuan.isEmpty)
          _buildKeadaanKosong()
        else
          ..._pengajuan.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 11),
              child: _buildKartuPengajuan(item),
            ),
          ),
      ],
    );
  }

  Widget _buildIdentitas() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF477BE0), Color(0xFF2457C5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(17),
              ),
              child: const Icon(
                Icons.person_rounded,
                color: Colors.white,
                size: 29,
              ),
            ),
            const SizedBox(width: 14),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat datang,',
                    style: TextStyle(color: muted, fontSize: 12),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Intan Kartika',
                    style: TextStyle(
                      color: ink,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.3,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Mahasiswa • Sistem Informasi',
                    style: TextStyle(color: muted, fontSize: 11),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.verified_rounded,
              color: Color(0xFF2457C5),
              size: 21,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRingkasan() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF244FAE), Color(0xFF3476E8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: primary.withValues(alpha: 0.18),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -22,
            top: -35,
            child: Container(
              width: 115,
              height: 115,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.07),
              ),
            ),
          ),
          Positioned(
            right: 35,
            bottom: -50,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.folder_open_rounded,
                          color: Colors.white70,
                          size: 18,
                        ),
                        SizedBox(width: 7),
                        Text(
                          'TOTAL PENGAJUAN',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 13),
                    Text(
                      '${_pengajuan.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        height: 1.1,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -1,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Pengajuan surat tercatat',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.18),
                  ),
                ),
                child: const Icon(
                  Icons.insert_drive_file_rounded,
                  size: 31,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTombolAjukan() {
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        onPressed: _ajukanSurat,
        icon: const Icon(Icons.add_circle_outline_rounded, size: 21),
        label: const Text('+ Ajukan Surat'),
        style: FilledButton.styleFrom(
          minimumSize: const Size(double.infinity, 54),
          backgroundColor: primary,
          foregroundColor: Colors.white,
          elevation: 2,
          shadowColor: primary.withValues(alpha: 0.20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  Widget _buildJudul(
    String judul,
    String deskripsi, {
    String? aksi,
    VoidCallback? onAksi,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                judul,
                style: const TextStyle(
                  color: ink,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.45,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                deskripsi,
                style: const TextStyle(color: muted, fontSize: 11, height: 1.5),
              ),
            ],
          ),
        ),
        if (aksi != null)
          TextButton(
            onPressed: onAksi,
            style: TextButton.styleFrom(
              foregroundColor: primary,
              padding: const EdgeInsets.only(left: 8),
            ),
            child: Text(
              aksi,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),
          ),
      ],
    );
  }

  Widget _buildStatistik() {
    final items = [
      _StatusData(
        label: 'Diproses',
        jumlah: _jumlah('Diproses'),
        warna: const Color(0xFFB66A00),
        latar: const Color(0xFFFFF3D9),
        ikon: Icons.schedule_rounded,
        deskripsi: 'Dalam peninjauan',
      ),
      _StatusData(
        label: 'Disetujui',
        jumlah: _jumlah('Disetujui'),
        warna: const Color(0xFF2457C5),
        latar: const Color(0xFFEAF0FF),
        ikon: Icons.check_circle_outline_rounded,
        deskripsi: 'Permohonan diterima',
      ),
      _StatusData(
        label: 'Ditolak',
        jumlah: _jumlah('Ditolak'),
        warna: const Color(0xFFCE3D4B),
        latar: const Color(0xFFFFEBEE),
        ikon: Icons.highlight_off_rounded,
        deskripsi: 'Perlu tindak lanjut',
      ),
      _StatusData(
        label: 'Selesai',
        jumlah: _jumlah('Selesai'),
        warna: const Color(0xFF14835D),
        latar: const Color(0xFFE3F6ED),
        ikon: Icons.task_alt_rounded,
        deskripsi: 'Proses telah tuntas',
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 130,
      ),
      itemBuilder: (context, index) {
        return _buildKartuStatistik(items[index]);
      },
    );
  }

  Widget _buildKartuStatistik(_StatusData data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: data.latar,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Icon(data.ikon, color: data.warna, size: 21),
                ),
                const Spacer(),
                Text(
                  '${data.jumlah}',
                  style: const TextStyle(
                    color: ink,
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.7,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              data.label,
              style: const TextStyle(
                color: ink,
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              data.deskripsi,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: muted, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKartuPengajuan(Pengajuan item) {
    final status = _statusStyle(item.status);

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          _tampilkanPesan('Detail ${item.jenis} belum tersedia.');
        },
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 52,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFEEF3FF), Color(0xFFF5F7FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.description_rounded,
                  color: primary,
                  size: 25,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.jenis,
                      style: const TextStyle(
                        color: ink,
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      item.instansi,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: muted, fontSize: 11),
                    ),
                    const SizedBox(height: 9),
                    Row(
                      children: [
                        const Icon(
                          Icons.schedule_rounded,
                          color: muted,
                          size: 13,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            item.tanggal,
                            style: const TextStyle(color: muted, fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _buildBadge(item.status, status),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 12, left: 4),
                child: Icon(
                  Icons.chevron_right_rounded,
                  color: Color(0xFF98A2B3),
                  size: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBadge(String label, _StatusStyleData style) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: style.background,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: style.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(style.ikon, size: 13, color: style.warna),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                color: style.warna,
                fontSize: 10,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _StatusStyleData _statusStyle(String status) {
    switch (status) {
      case 'Diproses':
        return const _StatusStyleData(
          warna: Color(0xFF9A5B00),
          background: Color(0xFFFFF3D9),
          border: Color(0xFFFFE2A3),
          ikon: Icons.schedule_rounded,
        );
      case 'Disetujui':
        return const _StatusStyleData(
          warna: Color(0xFF2457C5),
          background: Color(0xFFEAF0FF),
          border: Color(0xFFD2DFFF),
          ikon: Icons.check_circle_rounded,
        );
      case 'Ditolak':
        return const _StatusStyleData(
          warna: Color(0xFFB42332),
          background: Color(0xFFFFEBEE),
          border: Color(0xFFFFD1D7),
          ikon: Icons.cancel_rounded,
        );
      case 'Selesai':
        return const _StatusStyleData(
          warna: Color(0xFF11734F),
          background: Color(0xFFE3F6ED),
          border: Color(0xFFC5EBDD),
          ikon: Icons.task_alt_rounded,
        );
      default:
        return const _StatusStyleData(
          warna: Color(0xFF475467),
          background: Color(0xFFF2F4F7),
          border: Color(0xFFE4E7EC),
          ikon: Icons.info_outline_rounded,
        );
    }
  }

  Widget _buildKeadaanKosong() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: const Color(0xFFEAF0FF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.description_outlined,
                size: 32,
                color: primary,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Belum ada pengajuan',
              style: TextStyle(
                color: ink,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Mulai ajukan surat observasi atau penelitian '
              'untuk kebutuhan akademik Anda.',
              textAlign: TextAlign.center,
              style: TextStyle(color: muted, fontSize: 12, height: 1.6),
            ),
            const SizedBox(height: 18),
            FilledButton.icon(
              onPressed: _ajukanSurat,
              icon: const Icon(Icons.add_rounded),
              label: const Text('Ajukan Surat'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDaftarPengajuan() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
      children: [
        const Text(
          'Daftar Pengajuan',
          style: TextStyle(
            color: ink,
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Seluruh riwayat surat observasi dan penelitian Anda.',
          style: TextStyle(color: muted, fontSize: 12),
        ),
        const SizedBox(height: 20),
        if (_pengajuan.isEmpty)
          _buildKeadaanKosong()
        else
          ..._pengajuan.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 11),
              child: _buildKartuPengajuan(item),
            ),
          ),
      ],
    );
  }

  Widget _buildProfil() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Column(
              children: [
                Container(
                  width: 82,
                  height: 82,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF477BE0), Color(0xFF2457C5)],
                    ),
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: const Icon(
                    Icons.person_rounded,
                    color: Colors.white,
                    size: 43,
                  ),
                ),
                const SizedBox(height: 17),
                const Text(
                  'Intan Kartika',
                  style: TextStyle(
                    color: ink,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 7),
                const Text(
                  'Mahasiswa • Sistem Informasi',
                  style: TextStyle(color: muted, fontSize: 12),
                ),
                const SizedBox(height: 22),
                const Divider(color: line),
                const ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.school_outlined, color: primary),
                  title: Text(
                    'Program Studi',
                    style: TextStyle(fontSize: 12, color: muted),
                  ),
                  subtitle: Text(
                    'Sistem Informasi',
                    style: TextStyle(color: ink, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _StatusData {
  final String label;
  final int jumlah;
  final String deskripsi;
  final Color warna;
  final Color latar;
  final IconData ikon;

  const _StatusData({
    required this.label,
    required this.jumlah,
    required this.warna,
    required this.latar,
    required this.ikon,
    required this.deskripsi,
  });
}

class _StatusStyleData {
  final Color warna;
  final Color background;
  final Color border;
  final IconData ikon;

  const _StatusStyleData({
    required this.warna,
    required this.background,
    required this.border,
    required this.ikon,
  });
}
