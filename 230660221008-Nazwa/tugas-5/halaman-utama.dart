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
  // Data statis pengaduan fasilitas (Felix & Pak Kirill)
  final List<Map<String, String>> daftarLaporan = [
    {
      'fasilitas': 'Proyektor Ruang 301',
      'kategori': 'Elektronik',
      'kendala': 'Lampu proyektor redup dan bergaris merah',
      'status': 'Diproses',
      'pelapor': 'Felix',
    },
    {
      'fasilitas': 'AC Lab Komputer 2',
      'kategori': 'Pendingin Ruangan',
      'kendala': 'AC mengeluarkan suara bising dan tidak dingin',
      'status': 'Menunggu',
      'pelapor': 'Felix',
    },
    {
      'fasilitas': 'Kursi Kuliah R.204',
      'kategori': 'Mebel',
      'kendala': 'Papan alas tulis patah dan lepas',
      'status': 'Selesai',
      'pelapor': 'Felix',
    },
    {
      'fasilitas': 'Pintu Kamar Mandi Lt. 2',
      'kategori': 'Sanitasi',
      'kendala': 'Gagling pintu macet dari dalam',
      'status': 'Menunggu',
      'pelapor': 'Pak Kirill',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaduan Fasilitas Kampus'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: daftarLaporan.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.assignment_turned_in_outlined,
                    size: 64,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Belum Ada Laporan Fasilitas',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.outline,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: daftarLaporan.length,
              itemBuilder: (context, index) {
                final laporan = daftarLaporan[index];
                final status = laporan['status'] ?? 'Menunggu';

                // Ternary untuk penentuan warna status
                Color statusColor;
                if (status == 'Selesai') {
                  statusColor = Colors.green;
                } else if (status == 'Diproses') {
                  statusColor = Colors.orange;
                } else {
                  statusColor = Colors.red;
                }

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                laporan['fasilitas']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Chip(
                              label: Text(
                                status,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              backgroundColor: statusColor,
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Kategori: ${laporan['kategori']}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          laporan['kendala']!,
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.person, size: 14, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(
                              'Pelapor: ${laporan['pelapor']}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add_comment),
        label: const Text('Buat Laporan'),
      ),
    );
  }
}