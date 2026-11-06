import 'package:flutter/material.dart';

void main() {
  runApp(const LabMonitorApp());
}

// Model data sederhana
class DataPC {
  final String id;
  final String spek;
  final String status;
  DataPC(this.id, this.spek, this.status);
}

class LabMonitorApp extends StatelessWidget {
  const LabMonitorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab PC Monitor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      // Peta Route Terpusat
      initialRoute: '/',
      routes: {
        '/': (context) => const HalamanUtama(),
        '/detail': (context) => const DetailPC(),
        '/form': (context) => const FormPelaporan(),
      },
    );
  }
}

// ----------------------------------------------------
// LAYAR 1: Halaman Utama (Daftar PC)
// ----------------------------------------------------
class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DataPC> daftarPC = [
      DataPC('PC-01', 'Core i7, 16GB RAM', 'Online'),
      DataPC('PC-02', 'Core i7, 16GB RAM', 'Offline'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Lab PC Monitor')),
      body: ListView.builder(
        itemCount: daftarPC.length,
        itemBuilder: (context, index) {
          final pc = daftarPC[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.computer),
              title: Text(pc.id),
              subtitle: Text(pc.status),
              // Navigasi mengirim arguments
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/detail',
                  arguments: pc,
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/form');
        },
        icon: const Icon(Icons.add_alert),
        label: const Text('Lapor Kendala'),
      ),
    );
  }
}

// ----------------------------------------------------
// LAYAR 2: Detail PC (Read-only)
// ----------------------------------------------------
class DetailPC extends StatelessWidget {
  const DetailPC({super.key});

  @override
  Widget build(BuildContext context) {
    // Membaca arguments dan validasi tipe
    final args = ModalRoute.of(context)?.settings.arguments;
    final pc = args is DataPC ? args : null;

    return Scaffold(
      appBar: AppBar(title: const Text('Detail PC')),
      body: pc == null
          ? const Center(child: Text('Data PC tidak ditemukan.'))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID Perangkat: ${pc.id}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text('Spesifikasi: ${pc.spek}', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 12),
                  Text('Status Saat Ini: ${pc.status}', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Kembali'),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

// ----------------------------------------------------
// LAYAR 3: Form Pelaporan
// ----------------------------------------------------
class FormPelaporan extends StatefulWidget {
  const FormPelaporan({super.key});

  @override
  State<FormPelaporan> createState() => _FormPelaporanState();
}

class _FormPelaporanState extends State<FormPelaporan> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _kendalaController = TextEditingController();

  @override
  void dispose() {
    // Mencegah kebocoran memori
    _idController.dispose();
    _kendalaController.dispose();
    super.dispose();
  }

  void _kirimLaporan() {
    // 1. Validasi
    if (!_formKey.currentState!.validate()) {
      return;
    }
    
    // 2. Feedback Interaksi
    final idPC = _idController.text.trim();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Laporan kendala untuk "$idPC" berhasil dikirim (simulasi).')),
    );
    
    // 3. Kembali ke layar sebelumnya
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lapor Kendala')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _idController,
                decoration: const InputDecoration(
                  labelText: 'ID PC (contoh: PC-01)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'ID PC wajib diisi.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _kendalaController,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi Kendala',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Deskripsi kendala wajib diisi.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: _kirimLaporan,
                child: const Text('Kirim Laporan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
