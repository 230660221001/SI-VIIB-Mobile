import 'package:flutter/material.dart';

void main() {
  runApp(const CeriaReadsApp());
}

class CeriaReadsApp extends StatelessWidget {
  const CeriaReadsApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. MaterialApp dengan title sesuai domain 
    return MaterialApp(
      title: 'CeriaReads',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const KatalogBukuPage(),
    );
  }
}

class KatalogBukuPage extends StatelessWidget {
  const KatalogBukuPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Data statis minimal 4 entri relevan dengan domain buku
    final daftarBuku = [
      {'judul': 'Laskar Pelangi', 'penulis': 'Andrea Hirata', 'kategori': 'Fiksi', 'stok': 3},
      {'judul': 'Bumi Manusia', 'penulis': 'Pramoedya Ananta Toer', 'kategori': 'Sejarah', 'stok': 0},
      {'judul': 'Filosofi Teras', 'penulis': 'Henry Manampiring', 'kategori': 'Self-Improvement', 'stok': 5},
      {'judul': 'Laut Bercerita', 'penulis': 'Leila S. Chudori', 'kategori': 'Fiksi', 'stok': 2},
      {'judul': 'Atomic Habits', 'penulis': 'James Clear', 'kategori': 'Self-Improvement', 'stok': 0},
    ];

    // 3. Scaffold dengan AppBar dan Body
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog CeriaReads'),
        backgroundColor: Colors.blueAccent,
      ),
      // Layout 1: Column untuk menyusun elemen secara vertikal
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Layout 2: Padding untuk memberikan spasi pada teks sapaan
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Halo Pahlawan Literasi! Berikut koleksi buku kita hari ini:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          // Membungkus ListView dengan Expanded untuk mencegah RenderFlex overflow
          Expanded(
            // Layout 3: ListView.builder untuk daftar panjang yang bisa digulir
            child: ListView.builder(
              itemCount: daftarBuku.length,
              itemBuilder: (context, index) {
                final buku = daftarBuku[index];
                final isTersedia = (buku['stok'] as int) > 0;

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  // Layout 4: Row untuk menyusun ikon dan teks secara horizontal
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.menu_book, color: Colors.blueGrey, size: 40),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  buku['judul'] as String,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Text(buku['penulis'] as String),
                                Text(
                                  'Kategori: ${buku['kategori']}',
                                  style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Teks status menggunakan ternary operator agar warnanya dinamis
                        Text(
                          isTersedia ? 'Tersedia (${buku['stok']})' : 'Habis',
                          style: TextStyle(
                            color: isTersedia ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.bookmark_add),
      ),
    );
  }
}