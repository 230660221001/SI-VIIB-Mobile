import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab Komputer MAS Darussalam',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const LabKomputerPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LabKomputerPage extends StatelessWidget {
  const LabKomputerPage({super.key});

  // Data statis perangkat lab komputer (5 entri)
  final List<Map<String, String>> daftarPerangkat = const [
    {
      'kode': 'PC-01',
      'spesifikasi': 'Intel i3-6006U, RAM 8GB, SSD 128GB',
      'status': 'Siap Pakai',
      'lokasi': 'Baris A - No. 01',
    },
    {
      'kode': 'PC-02',
      'spesifikasi': 'Intel i3-6006U, RAM 4GB, HDD 500GB',
      'status': 'Perlu Perbaikan',
      'lokasi': 'Baris A - No. 02',
    },
    {
      'kode': 'PC-03',
      'spesifikasi': 'Intel Core i5, RAM 16GB, SSD 256GB',
      'status': 'Siap Pakai',
      'lokasi': 'Baris B - No. 01',
    },
    {
      'kode': 'PC-04',
      'spesifikasi': 'Intel i3-6006U, RAM 8GB, SSD 128GB',
      'status': 'Rusak Total',
      'lokasi': 'Baris B - No. 02',
    },
    {
      'kode': 'PC-05',
      'spesifikasi': 'Intel Core i5, RAM 8GB, SSD 256GB',
      'status': 'Siap Pakai',
      'lokasi': 'Baris C - No. 01',
    },
  ];

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Siap Pakai':
        return Colors.green;
      case 'Perlu Perbaikan':
        return Colors.orange;
      case 'Rusak Total':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monitoring Lab Komputer'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Info Ringkasan (Menggunakan Card & Row)
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.computer, size: 40, color: Colors.indigo),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'MAS Darussalam Sumedang',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Total Terdata: 5 Unit Perangkat',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Daftar Perangkat & Kondisi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Daftar Perangkat (Menggunakan Expanded & ListView.builder)
            Expanded(
              child: ListView.builder(
                itemCount: daftarPerangkat.length,
                itemBuilder: (context, index) {
                  final item = daftarPerangkat[index];
                  final statusColor = _getStatusColor(item['status']!);

                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: statusColor.withOpacity(0.2),
                        child: Icon(Icons.desktop_windows, color: statusColor),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item['kode']!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: statusColor.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              item['status']!,
                              style: TextStyle(
                                color: statusColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Spesifikasi: ${item['spesifikasi']}'),
                            const SizedBox(height: 2),
                            Text(
                              'Lokasi: ${item['lokasi']}',
                              style: const TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add_a_photo, color: Colors.white),
      ),
    );
  }
}
