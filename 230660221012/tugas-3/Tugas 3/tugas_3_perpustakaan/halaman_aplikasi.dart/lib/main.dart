import 'package:flutter/material.dart';

void main() {
  runApp(const TokoBukuApp());
}

class TokoBukuApp extends StatelessWidget {
  const TokoBukuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduBook Store',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const DashboardBukuPage(),
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
    );
  }
}

class DashboardBukuPage extends StatelessWidget {
  const DashboardBukuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Data statis menampilkan minimal 4 entri sesuai ketentuan
    final List<Map<String, String>> daftarBuku = [
      {
        'judul': 'Belajar Flutter dari Nol',
        'kategori': 'Teknologi',
        'harga': 'Rp 85.000',
      },
      {
        'judul': 'Pemrograman Dart Modern',
        'kategori': 'Teknologi',
        'harga': 'Rp 90.000',
      },
      {
        'judul': 'Desain UI/UX dengan Figma',
        'kategori': 'Desain',
        'harga': 'Rp 75.000',
      },
      {
        'judul': 'Manajemen Basis Data SQL',
        'kategori': 'Sistem Informasi',
        'harga': 'Rp 95.000',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('EduBook Store - Katalog Buku'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0), // Layout 1: Padding & ListView
        itemCount: daftarBuku.length,
        itemBuilder: (context, index) {
          final buku = daftarBuku[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                // Layout 2: Row (Membagi Kiri dan Kanan)
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sisi Kiri: Gambar Cover Buku Tiruan menggunakan Stack
                  Stack(
                    // Layout 3: Stack (Menumpuk Lencana di atas Kontainer)
                    children: [
                      Container(
                        width: 70,
                        height: 90,
                        color: Colors.indigo.shade100,
                        child: const Icon(
                          Icons.book,
                          size: 40,
                          color: Colors.indigo,
                        ),
                      ),
                      Positioned(
                        top: 4,
                        left: 4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          color: Colors.orange,
                          child: const Text(
                            'BARU',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  // Sisi Kanan: Informasi Detail Buku menggunakan Column
                  Expanded(
                    child: Column(
                      // Layout 4: Column (Menyusun teks ke bawah)
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          buku['judul']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Kategori: ${buku['kategori']}',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          buku['harga']!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
