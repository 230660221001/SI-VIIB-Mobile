import 'package:flutter/material.dart';

void main() {
  runApp(const LabMonitorApp());
}

// ====================================================
// 1. MODEL DATA
// ====================================================
class DataLaporan {
  const DataLaporan({
    required this.id,
    required this.kodePC,
    required this.kendala,
    required this.tanggal,
    required this.status,
  });

  final String id;
  final String kodePC;
  final String kendala;
  final String tanggal;
  final String status;

  @override
  String toString() => 'Laporan $kodePC — $status';
}

class LabMonitorApp extends StatelessWidget {
  const LabMonitorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab PC Monitor CRUD',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HalamanDaftarLaporan(),
        '/form': (context) => const FormPelaporan(),
      },
    );
  }
}

// ====================================================
// 2. STATEFUL WIDGET UNTUK DAFTAR & CRUD LOKAL
// ====================================================
class HalamanDaftarLaporan extends StatefulWidget {
  const HalamanDaftarLaporan({super.key});

  @override
  State<HalamanDaftarLaporan> createState() => _HalamanDaftarLaporanState();
}

class _HalamanDaftarLaporanState extends State<HalamanDaftarLaporan> {
  // STATE: Menyimpan data (in-memory)
  final List<DataLaporan> _daftar = [
    const DataLaporan(
      id: '1',
      kodePC: 'PC-01',
      kendala: 'Keyboard beberapa tuts mati',
      tanggal: '2026-10-31 08:30',
      status: 'Menunggu',
    )
  ];

  // CREATE (Menambah Data)
  void _tambahLaporan(DataLaporan laporanBaru) {
    setState(() {
      _daftar.add(laporanBaru);
    });
  }

  // UPDATE (Mengubah Data / Ganti Status)
  void _ubahStatus(String id, String statusBaru) {
    setState(() {
      final index = _daftar.indexWhere((l) => l.id == id);
      if (index != -1) {
        final lama = _daftar[index];
        // Mengganti objek lama dengan objek baru
        _daftar[index] = DataLaporan(
          id: lama.id,
          kodePC: lama.kodePC,
          kendala: lama.kendala,
          tanggal: lama.tanggal,
          status: statusBaru,
        );
      }
    });
  }

  // DELETE (Menghapus Data)
  void _hapus(String id) {
    setState(() {
      _daftar.removeWhere((l) => l.id == id);
    });
  }

  // KONFIRMASI DELETE DENGAN DIALOG
  Future<void> _konfirmasiHapus(DataLaporan laporan) async {
    final yakin = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Laporan?'),
        content: Text('Laporan kendala untuk ${laporan.kodePC} akan dihapus.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
    
    if (yakin == true) {
      _hapus(laporan.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Laporan PC')),
      // READ (Menampilkan Data)
      body: _daftar.isEmpty
          ? const Center(child: Text('Belum ada data laporan.'))
          : ListView.builder(
              itemCount: _daftar.length,
              itemBuilder: (context, index) {
                final laporan = _daftar[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Icon(
                      Icons.computer,
                      color: laporan.status == 'Selesai' ? Colors.green : Colors.orange,
                      size: 40,
                    ),
                    title: Text(
                      laporan.kodePC,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${laporan.tanggal}\nKendala: ${laporan.kendala}\nStatus: ${laporan.status}'),
                    isThreeLine: true,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.check_circle_outline, color: Colors.green),
                          onPressed: () => _ubahStatus(laporan.id, 'Selesai'),
                          tooltip: 'Tandai Selesai',
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_outline, color: Colors.red),
                          onPressed: () => _konfirmasiHapus(laporan),
                          tooltip: 'Hapus Laporan',
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          // Navigasi mengambil data balikan dari form
          final result = await Navigator.pushNamed(context, '/form');
          if (result != null && result is DataLaporan) {
            _tambahLaporan(result);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Laporan ${result.kodePC} berhasil ditambahkan.')),
            );
          }
        },
        icon: const Icon(Icons.add_alert),
        label: const Text('Buat Laporan'),
      ),
    );
  }
}

// ====================================================
// 3. LAYAR FORM PELAPORAN
// ====================================================
class FormPelaporan extends StatefulWidget {
  const FormPelaporan({super.key});

  @override
  State<FormPelaporan> createState() => _FormPelaporanState();
}

class _FormPelaporanState extends State<FormPelaporan> {
  final _formKey = GlobalKey<FormState>();
  final _kodeController = TextEditingController();
  final _kendalaController = TextEditingController();

  @override
  void dispose() {
    _kodeController.dispose();
    _kendalaController.dispose();
    super.dispose();
  }

  void _kirim() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    
    final sekarang = DateTime.now();
    // Membentuk objek baru yang dilempar balik ke halaman sebelumnya
    final laporanBaru = DataLaporan(
      id: sekarang.millisecondsSinceEpoch.toString(),
      kodePC: _kodeController.text.trim(),
      kendala: _kendalaController.text.trim(),
      tanggal: '${sekarang.year}-${sekarang.month.toString().padLeft(2, '0')}-${sekarang.day.toString().padLeft(2, '0')} ${sekarang.hour}:${sekarang.minute.toString().padLeft(2, '0')}',
      status: 'Menunggu',
    );
    
    // Melempar objek data ke Navigator stack
    Navigator.pop(context, laporanBaru);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Pelaporan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _kodeController,
                decoration: const InputDecoration(
                  labelText: 'Kode PC',
                  border: OutlineInputBorder()
                ),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Kode PC wajib diisi' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _kendalaController,
                decoration: const InputDecoration(
                  labelText: 'Kendala',
                  border: OutlineInputBorder()
                ),
                maxLines: 3,
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Kendala wajib diisi' : null,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: _kirim,
                child: const Text('Kirim Laporan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
