import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pengaduan Fasilitas Kampus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HalamanUtama(),
        '/form': (context) => const FormPengaduan(),
        '/detail': (context) => const DetailLaporan(),
      },
    );
  }
}

// Model Data Sederhana Laporan
class LaporanFasilitas {
  final String fasilitas;
  final String kategori;
  final String kendala;
  final String status;
  final String pelapor;

  LaporanFasilitas({
    required this.fasilitas,
    required this.kategori,
    required this.kendala,
    required this.status,
    required this.pelapor,
  });
}

// 1. HALAMAN UTAMA (Daftar Laporan)
class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  final List<LaporanFasilitas> daftarLaporan = [
    LaporanFasilitas(
      fasilitas: 'Proyektor Ruang 301',
      kategori: 'Elektronik',
      kendala: 'Lampu proyektor redup dan bergaris merah',
      status: 'Diproses',
      pelapor: 'Felix',
    ),
    LaporanFasilitas(
      fasilitas: 'AC Lab Komputer 2',
      kategori: 'Pendingin Ruangan',
      kendala: 'AC mengeluarkan suara bising dan tidak dingin',
      status: 'Menunggu',
      pelapor: 'Felix',
    ),
    LaporanFasilitas(
      fasilitas: 'Kursi Kuliah R.204',
      kategori: 'Mebel',
      kendala: 'Papan alas tulis patah dan lepas',
      status: 'Selesai',
      pelapor: 'Felix',
    ),
    LaporanFasilitas(
      fasilitas: 'Pintu Kamar Mandi Lt. 2',
      kategori: 'Sanitasi',
      kendala: 'Gagling pintu macet dari dalam',
      status: 'Menunggu',
      pelapor: 'Pak Kirill',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaduan Fasilitas Kampus'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: daftarLaporan.length,
        itemBuilder: (context, index) {
          final laporan = daftarLaporan[index];
          
          Color statusColor;
          if (laporan.status == 'Selesai') {
            statusColor = Colors.green;
          } else if (laporan.status == 'Diproses') {
            statusColor = Colors.orange;
          } else {
            statusColor = Colors.red;
          }

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(
                laporan.fasilitas,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Kategori: ${laporan.kategori} • Pelapor: ${laporan.pelapor}'),
              trailing: Chip(
                label: Text(
                  laporan.status,
                  style: const TextStyle(color: Colors.white, fontSize: 11),
                ),
                backgroundColor: statusColor,
              ),
              onTap: () {
                // Navigasi ke Halaman Detail sambil mengirim data via arguments
                Navigator.pushNamed(
                  context,
                  '/detail',
                  arguments: laporan,
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigasi ke Halaman Form Pengaduan
          Navigator.pushNamed(context, '/form');
        },
        icon: const Icon(Icons.add_comment),
        label: const Text('Buat Laporan'),
      ),
    );
  }
}

// 2. HALAMAN FORM PENGADUAN
class FormPengaduan extends StatefulWidget {
  const FormPengaduan({super.key});

  @override
  State<FormPengaduan> createState() => _FormPengaduanState();
}

class _FormPengaduanState extends State<FormPengaduan> {
  final _formKey = GlobalKey<FormState>();
  
  final TextEditingController _fasilitasController = TextEditingController();
  final TextEditingController _kategoriController = TextEditingController();
  final TextEditingController _kendalaController = TextEditingController();

  @override
  void dispose() {
    _fasilitasController.dispose();
    _kategoriController.dispose();
    _kendalaController.dispose();
    super.dispose();
  }

  void _kirimLaporan() {
    if (_formKey.currentState!.validate()) {
      final fasilitas = _fasilitasController.text.trim();
      
      // Feedback SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Laporan "$fasilitas" berhasil dikirim (simulasi).'),
          backgroundColor: Colors.indigo,
        ),
      );

      // Kembali ke Halaman Utama
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pengaduan Baru'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _fasilitasController,
                decoration: const InputDecoration(
                  labelText: 'Nama Fasilitas',
                  hintText: 'Contoh: Proyektor R.301',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama fasilitas wajib diisi.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _kategoriController,
                decoration: const InputDecoration(
                  labelText: 'Kategori',
                  hintText: 'Contoh: Elektronik / Mebel / Sanitasi',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Kategori wajib diisi.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _kendalaController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Detail Kendala Kerusakan',
                  hintText: 'Jelaskan kondisi kerusakan fasilitas...',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Detail kendala wajib diisi.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: _kirimLaporan,
                icon: const Icon(Icons.send),
                label: const Text('Kirim Laporan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 3. HALAMAN DETAIL LAPORAN (Read-Only)
class DetailLaporan extends StatelessWidget {
  const DetailLaporan({super.key});

  @override
  Widget build(BuildContext context) {
    // Membaca arguments dengan pemeriksaan tipe
    final args = ModalRoute.of(context)?.settings.arguments;
    final laporan = args is LaporanFasilitas ? args : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Laporan'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: laporan == null
          ? const Center(child: Text('Data laporan tidak ditemukan.'))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              laporan.fasilitas,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Chip(
                            label: Text(
                              laporan.status,
                              style: const TextStyle(color: Colors.white),
                            ),
                            backgroundColor: laporan.status == 'Selesai'
                                ? Colors.green
                                : (laporan.status == 'Diproses'
                                    ? Colors.orange
                                    : Colors.red),
                          ),
                        ],
                      ),
                      const Divider(height: 24),
                      Text('Kategori: ${laporan.kategori}'),
                      const SizedBox(height: 8),
                      Text('Pelapor: ${laporan.pelapor}'),
                      const SizedBox(height: 16),
                      const Text(
                        'Deskripsi Kendala:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(laporan.kendala),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back),
                          label: const Text('Kembali ke Daftar'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}