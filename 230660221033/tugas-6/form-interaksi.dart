import 'package:flutter/material.dart';

void main() {
  runApp(const CeriaReadsApp());
}

class CeriaReadsApp extends StatelessWidget {
  const CeriaReadsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CeriaReads',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4F46E5),
          primary: const Color(0xFF4F46E5),
          surface: const Color(0xFFF8FAFC),
        ),
        scaffoldBackgroundColor: const Color(0xFFF1F5F9),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color(0xFF4F46E5),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HalamanUtama(),
        '/detail': (context) => const HalamanDetail(),
        '/form': (context) => const HalamanForm(),
      },
    );
  }
}

// ==========================================
// 1. HALAMAN UTAMA (KATALOG)
// ==========================================
class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});
  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  // Ditulis tanpa kurung siku tipe data agar aman dari pemotongan sistem
  final _semuaBuku = [
    {'judul': 'Laskar Pelangi', 'penulis': 'Andrea Hirata', 'kategori': 'Fiksi', 'stok': 3, 'lokasi': 'Rak A-1'},
    {'judul': 'Bumi Manusia', 'penulis': 'Pramoedya Ananta Toer', 'kategori': 'Sejarah', 'stok': 0, 'lokasi': 'Rak B-2'},
    {'judul': 'Filosofi Teras', 'penulis': 'Henry Manampiring', 'kategori': 'Self-Improvement', 'stok': 5, 'lokasi': 'Rak C-1'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Katalog CeriaReads')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _semuaBuku.length,
        itemBuilder: (context, index) {
          final buku = _semuaBuku[index];
          final isTersedia = (buku['stok'] as int) > 0;

          return Card(
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                Navigator.pushNamed(context, '/detail', arguments: buku);
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 64,
                      decoration: BoxDecoration(
                        color: isTersedia ? const Color(0xFF4F46E5) : Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.book, color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(buku['judul'].toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('Penulis: ${buku['penulis']}', style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ==========================================
// 2. HALAMAN DETAIL (READ-ONLY)
// ==========================================
class HalamanDetail extends StatelessWidget {
  const HalamanDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    // Pengecekan tipe data tanpa kurung siku agar aman
    final buku = args is Map ? args : null;

    if (buku == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Data buku tidak tersedia.')),
      );
    }

    final isTersedia = (buku['stok'] as int) > 0;

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Buku')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(buku['judul'].toString(), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Penulis: ${buku['penulis']}', style: const TextStyle(fontSize: 16)),
            Text('Kategori: ${buku['kategori']} | Lokasi: ${buku['lokasi']}'),
            const SizedBox(height: 16),
            Chip(
              label: Text(isTersedia ? 'Stok Tersedia (${buku['stok']})' : 'Stok Habis'),
              backgroundColor: isTersedia ? const Color(0xFFDCFCE7) : const Color(0xFFFEE2E2),
              labelStyle: TextStyle(color: isTersedia ? const Color(0xFF15803D) : const Color(0xFFB91C1C), fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: isTersedia 
        ? FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushNamed(context, '/form', arguments: buku);
            },
            icon: const Icon(Icons.edit_document),
            label: const Text('Ajukan Peminjaman'),
          )
        : null,
    );
  }
}

// ==========================================
// 3. HALAMAN FORM PENGAJUAN
// ==========================================
class HalamanForm extends StatefulWidget {
  const HalamanForm({super.key});
  @override
  State<HalamanForm> createState() => _HalamanFormState();
}

class _HalamanFormState extends State<HalamanForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _durasiController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _durasiController.dispose();
    super.dispose();
  }

  void _kirim(String judulBuku) {
    if (!_formKey.currentState!.validate()) {
      return; 
    }
    
    final nama = _namaController.text.trim();
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Pengajuan "$judulBuku" untuk $nama terkirim (simulasi).'),
        backgroundColor: Colors.green.shade700,
        behavior: SnackBarBehavior.floating,
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final buku = args is Map ? args : null;

    if (buku == null) {
      return Scaffold(appBar: AppBar(), body: const Center(child: Text('Error data form.')));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Form Peminjaman')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            Text('Buku pilihan: ${buku['judul']}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Lengkap Peminjam',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Nama peminjam wajib diisi.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _durasiController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Durasi Pinjam (Hari)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.timer),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Durasi peminjaman wajib diisi.';
                }
                final durasi = int.tryParse(value.trim());
                if (durasi == null || durasi < 1 || durasi > 7) {
                  return 'Masukkan angka yang valid (Maks 7 hari).';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => _kirim(buku['judul'].toString()),
              icon: const Icon(Icons.send),
              label: const Text('Kirim Pengajuan'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}