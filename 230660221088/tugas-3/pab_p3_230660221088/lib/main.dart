import 'package:flutter/material.dart';

void main() {
  runApp(const HalamanAplikasi());
}

class HalamanAplikasi extends StatelessWidget {
  const HalamanAplikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SI Pendataan Bencana',
      theme: ThemeData(
        primarySwatch: Colors.red, // Menggunakan warna identik institusi penanggulangan bencana
      ),
      home: const HalamanUtama(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  // Data statis berisi minimal 4 entri sesuai syarat tugas
  final List<Map<String, String>> dataBencana = const [
    {
      'jenis': 'Tanah Longsor',
      'lokasi': 'Kecamatan Sumedang Selatan',
      'tanggal': '02 Okt 2026',
      'status': 'Penanganan'
    },
    {
      'jenis': 'Banjir Bandang',
      'lokasi': 'Kecamatan Jatinangor',
      'tanggal': '28 Sep 2026',
      'status': 'Selesai'
    },
    {
      'jenis': 'Angin Puting Beliung',
      'lokasi': 'Kecamatan Cimanggung',
      'tanggal': '15 Sep 2026',
      'status': 'Selesai'
    },
    {
      'jenis': 'Kekeringan',
      'lokasi': 'Kecamatan Ujungjaya',
      'tanggal': '01 Sep 2026',
      'status': 'Pemantauan'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Bencana BPBD'),
        backgroundColor: Colors.red[800],
        foregroundColor: Colors.white,
      ),
      // Layout 1: ListView (salah satu opsi wajib)
      body: ListView.builder(
        itemCount: dataBencana.length,
        itemBuilder: (context, index) {
          final bencana = dataBencana[index];
          
          // Layout 2: Padding
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                // Layout 3: Row
                child: Row(
                  children: [
                    // Ikon di sebelah kiri
                    const Icon(Icons.warning_rounded, size: 40, color: Colors.orange),
                    const SizedBox(width: 16),
                    
                    // Layout 4: Column (di dalam Expanded agar teks tidak overflow)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bencana['jenis']!,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Lokasi: ${bencana['lokasi']}',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          Text(
                            'Tanggal: ${bencana['tanggal']}',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                    
                    // Status di sebelah kanan
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('Status', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        Text(
                          bencana['status']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: bencana['status'] == 'Selesai' ? Colors.green : Colors.red,
                          ),
                        )
                      ],
                    )
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