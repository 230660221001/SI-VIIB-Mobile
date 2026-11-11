import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitoring Lab Darussalam',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Tema terpusat menggunakan ColorScheme
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  // Data dummy (sementara sebelum terhubung ke backend/database)
  final List<Map<String, dynamic>> daftarPC = const [
    {'kode': 'PC-01', 'spesifikasi': 'Core i3, 8GB RAM', 'status': 'Siap Pakai'},
    {'kode': 'PC-02', 'spesifikasi': 'Core i3, 8GB RAM', 'status': 'Rusak'},
    {'kode': 'PC-03', 'spesifikasi': 'Core i5, 8GB RAM', 'status': 'Siap Pakai'},
    {'kode': 'PC-04', 'spesifikasi': 'Core i7, 16GB RAM', 'status': 'Perbaikan'},
  ];
  
  // Ubah variabel ini menjadi 'true' untuk melihat keadaan kosong (Empty State)
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lab Komputer Darussalam',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: isEmpty
          ? Center(
              // Keadaan Kosong (Empty State)
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.computer_outlined,
                    size: 80,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Belum ada data PC.',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: daftarPC.length,
              itemBuilder: (context, index) {
                final pc = daftarPC[index];
                
                // Menentukan warna berdasarkan status menggunakan Ternary
                final bool isRusak = pc['status'] == 'Rusak';
                final bool isPerbaikan = pc['status'] == 'Perbaikan';
                
                Color statusColor = Colors.green;
                Color statusBgColor = Colors.green.shade100;
                
                if (isRusak) {
                  statusColor = Colors.red.shade900;
                  statusBgColor = Colors.red.shade100;
                } else if (isPerbaikan) {
                  statusColor = Colors.orange.shade900;
                  statusBgColor = Colors.orange.shade100;
                } else {
                  statusColor = Colors.green.shade900;
                  statusBgColor = Colors.green.shade100;
                }

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    leading: Icon(
                      Icons.monitor,
                      size: 40,
                      color: isRusak ? Colors.red : (isPerbaikan ? Colors.orange : Colors.green),
                    ),
                    title: Text(
                      pc['kode'] as String,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    subtitle: Text(pc['spesifikasi'] as String),
                    trailing: Chip(
                      label: Text(
                        pc['status'] as String,
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: statusBgColor,
                      side: BorderSide.none,
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Navigasi ke Halaman Form Pelaporan (Pertemuan 6)
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Navigasi ke Form Pelaporan...')),
          );
        },
        icon: const Icon(Icons.report_problem),
        label: const Text('Lapor Kerusakan'),
      ),
    );
  }
}
