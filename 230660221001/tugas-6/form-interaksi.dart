import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistem Penjualan Beras BSM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      // Peta route bernama — satu sumber kebenaran
      initialRoute: '/',
      routes: {
        '/': (context) => const HalamanKatalogBeras(),
        '/detail': (context) => const DetailBeras(),
        '/form': (context) => const FormPesanan(),
      },
    );
  }
}

// ============================================================================
// Model data — struktur sederhana; model formal menjadi materi Pertemuan 7.
// ============================================================================
class DataBeras {
  const DataBeras({
    required this.nama,
    required this.kualitas,
    required this.harga,
    required this.status,
  });

  final String nama;
  final String kualitas;
  final String harga;
  final String status;
}

const List<DataBeras> daftarBeras = [
  DataBeras(nama: 'Beras Pandan Wangi', kualitas: 'Premium', harga: '15000', status: 'tersedia'),
  DataBeras(nama: 'Beras Ramos Premium', kualitas: 'Premium', harga: '14000', status: 'tersedia'),
  DataBeras(nama: 'Beras Rojo Lele', kualitas: 'Medium', harga: '13000', status: 'habis'),
  DataBeras(nama: 'Beras IR64', kualitas: 'Medium', harga: '12000', status: 'tersedia'),
  DataBeras(nama: 'Beras Dedak Halus', kualitas: 'Ekonomis', harga: '8000', status: 'tersedia'),
];

// ============================================================================
// Layar 1 — Katalog Beras (initialRoute: '/')
// ============================================================================
class HalamanKatalogBeras extends StatelessWidget {
  const HalamanKatalogBeras({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Produk Beras BSM'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const RingkasanKatalog(),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              itemCount: daftarBeras.length,
              itemBuilder: (context, index) {
                return KartuBeras(beras: daftarBeras[index]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigasi maju ke form pesanan
          Navigator.pushNamed(context, '/form');
        },
        icon: const Icon(Icons.shopping_cart_outlined),
        label: const Text('Pesan Sekarang'),
      ),
    );
  }
}

class RingkasanKatalog extends StatelessWidget {
  const RingkasanKatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Selamat Datang di Pabrik BSM', style: textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(
              'Pilih beras berkualitas untuk kebutuhan keluarga Anda.',
              style: textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class KartuBeras extends StatelessWidget {
  const KartuBeras({super.key, required this.beras});

  final DataBeras beras;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: const Icon(Icons.rice_bowl_outlined),
        title: Text(beras.nama, style: textTheme.titleMedium),
        subtitle: Text(
          '${beras.kualitas} • Rp ${beras.harga}/kg',
          style: textTheme.bodySmall,
        ),
        trailing: ChipStatus(status: beras.status),
        // Feedback sentuhan mengikuti tema
        splashColor: colorScheme.primaryContainer,
        // Navigasi dengan data — arguments: DataBeras
        onTap: () {
          Navigator.pushNamed(context, '/detail', arguments: beras);
        },
      ),
    );
  }
}

class ChipStatus extends StatelessWidget {
  const ChipStatus({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final tersedia = status == 'tersedia';
    return Chip(
      label: Text(tersedia ? 'Tersedia' : 'Habis'),
      backgroundColor: tersedia
          ? colorScheme.tertiaryContainer
          : colorScheme.errorContainer,
      labelStyle: TextStyle(
        color: tersedia
            ? colorScheme.onTertiaryContainer
            : colorScheme.onErrorContainer,
        fontWeight: FontWeight.w600,
      ),
      visualDensity: VisualDensity.compact,
    );
  }
}

// ============================================================================
// Layar 2 — Detail Beras (/detail) — read-only, menerima arguments
// ============================================================================
class DetailBeras extends StatelessWidget {
  const DetailBeras({super.key});

  @override
  Widget build(BuildContext context) {
    // Baca arguments dengan pemeriksaan tipe
    final args = ModalRoute.of(context)?.settings.arguments;
    final beras = args is DataBeras ? args : null;

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Beras')),
      body: beras == null
          ? const Center(child: Text('Data beras tidak tersedia.'))
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.rice_bowl_outlined),
                    title: Text(beras.nama),
                    subtitle: Text('Kualitas: ${beras.kualitas}'),
                    trailing: ChipStatus(status: beras.status),
                  ),
                ),
                const SizedBox(height: 12),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Harga',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Rp ${beras.harga}/kg',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton.tonalIcon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Kembali ke Katalog'),
                ),
              ],
            ),
    );
  }
}

// ============================================================================
// Layar 3 — Form Pesanan (/form) — StatefulWidget dengan validasi
// ============================================================================
class FormPesanan extends StatefulWidget {
  const FormPesanan({super.key});

  @override
  State<FormPesanan> createState() => _FormPesananState();
}

class _FormPesananState extends State<FormPesanan> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _jumlahController = TextEditingController();
  final _alamatController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _jumlahController.dispose();
    _alamatController.dispose();
    super.dispose();
  }

  void _kirim(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final nama = _namaController.text.trim();
    final jumlah = _jumlahController.text.trim();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Pesanan atas nama "$nama" ($jumlah kg) dicatat (simulasi).'),
        behavior: SnackBarBehavior.floating,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Pesanan Beras')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Pemesan',
                hintText: 'cth. Rani',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_outline),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Nama pemesan wajib diisi.';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _jumlahController,
              decoration: const InputDecoration(
                labelText: 'Jumlah (kg)',
                hintText: 'cth. 25',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.scale_outlined),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Jumlah wajib diisi.';
                }
                final angka = int.tryParse(value.trim());
                if (angka == null || angka <= 0) {
                  return 'Jumlah harus berupa angka positif.';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _alamatController,
              decoration: const InputDecoration(
                labelText: 'Alamat Pengiriman',
                hintText: 'cth. Jl. Raya Sumedang No. 12',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_on_outlined),
              ),
              maxLines: 3,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Alamat wajib diisi.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () => _kirim(context),
              icon: const Icon(Icons.send_outlined),
              label: const Text('Kirim Pesanan'),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Batal & Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}