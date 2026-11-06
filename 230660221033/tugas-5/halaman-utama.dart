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
          secondary: const Color(0xFF0EA5E9),
          surface: const Color(0xFFF8FAFC),
        ),
        scaffoldBackgroundColor: const Color(0xFFF1F5F9),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color(0xFF4F46E5),
          foregroundColor: Colors.white,
        ),
      ),
      home: const HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  String _kategoriTerpilih = 'Semua';
  String _kataKunci = '';

  final _semuaBuku = [
    {
      'judul': 'Laskar Pelangi',
      'penulis': 'Andrea Hirata',
      'kategori': 'Fiksi',
      'stok': 3,
      'lokasi': 'Rak A-1'
    },
    {
      'judul': 'Bumi Manusia',
      'penulis': 'Pramoedya Ananta Toer',
      'kategori': 'Sejarah',
      'stok': 0,
      'lokasi': 'Rak B-2'
    },
    {
      'judul': 'Filosofi Teras',
      'penulis': 'Henry Manampiring',
      'kategori': 'Self-Improvement',
      'stok': 5,
      'lokasi': 'Rak C-1'
    },
    {
      'judul': 'Laut Bercerita',
      'penulis': 'Leila S. Chudori',
      'kategori': 'Fiksi',
      'stok': 2,
      'lokasi': 'Rak A-3'
    },
    {
      'judul': 'Atomic Habits',
      'penulis': 'James Clear',
      'kategori': 'Self-Improvement',
      'stok': 0,
      'lokasi': 'Rak C-3'
    },
  ];

  get _bukuTersaring {
    return _semuaBuku.where((buku) {
      final cocokKategori = _kategoriTerpilih == 'Semua' ||
          buku['kategori'] == _kategoriTerpilih;
      final cocokKataKunci = buku['judul']
              .toString()
              .toLowerCase()
              .contains(_kataKunci.toLowerCase()) ||
          buku['penulis']
              .toString()
              .toLowerCase()
              .contains(_kataKunci.toLowerCase());
      return cocokKategori && cocokKataKunci;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final bukuTampil = _bukuTersaring;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.menu_book, color: Colors.white, size: 22),
            ),
            const SizedBox(width: 12),
            const Text(
              'CeriaReads',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
            tooltip: 'Notifikasi',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4F46E5), Color(0xFF6366F1)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Halo, Pahlawan Literasi! 👋',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Pantau dan cari koleksi buku Panti Baca Ceria dengan mudah.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatItem('120+', 'Total Koleksi'),
                      Container(height: 24, width: 1, color: Colors.white30),
                      _buildStatItem('14', 'Sedang Dipinjam'),
                      Container(height: 24, width: 1, color: Colors.white30),
                      _buildStatItem('8', 'Relawan Aktif'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              children: [
                TextField(
                  onChanged: (val) => setState(() => _kataKunci = val),
                  decoration: InputDecoration(
                    hintText: 'Cari judul buku atau penulis...',
                    hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
                    prefixIcon: const Icon(Icons.search, color: Color(0xFF4F46E5)),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: Color(0xFF4F46E5), width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: ['Semua', 'Fiksi', 'Sejarah', 'Self-Improvement']
                        .map((kat) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: FilterChip(
                                label: Text(kat),
                                selected: _kategoriTerpilih == kat,
                                selectedColor: const Color(0xFFEEF2FF),
                                checkmarkColor: const Color(0xFF4F46E5),
                                labelStyle: TextStyle(
                                  color: _kategoriTerpilih == kat
                                      ? const Color(0xFF4F46E5)
                                      : const Color(0xFF334155),
                                  fontWeight: _kategoriTerpilih == kat
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: 13,
                                ),
                                backgroundColor: Colors.white,
                                side: BorderSide(
                                  color: _kategoriTerpilih == kat
                                      ? const Color(0xFF4F46E5)
                                      : const Color(0xFFE2E8F0),
                                ),
                                onSelected: (sel) {
                                  setState(() {
                                    _kategoriTerpilih = kat;
                                  });
                                },
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: bukuTampil.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: Color(0xFFEEF2FF),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.auto_stories,
                              size: 48,
                              color: Color(0xFF4F46E5),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Koleksi Tidak Ditemukan',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Tidak ada buku yang sesuai dengan pencarian "$_kataKunci".',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF64748B),
                            ),
                          ),
                          const SizedBox(height: 16),
                          OutlinedButton.icon(
                            onPressed: () {
                              setState(() {
                                _kataKunci = '';
                                _kategoriTerpilih = 'Semua';
                              });
                            },
                            icon: const Icon(Icons.refresh, size: 18),
                            label: const Text('Reset Pencarian'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF4F46E5),
                              side: const BorderSide(color: Color(0xFF4F46E5)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 80),
                    itemCount: bukuTampil.length,
                    itemBuilder: (context, index) {
                      final buku = bukuTampil[index];
                      final isTersedia = (buku['stok'] as int) > 0;

                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                            children: [
                              Container(
                                width: 48,
                                height: 64,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: isTersedia
                                        ? [const Color(0xFF818CF8), const Color(0xFF4F46E5)]
                                        : [const Color(0xFFCBD5E1), const Color(0xFF94A3B8)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.book,
                                    color: Colors.white,
                                    size: 26,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      buku['judul'] as String,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0F172A),
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      'Penulis: ${buku['penulis']}',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF475569),
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF1F5F9),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            buku['kategori'] as String,
                                            style: const TextStyle(
                                              fontSize: 11,
                                              color: Color(0xFF334155),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          buku['lokasi'] as String,
                                          style: const TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFF64748B),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: isTersedia
                                      ? const Color(0xFFDCFCE7)
                                      : const Color(0xFFFEE2E2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  isTersedia ? 'Stok ${buku['stok']}' : 'Habis',
                                  style: TextStyle(
                                    color: isTersedia
                                        ? const Color(0xFF15803D)
                                        : const Color(0xFFB91C1C),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xFF4F46E5),
        foregroundColor: Colors.white,
        elevation: 3,
        icon: const Icon(Icons.bookmark_add),
        label: const Text(
          'Pinjam Buku',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}