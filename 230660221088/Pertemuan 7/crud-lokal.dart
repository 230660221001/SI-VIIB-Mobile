import 'package:flutter/material.dart';

void main() => runApp(const AplikasiBPBD());

// Satu daftar nama route dipakai di MaterialApp dan seluruh pemanggilan Navigator.
class Rute {
  static const login = '/login';
  static const laporanMasuk = '/laporan-masuk';
  static const detailLaporan = '/detail-laporan';
  static const formPencatatan = '/form-pencatatan';
  static const daftarKejadian = '/daftar-kejadian';
  static const detailKejadian = '/detail-kejadian';
  static const formLaporan = '/form-laporan';
  static const cekStatus = '/cek-status';
  static const dashboardMasyarakat = '/dashboard-masyarakat';
}

class AplikasiBPBD extends StatelessWidget {
  const AplikasiBPBD({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SI Pendataan Bencana BPBD',
      debugShowCheckedModeBanner: false,
      initialRoute: Rute.login,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF17365D),
          tertiary: const Color(0xFFF9A825),
          error: const Color(0xFFD32F2F),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F6F9),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF17365D),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
        ),
      ),
      routes: {
        Rute.login: (_) => const LoginPetugasPage(),
        Rute.laporanMasuk: (_) => const HalamanLaporanMasuk(),
        Rute.detailLaporan: (_) => const DetailLaporanPage(),
        Rute.formPencatatan: (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          return FormPencatatanPage(
            initialData: args is KejadianBencana ? args : null,
          );
        },
        Rute.daftarKejadian: (_) => const DaftarKejadianPage(),
        Rute.detailKejadian: (_) => const DetailKejadianPage(),
        Rute.formLaporan: (_) => const FormLaporanMasyarakatPage(),
        Rute.cekStatus: (_) => const CekStatusPage(),
        Rute.dashboardMasyarakat: (_) => const DashboardMasyarakatPage(),
      },
    );
  }
}

// Model sederhana untuk mengirim data satu arah dari daftar ke detail.
class LaporanBencana {
  const LaporanBencana({
    required this.jenis,
    required this.lokasi,
    required this.tanggal,
    required this.deskripsi,
    required this.status,
    this.kontak,
  });

  final String jenis;
  final String lokasi;
  final String tanggal;
  final String deskripsi;
  final String status;
  final String? kontak;
}

class KejadianBencana {
  const KejadianBencana({
    required this.id,
    required this.jenis,
    required this.lokasi,
    required this.tanggal,
    required this.statusPenanganan,
    required this.deskripsi,
    this.kontak,
  });

  // ID dibuat sistem dan tidak berubah saat data diperbarui.
  final String id;
  final String jenis;
  final String lokasi;
  final String tanggal;
  final String statusPenanganan;
  final String deskripsi;
  final String? kontak;

  @override
  String toString() =>
      'KejadianBencana(id: $id, jenis: $jenis, lokasi: $lokasi, '
      'tanggal: $tanggal, status: $statusPenanganan)';
}

/// Penyimpanan sementara in-memory yang dipakai bersama antarhalaman.
/// Data tetap tersedia saat logout/login, tetapi hilang saat aplikasi di-restart.
class PenyimpananSementara {
  static final List<KejadianBencana> kejadianManual = <KejadianBencana>[];
}

// -----------------------------------------------------------------------------
// LOGIN PETUGAS — validasi lokal untuk simulasi; belum terhubung ke autentikasi.
// -----------------------------------------------------------------------------
class LoginPetugasPage extends StatefulWidget {
  const LoginPetugasPage({super.key});

  @override
  State<LoginPetugasPage> createState() => _LoginPetugasPageState();
}

class _LoginPetugasPageState extends State<LoginPetugasPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _masuk() {
    if (!_formKey.currentState!.validate()) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Akses demo dibuka; autentikasi server belum tersedia.'),
      ),
    );
    Navigator.pushReplacementNamed(context, Rute.laporanMasuk);
  }

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const JudulAplikasi(),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(Icons.shield_outlined, size: 54, color: warna.primary),
                      const SizedBox(height: 12),
                      Text(
                        'Login Petugas',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Masuk ke sistem pendataan bencana BPBD.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: warna.onSurfaceVariant),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email petugas',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Email petugas wajib diisi.';
                          }
                          if (!value.trim().contains('@')) {
                            return 'Masukkan format email yang valid.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 14),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Kata sandi',
                          prefixIcon: Icon(Icons.lock_outline),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Kata sandi wajib diisi.';
                          }
                          if (value.trim().length < 6) {
                            return 'Kata sandi minimal 6 karakter.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      FilledButton.icon(
                        onPressed: _masuk,
                        icon: const Icon(Icons.login),
                        label: const Text('Masuk sebagai Petugas (Demo)'),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Mode demonstrasi: validasi dilakukan di perangkat dan belum memeriksa akun ke server BPBD.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: warna.onSurfaceVariant,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// DASHBOARD PETUGAS — layar utama F-03.
// -----------------------------------------------------------------------------
class HalamanLaporanMasuk extends StatefulWidget {
  const HalamanLaporanMasuk({super.key});

  @override
  State<HalamanLaporanMasuk> createState() => _HalamanLaporanMasukState();
}

class _HalamanLaporanMasukState extends State<HalamanLaporanMasuk> {
  String kataKunci = '';

  // State utama daftar kejadian lokal. Data bersifat in-memory dan akan
  // hilang ketika aplikasi di-restart.
  late final List<KejadianBencana> _daftarKejadian =
      PenyimpananSementara.kejadianManual;

  List<KejadianBencana> get dataKejadianManual => _daftarKejadian;

  // Data demonstrasi statis; bukan data kejadian aktual yang terverifikasi.
  final List<LaporanBencana> dataLaporan = const [
    LaporanBencana(
      jenis: 'Tanah Longsor',
      lokasi: 'Kecamatan Sumedang Selatan',
      tanggal: '02 Okt 2026',
      deskripsi: 'Contoh laporan longsor setelah hujan deras. Petugas perlu memeriksa kondisi lokasi dan informasi pelapor.',
      status: 'Menunggu Verifikasi',
      kontak: '08xxxxxxxxxx',
    ),
    LaporanBencana(
      jenis: 'Banjir Bandang',
      lokasi: 'Kecamatan Jatinangor',
      tanggal: '28 Sep 2026',
      deskripsi: 'Contoh laporan banjir bandang untuk demonstrasi status klarifikasi.',
      status: 'Perlu Klarifikasi',
    ),
    LaporanBencana(
      jenis: 'Angin Puting Beliung',
      lokasi: 'Kecamatan Cimanggung',
      tanggal: '15 Sep 2026',
      deskripsi: 'Contoh laporan kejadian angin puting beliung.',
      status: 'Terverifikasi',
    ),
    LaporanBencana(
      jenis: 'Kekeringan',
      lokasi: 'Kecamatan Ujungjaya',
      tanggal: '01 Sep 2026',
      deskripsi: 'Contoh laporan kondisi kekeringan.',
      status: 'Menunggu Verifikasi',
    ),
  ];

  List<LaporanBencana> get laporanTerfilter {
    final kunci = kataKunci.trim().toLowerCase();
    if (kunci.isEmpty) return dataLaporan;
    return dataLaporan.where((laporan) {
      return laporan.jenis.toLowerCase().contains(kunci) ||
          laporan.lokasi.toLowerCase().contains(kunci);
    }).toList();
  }

  // Ringkasan dashboard mengikuti daftar kejadian yang dicatat petugas.
  // Nilai berubah otomatis setelah setState() ketika form mengembalikan data.
  int get jumlahKejadianDicatat => dataKejadianManual.length;

  Future<void> _bukaFormPencatatan() async {
    debugPrint('BPBD: mencoba membuka route ${Rute.formPencatatan}');

    try {
      // MaterialApp.routes menghasilkan route bertipe Route<dynamic>.
      // Karena itu hasil named route diambil sebagai dynamic, lalu diperiksa
      // tipenya sebelum dimasukkan ke daftar kejadian.
      final dynamic hasil = await Navigator.of(context).pushNamed<dynamic>(
        Rute.formPencatatan,
      );

      if (!mounted || hasil is! KejadianBencana) return;

      setState(() {
        _daftarKejadian.insert(0, hasil);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Kejadian ${hasil.jenis} berhasil ditambahkan ke dashboard.',
          ),
        ),
      );
    } catch (error, stackTrace) {
      debugPrint('BPBD: gagal membuka form pencatatan: $error');
      debugPrintStack(stackTrace: stackTrace);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal membuka form pencatatan: $error'),
          duration: const Duration(seconds: 6),
        ),
      );
    }
  }

  Future<void> _ubahKejadian(KejadianBencana kejadianLama) async {
    final dynamic hasil = await Navigator.of(context).pushNamed<dynamic>(
      Rute.formPencatatan,
      arguments: kejadianLama,
    );

    if (!mounted || hasil is! KejadianBencana) return;

    setState(() {
      final index = _daftarKejadian.indexWhere(
        (item) => item.id == kejadianLama.id,
      );
      if (index != -1) {
        // UPDATE: objek lama diganti objek baru menggunakan id yang sama.
        _daftarKejadian[index] = hasil;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Kejadian ${hasil.jenis} berhasil diperbarui.')),
    );
  }

  Future<void> _konfirmasiHapus(KejadianBencana kejadian) async {
    final yakin = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        icon: const Icon(Icons.delete_outline),
        title: const Text('Hapus kejadian?'),
        content: Text(
          'Data "${kejadian.jenis}" di ${kejadian.lokasi} akan dihapus dari daftar.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Batal'),
          ),
          FilledButton.icon(
            onPressed: () => Navigator.pop(dialogContext, true),
            icon: const Icon(Icons.delete),
            label: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (!mounted || yakin != true) return;

    setState(() {
      // DELETE: hapus berdasarkan id, bukan index daftar.
      _daftarKejadian.removeWhere((item) => item.id == kejadian.id);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Kejadian ${kejadian.jenis} berhasil dihapus.')),
    );
  }

  Future<void> _konfirmasiLogout() async {
    final yakin = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        icon: const Icon(Icons.logout_rounded),
        title: const Text('Keluar dari akun demo?'),
        content: const Text(
          'Kamu akan kembali ke halaman login. Catatan kejadian tetap '
          'tersimpan selama aplikasi ini belum ditutup.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Batal'),
          ),
          FilledButton.icon(
            onPressed: () => Navigator.pop(dialogContext, true),
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
          ),
        ],
      ),
    );

    if (!mounted || yakin != true) return;

    // Bersihkan stack halaman agar tombol Back tidak melewati login.
    Navigator.pushNamedAndRemoveUntil(
      context,
      Rute.login,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final warna = tema.colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const JudulAplikasi(),
        actions: [
          PopupMenuButton<String>(
            tooltip: 'Menu navigasi',
            onSelected: (value) => Navigator.pushNamed(context, value),
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: Rute.daftarKejadian,
                child: Text('Daftar Kejadian Petugas'),
              ),
              PopupMenuItem(
                value: Rute.dashboardMasyarakat,
                child: Text('Dashboard Masyarakat'),
              ),
              PopupMenuItem(
                value: Rute.formLaporan,
                child: Text('Form Laporan Masyarakat'),
              ),
              PopupMenuItem(
                value: Rute.cekStatus,
                child: Text('Cek Status Laporan'),
              ),
            ],
          ),
          IconButton(
            tooltip: 'Logout',
            onPressed: _konfirmasiLogout,
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 100),
          children: [
            Text(
              'Selamat datang, Petugas',
              style: tema.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'Pantau dan verifikasi laporan bencana masyarakat.',
              style: tema.textTheme.bodyMedium?.copyWith(color: warna.onSurfaceVariant),
            ),
            const SizedBox(height: 16),
            Card(
              color: warna.primary,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Kejadian Dicatat Petugas',
                            style: TextStyle(color: warna.onPrimary),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '$jumlahKejadianDicatat',
                            style: tema.textTheme.headlineMedium?.copyWith(
                              color: warna.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Data dari form pencatatan petugas',
                            style: TextStyle(color: warna.onPrimary),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.assignment_turned_in_outlined, size: 44, color: warna.onPrimary),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) => setState(() => kataKunci = value),
              decoration: const InputDecoration(
                hintText: 'Cari jenis bencana atau lokasi',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Laporan Terbaru', style: tema.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                Text('${laporanTerfilter.length} laporan', style: tema.textTheme.bodySmall),
              ],
            ),
            const SizedBox(height: 10),
            if (laporanTerfilter.isEmpty)
              const EmptyStateLaporan()
            else
              ...laporanTerfilter.map((laporan) => KartuLaporan(
                    laporan: laporan,
                    onTap: () => Navigator.pushNamed(
                      context,
                      Rute.detailLaporan,
                      arguments: laporan,
                    ),
                  )),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kejadian Dicatat Petugas',
                  style: tema.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${dataKejadianManual.length} kejadian',
                  style: tema.textTheme.bodySmall?.copyWith(
                    color: warna.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (dataKejadianManual.isEmpty)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    children: [
                      Icon(
                        Icons.inbox_outlined,
                        color: warna.outline,
                        size: 30,
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Belum ada kejadian yang dicatat. Gunakan tombol '
                          'Catat Kejadian untuk menambahkan data.',
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dataKejadianManual.length,
                itemBuilder: (context, index) {
                  final kejadian = dataKejadianManual[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: warna.primaryContainer,
                        foregroundColor: warna.onPrimaryContainer,
                        child: const Icon(Icons.assignment_turned_in_outlined),
                      ),
                      title: Text(
                        kejadian.jenis,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${kejadian.lokasi}\n${kejadian.tanggal}'),
                          const SizedBox(height: 6),
                          Chip(
                            label: Text(kejadian.statusPenanganan),
                            visualDensity: VisualDensity.compact,
                          ),
                        ],
                      ),
                      isThreeLine: true,
                      trailing: PopupMenuButton<String>(
                        tooltip: 'Aksi data kejadian',
                        onSelected: (aksi) {
                          if (aksi == 'ubah') {
                            _ubahKejadian(kejadian);
                          } else if (aksi == 'hapus') {
                            _konfirmasiHapus(kejadian);
                          }
                        },
                        itemBuilder: (context) => const [
                          PopupMenuItem(
                            value: 'ubah',
                            child: Row(
                              children: [
                                Icon(Icons.edit_outlined),
                                SizedBox(width: 12),
                                Text('Ubah'),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 'hapus',
                            child: Row(
                              children: [
                                Icon(Icons.delete_outline),
                                SizedBox(width: 12),
                                Text('Hapus'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      onTap: () => Navigator.pushNamed(
                        context,
                        Rute.detailKejadian,
                        arguments: kejadian,
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _bukaFormPencatatan,
        backgroundColor: warna.error,
        foregroundColor: warna.onError,
        icon: const Icon(Icons.add),
        label: const Text('Catat Kejadian'),
      ),
    );
  }
}

class KartuLaporan extends StatelessWidget {
  const KartuLaporan({super.key, required this.laporan, required this.onTap});
  final LaporanBencana laporan;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final warna = tema.colorScheme;
    final Color latarStatus = laporan.status == 'Menunggu Verifikasi'
        ? warna.tertiaryContainer
        : laporan.status == 'Perlu Klarifikasi'
            ? warna.errorContainer
            : warna.primaryContainer;
    final Color teksStatus = laporan.status == 'Menunggu Verifikasi'
        ? warna.onTertiaryContainer
        : laporan.status == 'Perlu Klarifikasi'
            ? warna.onErrorContainer
            : warna.onPrimaryContainer;

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        leading: CircleAvatar(
          backgroundColor: warna.primaryContainer,
          foregroundColor: warna.onPrimaryContainer,
          child: const Icon(Icons.warning_amber_rounded),
        ),
        title: Text(laporan.jenis, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(laporan.lokasi),
              Text(laporan.tanggal, style: tema.textTheme.bodySmall),
              const SizedBox(height: 8),
              Chip(
                label: Text(laporan.status),
                backgroundColor: latarStatus,
                labelStyle: TextStyle(color: teksStatus, fontWeight: FontWeight.w600),
                side: BorderSide.none,
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

class EmptyStateLaporan extends StatelessWidget {
  const EmptyStateLaporan({super.key});
  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(28),
      child: Column(
        children: [
          Icon(Icons.inbox_outlined, size: 56, color: warna.outline),
          const SizedBox(height: 10),
          const Text('Belum ada laporan masuk', style: TextStyle(fontWeight: FontWeight.bold)),
          const Text('Laporan masyarakat akan muncul di halaman ini.'),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// DETAIL LAPORAN — membaca arguments dengan pemeriksaan tipe dan cabang null.
// -----------------------------------------------------------------------------
class DetailLaporanPage extends StatelessWidget {
  const DetailLaporanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final LaporanBencana? laporan = args is LaporanBencana ? args : null;
    final warna = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Detail dan Verifikasi Laporan')),
      body: laporan == null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.info_outline, size: 48, color: warna.outline),
                    const SizedBox(height: 12),
                    const Text('Data laporan tidak tersedia.', textAlign: TextAlign.center),
                    const SizedBox(height: 12),
                    FilledButton.tonal(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Kembali ke daftar'),
                    ),
                  ],
                ),
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(laporan.jenis, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        DetailBaris(label: 'Lokasi', value: laporan.lokasi, icon: Icons.location_on_outlined),
                        DetailBaris(label: 'Tanggal / waktu', value: laporan.tanggal, icon: Icons.calendar_today_outlined),
                        DetailBaris(label: 'Status pemeriksaan', value: laporan.status, icon: Icons.fact_check_outlined),
                        DetailBaris(label: 'Kontak pelapor', value: laporan.kontak?.isNotEmpty == true ? laporan.kontak! : 'Tidak dicantumkan', icon: Icons.phone_outlined),
                        const Divider(height: 28),
                        Text('Deskripsi laporan', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text(laporan.deskripsi),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Tampilan detail pada prototype ini bersifat read-only. Perubahan status verifikasi dan penyimpanan data akan dikembangkan pada tahap berikutnya.',
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Kembali ke Laporan Masuk'),
                ),
              ],
            ),
    );
  }
}

class DetailBaris extends StatelessWidget {
  const DetailBaris({super.key, required this.label, required this.value, required this.icon});
  final String label;
  final String value;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: Theme.of(context).textTheme.bodySmall),
                Text(value, style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// FORM PENCATATAN — F-04; validasi -> feedback SnackBar -> pop.
// -----------------------------------------------------------------------------
class FormPencatatanPage extends StatefulWidget {
  const FormPencatatanPage({super.key, this.initialData});

  final KejadianBencana? initialData;

  @override
  State<FormPencatatanPage> createState() => _FormPencatatanPageState();
}

class _FormPencatatanPageState extends State<FormPencatatanPage> {
  final _formKey = GlobalKey<FormState>();
  final _jenisController = TextEditingController();
  final _lokasiController = TextEditingController();
  final _tanggalController = TextEditingController();
  final _deskripsiController = TextEditingController();
  final _kontakController = TextEditingController();
  String _statusPenanganan = 'Pemantauan';

  @override
  void initState() {
    super.initState();
    final data = widget.initialData;
    if (data != null) {
      _jenisController.text = data.jenis;
      _lokasiController.text = data.lokasi;
      _tanggalController.text = data.tanggal;
      _deskripsiController.text = data.deskripsi;
      _kontakController.text = data.kontak ?? '';
      _statusPenanganan = data.statusPenanganan;
    }
  }

  @override
  void dispose() {
    _jenisController.dispose();
    _lokasiController.dispose();
    _tanggalController.dispose();
    _deskripsiController.dispose();
    _kontakController.dispose();
    super.dispose();
  }

  String? _wajibDiisi(String? value, String namaField) {
    if (value == null || value.trim().isEmpty) return '$namaField wajib diisi.';
    return null;
  }

  void _kirim() {
    if (!_formKey.currentState!.validate()) return;

    final dataSebelumnya = widget.initialData;
    final kejadianBaru = KejadianBencana(
      id: dataSebelumnya?.id ?? DateTime.now().microsecondsSinceEpoch.toString(),
      jenis: _jenisController.text.trim(),
      lokasi: _lokasiController.text.trim(),
      tanggal: _tanggalController.text.trim(),
      deskripsi: _deskripsiController.text.trim(),
      kontak: _kontakController.text.trim().isEmpty
          ? null
          : _kontakController.text.trim(),
      statusPenanganan: _statusPenanganan,
    );

    // Kembalikan objek ke dashboard. Dashboard membedakan Create dan Update
    // berdasarkan apakah form dibuka tanpa atau dengan data sebelumnya.
    Navigator.pop(context, kejadianBaru);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.initialData == null ? 'Form Pencatatan Kejadian' : 'Ubah Data Kejadian')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              widget.initialData == null
                  ? 'Masukkan kejadian yang diterima petugas melalui jalur selain aplikasi masyarakat.'
                  : 'Perbarui informasi kejadian dan status penanganannya.',
            ),
            const SizedBox(height: 18),
            TextFormField(
              controller: _jenisController,
              decoration: const InputDecoration(labelText: 'Jenis bencana *', prefixIcon: Icon(Icons.warning_amber_outlined)),
              validator: (value) => _wajibDiisi(value, 'Jenis bencana'),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _lokasiController,
              decoration: const InputDecoration(labelText: 'Lokasi / kecamatan *', prefixIcon: Icon(Icons.location_on_outlined)),
              validator: (value) => _wajibDiisi(value, 'Lokasi'),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _tanggalController,
              decoration: const InputDecoration(labelText: 'Tanggal dan waktu kejadian *', hintText: 'Contoh: 03 Nov 2026, 18.30 WIB', prefixIcon: Icon(Icons.calendar_today_outlined)),
              validator: (value) => _wajibDiisi(value, 'Tanggal dan waktu'),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _deskripsiController,
              minLines: 3,
              maxLines: 5,
              decoration: const InputDecoration(labelText: 'Deskripsi kejadian *', alignLabelWithHint: true),
              validator: (value) {
                final pesan = _wajibDiisi(value, 'Deskripsi');
                if (pesan != null) return pesan;
                if (value!.trim().length < 15) return 'Deskripsi minimal 15 karakter.';
                return null;
              },
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _kontakController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: 'Kontak sumber informasi (opsional)', prefixIcon: Icon(Icons.phone_outlined)),
              validator: (value) {
                if (value == null || value.trim().isEmpty) return null;
                if (value.trim().length < 8) return 'Kontak harus terdiri dari minimal 8 karakter.';
                return null;
              },
            ),
            const SizedBox(height: 14),
            DropdownButtonFormField<String>(
              value: _statusPenanganan,
              decoration: const InputDecoration(
                labelText: 'Status penanganan',
                prefixIcon: Icon(Icons.flag_outlined),
              ),
              items: const [
                DropdownMenuItem(value: 'Pemantauan', child: Text('Pemantauan')),
                DropdownMenuItem(value: 'Penanganan', child: Text('Penanganan')),
                DropdownMenuItem(value: 'Selesai', child: Text('Selesai')),
              ],
              onChanged: (value) {
                if (value != null) setState(() => _statusPenanganan = value);
              },
            ),
            const SizedBox(height: 10),
            Text('Tanda * menunjukkan kolom wajib diisi.', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 22),
            FilledButton.icon(
              onPressed: _kirim,
              icon: const Icon(Icons.send),
              label: Text(widget.initialData == null ? 'Kirim Pencatatan' : 'Simpan Perubahan'),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal dan kembali'),
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// HALAMAN LANJUTAN LAIN DARI IA TUGAS 5 — kerangka navigasi untuk route lengkap.
// -----------------------------------------------------------------------------
class DaftarKejadianPage extends StatelessWidget {
  const DaftarKejadianPage({super.key});

  @override
  Widget build(BuildContext context) {
    final kejadianTersimpan = PenyimpananSementara.kejadianManual;

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Kejadian Petugas')),
      body: kejadianTersimpan.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  'Belum ada kejadian yang dicatat oleh petugas.',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: kejadianTersimpan.length,
              itemBuilder: (context, index) {
                final kejadian = kejadianTersimpan[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    title: Text(kejadian.jenis),
                    subtitle: Text(
                      '${kejadian.lokasi}\\n${kejadian.tanggal}',
                    ),
                    isThreeLine: true,
                    trailing: Chip(
                      label: Text(kejadian.statusPenanganan),
                    ),
                    onTap: () => Navigator.pushNamed(
                      context,
                      Rute.detailKejadian,
                      arguments: kejadian,
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class DetailKejadianPage extends StatelessWidget {
  const DetailKejadianPage({super.key});
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final KejadianBencana? kejadian = args is KejadianBencana ? args : null;
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Kejadian Bencana')),
      body: kejadian == null
          ? const Center(child: Text('Data kejadian tidak tersedia.'))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(kejadian.jenis, style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 10),
                      Text('Lokasi: ${kejadian.lokasi}'),
                      Text('Tanggal: ${kejadian.tanggal}'),
                      Text('ID data: ${kejadian.id}'),
                      Text('Status penanganan: ${kejadian.statusPenanganan}'),
                      const SizedBox(height: 12),
                      Text('Deskripsi: ${kejadian.deskripsi}'),
                      if (kejadian.kontak != null && kejadian.kontak!.isNotEmpty)
                        Text('Kontak: ${kejadian.kontak}'),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class DashboardMasyarakatPage extends StatelessWidget {
  const DashboardMasyarakatPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Informasi Bencana')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Informasi Kejadian Terverifikasi', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          const Text('Contoh informasi publik. Data aktual dan penyaringan belum terhubung.'),
          const Card(child: ListTile(title: Text('Angin Puting Beliung'), subtitle: Text('Kecamatan Cimanggung • Terverifikasi'))),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () => Navigator.pushNamed(context, Rute.formLaporan),
            icon: const Icon(Icons.add_alert_outlined),
            label: const Text('Laporkan Bencana'),
          ),
          OutlinedButton.icon(
            onPressed: () => Navigator.pushNamed(context, Rute.cekStatus),
            icon: const Icon(Icons.search),
            label: const Text('Cek Status Laporan'),
          ),
        ],
      ),
    );
  }
}

class FormLaporanMasyarakatPage extends StatelessWidget {
  const FormLaporanMasyarakatPage({super.key});
  @override
  Widget build(BuildContext context) => const HalamanDalamRencana(
        judul: 'Form Laporan Bencana',
        pesan: 'Layar ini tercantum pada IA untuk kebutuhan F-01. Implementasi form masyarakat berada di luar alur interaksi utama yang didemonstrasikan pada Tugas 6.',
      );
}

class CekStatusPage extends StatelessWidget {
  const CekStatusPage({super.key});
  @override
  Widget build(BuildContext context) => const HalamanDalamRencana(
        judul: 'Cek Status Laporan',
        pesan: 'Layar ini tercantum pada IA untuk kebutuhan F-02. Pemeriksaan kode pelacakan belum terhubung ke data pada prototype ini.',
      );
}

class HalamanDalamRencana extends StatelessWidget {
  const HalamanDalamRencana({super.key, required this.judul, required this.pesan});
  final String judul;
  final String pesan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.construction_outlined, size: 52),
              const SizedBox(height: 12),
              Text(pesan, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JudulAplikasi extends StatelessWidget {
  const JudulAplikasi({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('BPBD KABUPATEN SUMEDANG', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 2),
        Text('Sistem Informasi Pendataan Bencana', style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal)),
      ],
    );
  }
}
