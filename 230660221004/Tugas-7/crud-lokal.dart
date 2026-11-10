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
      home: const DaftarPengajuanIzinPage(),
    );
  }
}

/// Model data — field final, konstruktor required, toString (Bagian 4).
class PengajuanIzin {
  final String id;
  final String jenis;
  final String tanggal;
  final String alasan;
  final String status;

  const PengajuanIzin({
    required this.id,
    required this.jenis,
    required this.tanggal,
    required this.alasan,
    this.status = 'Menunggu',
  });

  // Memudahkan Update: salin objek dengan field yang diubah saja.
  PengajuanIzin salin({String? jenis, String? tanggal, String? alasan, String? status}) {
    return PengajuanIzin(
      id: id,
      jenis: jenis ?? this.jenis,
      tanggal: tanggal ?? this.tanggal,
      alasan: alasan ?? this.alasan,
      status: status ?? this.status,
    );
  }

  @override
  String toString() =>
      'PengajuanIzin(id: $id, jenis: $jenis, tanggal: $tanggal, alasan: $alasan, status: $status)';
}

/// Layar daftar — StatefulWidget, data disimpan pada State (Bagian 5.1).
class DaftarPengajuanIzinPage extends StatefulWidget {
  const DaftarPengajuanIzinPage({super.key});

  @override
  State<DaftarPengajuanIzinPage> createState() => _DaftarPengajuanIzinPageState();
}

class _DaftarPengajuanIzinPageState extends State<DaftarPengajuanIzinPage> {
  // Data awal — membuktikan Read sejak layar pertama kali dibuka.
  final List<PengajuanIzin> _daftarIzin = [
    const PengajuanIzin(
      id: '1', jenis: 'Sakit', tanggal: '6 November 2026',
      alasan: 'Demam tinggi, perlu istirahat di rumah.', status: 'Disetujui',
    ),
    const PengajuanIzin(
      id: '2', jenis: 'Cuti', tanggal: '12 November 2026',
      alasan: 'Acara keluarga di luar kota.', status: 'Menunggu',
    ),
  ];

  // CREATE — tambah pengajuan baru dari form, lalu setState (Bagian 6.1).
  void _tambahPengajuan(String jenis, String tanggal, String alasan) {
    setState(() {
      _daftarIzin.add(PengajuanIzin(
        id: DateTime.now().millisecondsSinceEpoch.toString(), // id unik (Bagian 6.5)
        jenis: jenis,
        tanggal: tanggal,
        alasan: alasan,
      ));
    });
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(const SnackBar(content: Text('Pengajuan izin ditambahkan.')));
  }

  // UPDATE — ganti objek pada index yang ditemukan lewat id (Bagian 6.3).
  void _ubahPengajuan(String id, String jenis, String tanggal, String alasan) {
    setState(() {
      final index = _daftarIzin.indexWhere((p) => p.id == id);
      if (index != -1) {
        _daftarIzin[index] = _daftarIzin[index].salin(
          jenis: jenis,
          tanggal: tanggal,
          alasan: alasan,
        );
      }
    });
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(const SnackBar(content: Text('Pengajuan izin diperbarui.')));
  }

  // DELETE — hapus berdasarkan id, dipanggil setelah konfirmasi (Bagian 6.4).
  void _hapusPengajuan(String id) {
    setState(() {
      _daftarIzin.removeWhere((p) => p.id == id);
    });
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(const SnackBar(content: Text('Pengajuan izin dibatalkan.')));
  }

  void _bukaFormTambah() {
    showDialog(
      context: context,
      builder: (context) => _FormPengajuanDialog(
        onSimpan: (jenis, tanggal, alasan) => _tambahPengajuan(jenis, tanggal, alasan),
      ),
    );
  }

  void _bukaFormUbah(PengajuanIzin item) {
    showDialog(
      context: context,
      builder: (context) => _FormPengajuanDialog(
        awal: item,
        onSimpan: (jenis, tanggal, alasan) => _ubahPengajuan(item.id, jenis, tanggal, alasan),
      ),
    );
  }

  // Konfirmasi sebelum menghapus (Bagian 6.4).
  void _konfirmasiHapus(PengajuanIzin item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Batalkan pengajuan?'),
        content: Text('Pengajuan izin "${item.jenis}" tanggal ${item.tanggal} akan dihapus dan tidak dapat dikembalikan.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red.shade600),
            onPressed: () {
              Navigator.pop(context);
              _hapusPengajuan(item.id);
            },
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengajuan Izin')),
      // READ — ListView.builder membaca data dari State (Bagian 6.2).
      body: _daftarIzin.isEmpty
          ? const Center(child: Text('Belum ada pengajuan izin.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _daftarIzin.length,
              itemBuilder: (context, index) {
                final item = _daftarIzin[index];
                final warnaStatus = item.status == 'Disetujui'
                    ? const Color(0xFF0B9A83)
                    : item.status == 'Ditolak'
                        ? const Color(0xFFD9534F)
                        : const Color(0xFFE49A36);
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFEBF0F1)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.jenis, style: const TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 14, color: PresentGoApp.ink,
                            )),
                            const SizedBox(height: 3),
                            Text(item.tanggal, style: const TextStyle(
                              fontSize: 12, color: Color(0xFF89969D),
                            )),
                            const SizedBox(height: 6),
                            Text(item.alasan, style: const TextStyle(fontSize: 12, color: Color(0xFF53636D))),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: warnaStatus.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(item.status, style: TextStyle(
                                color: warnaStatus, fontSize: 11, fontWeight: FontWeight.w700,
                              )),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            tooltip: 'Ubah',
                            onPressed: () => _bukaFormUbah(item),
                            icon: const Icon(Icons.edit_outlined, size: 20, color: PresentGoApp.teal),
                          ),
                          IconButton(
                            tooltip: 'Hapus',
                            onPressed: () => _konfirmasiHapus(item),
                            icon: Icon(Icons.delete_outline, size: 20, color: Colors.red.shade400),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _bukaFormTambah,
        backgroundColor: PresentGoApp.teal,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Ajukan Izin', style: TextStyle(fontWeight: FontWeight.w700)),
      ),
    );
  }
}

/// Dialog form — dipakai untuk Create (awal == null) dan Update (awal terisi).
class _FormPengajuanDialog extends StatefulWidget {
  final PengajuanIzin? awal;
  final void Function(String jenis, String tanggal, String alasan) onSimpan;

  const _FormPengajuanDialog({this.awal, required this.onSimpan});

  @override
  State<_FormPengajuanDialog> createState() => _FormPengajuanDialogState();
}

class _FormPengajuanDialogState extends State<_FormPengajuanDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _jenisController;
  late final TextEditingController _tanggalController;
  late final TextEditingController _alasanController;

  @override
  void initState() {
    super.initState();
    _jenisController = TextEditingController(text: widget.awal?.jenis ?? '');
    _tanggalController = TextEditingController(text: widget.awal?.tanggal ?? '');
    _alasanController = TextEditingController(text: widget.awal?.alasan ?? '');
  }

  @override
  void dispose() {
    _jenisController.dispose();
    _tanggalController.dispose();
    _alasanController.dispose();
    super.dispose();
  }

  void _simpan() {
    if (!_formKey.currentState!.validate()) return;
    widget.onSimpan(
      _jenisController.text.trim(),
      _tanggalController.text.trim(),
      _alasanController.text.trim(),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final sedangUbah = widget.awal != null;
    return AlertDialog(
      title: Text(sedangUbah ? 'Ubah Pengajuan Izin' : 'Ajukan Izin Baru'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _jenisController,
                decoration: const InputDecoration(labelText: 'Jenis izin'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Wajib diisi.' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _tanggalController,
                decoration: const InputDecoration(labelText: 'Tanggal'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Wajib diisi.' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _alasanController,
                decoration: const InputDecoration(labelText: 'Alasan'),
                maxLines: 2,
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Wajib diisi.' : null,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Batal')),
        FilledButton(onPressed: _simpan, child: Text(sedangUbah ? 'Simpan' : 'Tambah')),
      ],
    );
  }
}
