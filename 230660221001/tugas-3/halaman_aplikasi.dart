// ============================================================================
// Tugas 3 — Halaman Aplikasi Sederhana
// Mata Kuliah: Pemrograman Aplikasi Bergerak
// Domain: Sistem Penjualan Beras di Pabrik BSM
// ============================================================================
// Halaman ini menampilkan katalog produk beras yang tersedia di Pabrik BSM.
// Menggunakan layout Column, Row, dan ListView.builder.
//
// Cara menjalankan:
//   flutter run -d chrome
// ============================================================================

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
      home: const KatalogBerasHalaman(),
    );
  }
}

class KatalogBerasHalaman extends StatelessWidget {
  const KatalogBerasHalaman({super.key});

  @override
  Widget build(BuildContext context) {
    // Data katalog beras — 5 entri sesuai domain Pabrik BSM
    final daftarBeras = [
      {'nama': 'Beras Pandan Wangi', 'kualitas': 'Premium', 'harga': '15000', 'stok': '120'},
      {'nama': 'Beras Ramos Premium', 'kualitas': 'Premium', 'harga': '14000', 'stok': '85'},
      {'nama': 'Beras Rojo Lele', 'kualitas': 'Medium', 'harga': '13000', 'stok': '0'},
      {'nama': 'Beras IR64', 'kualitas': 'Medium', 'harga': '12000', 'stok': '200'},
      {'nama': 'Beras Dedak Halus', 'kualitas': 'Ekonomis', 'harga': '8000', 'stok': '50'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Produk Beras BSM'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
            tooltip: 'Muat ulang',
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bagian sapaan
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Selamat Datang di Pabrik BSM',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Silakan pilih beras yang tersedia:',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16),

          // Daftar produk beras menggunakan ListView.builder
          Expanded(
            child: ListView.builder(
              itemCount: daftarBeras.length,
              itemBuilder: (context, index) {
                final beras = daftarBeras[index];
                return BerasListTile(
                  nama: beras['nama']!,
                  kualitas: beras['kualitas']!,
                  harga: beras['harga']!,
                  stok: beras['stok']!,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Tambah produk',
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// Satu baris produk beras: Row berisi ikon, Column (nama + kualitas),
/// dan trailing (harga + stok dengan warna berdasarkan ketersediaan).
class BerasListTile extends StatelessWidget {
  const BerasListTile({
    super.key,
    required this.nama,
    required this.kualitas,
    required this.harga,
    required this.stok,
  });

  final String nama;
  final String kualitas;
  final String harga;
  final String stok;

  @override
  Widget build(BuildContext context) {
    final tersedia = stok != '0';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: tersedia ? Colors.green : Colors.grey,
            child: const Icon(Icons.rice_bowl, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  'Kualitas: $kualitas',
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  'Rp $harga/kg',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Text(
            tersedia ? 'Stok: $stok' : 'Habis',
            style: TextStyle(
              color: tersedia ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}