import 'package:flutter/material.dart';

void main() {
  runApp(const SipuskamApp());
}

class SipuskamApp extends StatelessWidget {
  const SipuskamApp({super.key});

  static const String routeHome = '/';
  static const String routeDetail = '/detail-buku';
  static const String routeAdd = '/tambah-buku';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIPUSKAM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: routeHome,
      routes: {
        routeHome: (context) => const HalamanUtama(),
        routeDetail: (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          final Map<String, String>? buku =
              arguments is Map<String, String> ? arguments : null;
          return HalamanDetailBuku(buku: buku);
        },
        routeAdd: (context) => const HalamanTambahBuku(),
      },
    );
  }
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> _daftarBuku = [
    {
      'judul': 'Pemrograman Dart',
      'penulis': 'Andi Saputra',
      'kategori': 'Pemrograman',
      'status': 'Tersedia',
    },
    {
      'judul': 'Sistem Informasi',
      'penulis': 'Budi Raharjo',
      'kategori': 'Sistem Informasi',
      'status': 'Tersedia',
    },
    {
      'judul': 'Basis Data',
      'penulis': 'Siti Aminah',
      'kategori': 'Basis Data',
      'status': 'Dipinjam',
    },
    {
      'judul': 'Rekayasa Perangkat Lunak',
      'penulis': 'Rina Permata',
      'kategori': 'Perangkat Lunak',
      'status': 'Tersedia',
    },
  ];

  String _kataKunci = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, String>> get _bukuTerfilter {
    final query = _kataKunci.trim().toLowerCase();
    if (query.isEmpty) return _daftarBuku;
    return _daftarBuku.where((buku) {
      return (buku['judul'] ?? '').toLowerCase().contains(query) ||
          (buku['penulis'] ?? '').toLowerCase().contains(query) ||
          (buku['kategori'] ?? '').toLowerCase().contains(query);
    }).toList();
  }

  Future<void> _bukaFormTambah() async {
    final hasil = await Navigator.pushNamed(
      context,
      SipuskamApp.routeAdd,
    );

    if (!mounted) return;
    if (hasil is Map<String, String>) {
      setState(() => _daftarBuku.add(hasil));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Buku berhasil ditambahkan.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bukuTersedia =
        _daftarBuku.where((buku) => buku['status'] == 'Tersedia').length;

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SIPUSKAM', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Perpustakaan Kampus', style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Datang di SIPUSKAM',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'Temukan buku yang kamu butuhkan.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    icon: Icons.menu_book,
                    value: '${_daftarBuku.length}',
                    label: 'Total Buku',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _StatCard(
                    icon: Icons.check_circle,
                    value: '$bukuTersedia',
                    label: 'Tersedia',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _searchController,
              onChanged: (value) => setState(() => _kataKunci = value),
              decoration: InputDecoration(
                hintText: 'Cari judul, penulis, atau kategori...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _kataKunci.isEmpty
                    ? null
                    : IconButton(
                        tooltip: 'Hapus pencarian',
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _kataKunci = '');
                        },
                      ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Daftar Buku',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: _bukuTerfilter.isEmpty
                  ? const Center(
                      child: Text(
                        'Buku tidak ditemukan.\nCoba kata kunci lain.',
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView.builder(
                      itemCount: _bukuTerfilter.length,
                      itemBuilder: (context, index) {
                        final buku = _bukuTerfilter[index];
                        final tersedia = buku['status'] == 'Tersedia';
                        return Card(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(12),
                            leading: Container(
                              width: 48,
                              height: 58,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(Icons.menu_book),
                            ),
                            title: Text(
                              buku['judul'] ?? 'Judul tidak tersedia',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Penulis: ${buku['penulis'] ?? '-'}'),
                                  Text('Kategori: ${buku['kategori'] ?? '-'}'),
                                  const SizedBox(height: 5),
                                  Text(
                                    buku['status'] ?? 'Status tidak diketahui',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: tersedia
                                          ? Colors.green.shade700
                                          : Theme.of(context).colorScheme.error,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                SipuskamApp.routeDetail,
                                arguments: Map<String, String>.from(buku),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _bukaFormTambah,
        icon: const Icon(Icons.add),
        label: const Text('Tambah Buku'),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(icon),
            const SizedBox(height: 4),
            Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}

class HalamanDetailBuku extends StatelessWidget {
  const HalamanDetailBuku({super.key, required this.buku});

  final Map<String, String>? buku;

  @override
  Widget build(BuildContext context) {
    if (buku == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Detail Buku')),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              'Data buku tidak tersedia atau argumen navigasi tidak valid.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    final tersedia = buku!['status'] == 'Tersedia';
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Buku')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Container(
              width: 110,
              height: 140,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.menu_book, size: 64),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            buku!['judul'] ?? 'Judul tidak tersedia',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _DetailRow(label: 'Penulis', value: buku!['penulis'] ?? '-'),
          _DetailRow(label: 'Kategori', value: buku!['kategori'] ?? '-'),
          _DetailRow(
            label: 'Status',
            value: buku!['status'] ?? 'Tidak diketahui',
            valueColor: tersedia
                ? Colors.green.shade700
                : Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            label: const Text('Kembali ke Daftar Buku'),
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(label),
        subtitle: Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class HalamanTambahBuku extends StatefulWidget {
  const HalamanTambahBuku({super.key});

  @override
  State<HalamanTambahBuku> createState() => _HalamanTambahBukuState();
}

class _HalamanTambahBukuState extends State<HalamanTambahBuku> {
  final _formKey = GlobalKey<FormState>();
  final _judulController = TextEditingController();
  final _penulisController = TextEditingController();
  final _kategoriController = TextEditingController();

  String _status = 'Tersedia';

  @override
  void dispose() {
    _judulController.dispose();
    _penulisController.dispose();
    _kategoriController.dispose();
    super.dispose();
  }

  void _simpanBuku() {
    if (!_formKey.currentState!.validate()) return;

    final bukuBaru = <String, String>{
      'judul': _judulController.text.trim(),
      'penulis': _penulisController.text.trim(),
      'kategori': _kategoriController.text.trim(),
      'status': _status,
    };

    Navigator.pop(context, bukuBaru);
  }

  String? _wajibDiisi(String? value, String namaField) {
    if (value == null || value.trim().isEmpty) {
      return '$namaField wajib diisi.';
    }
    if (value.trim().length < 2) {
      return '$namaField minimal 2 karakter.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Buku')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              'Formulir Data Buku',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text('Lengkapi semua kolom sebelum menyimpan data.'),
            const SizedBox(height: 20),
            TextFormField(
              controller: _judulController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Judul Buku',
                border: OutlineInputBorder(),
              ),
              validator: (value) => _wajibDiisi(value, 'Judul buku'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _penulisController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Nama Penulis',
                border: OutlineInputBorder(),
              ),
              validator: (value) => _wajibDiisi(value, 'Nama penulis'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _kategoriController,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                labelText: 'Kategori',
                border: OutlineInputBorder(),
              ),
              validator: (value) => _wajibDiisi(value, 'Kategori'),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _status,
              decoration: const InputDecoration(
                labelText: 'Status Ketersediaan',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Tersedia',
                  child: Text('Tersedia'),
                ),
                DropdownMenuItem(
                  value: 'Dipinjam',
                  child: Text('Dipinjam'),
                ),
              ],
              onChanged: (value) {
                if (value != null) setState(() => _status = value);
              },
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _simpanBuku,
              icon: const Icon(Icons.save),
              label: const Text('Simpan Buku'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
          ],
        ),
      ),
    );
  }
}
