import 'package:flutter/material.dart';

/// Halaman utama FasKampus untuk menampilkan daftar fasilitas kampus.
/// Data pada prototype ini masih berupa data contoh (belum terhubung backend).
class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  static const List<Map<String, String>> fasilitas = [
    {
      'nama': 'Aula Kampus',
      'lokasi': 'Gedung Utama',
      'kapasitas': '100 orang',
      'deskripsi': 'Cocok untuk seminar, rapat, dan kegiatan mahasiswa.',
      'status': 'Tersedia',
    },
    {
      'nama': 'Ruang Kelas',
      'lokasi': 'Gedung Perkuliahan',
      'kapasitas': '40 orang',
      'deskripsi': 'Dapat digunakan untuk diskusi dan kegiatan akademik.',
      'status': 'Tersedia',
    },
    {
      'nama': 'Laboratorium',
      'lokasi': 'Gedung Laboratorium',
      'kapasitas': '30 orang',
      'deskripsi': 'Fasilitas untuk praktikum dan kegiatan pembelajaran.',
      'status': 'Perlu Konfirmasi',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('FasKampus'),
        centerTitle: false,
        actions: [
          IconButton(
            tooltip: 'Informasi aplikasi',
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'FasKampus',
                applicationVersion: 'Prototype Tugas 5',
                children: const [
                  Text(
                    'Aplikasi informasi dan pengajuan peminjaman '
                    'fasilitas kampus.',
                  ),
                ],
              );
            },
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: fasilitas.isEmpty
          ? const _EmptyState()
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
              children: [
                Text(
                  'Fasilitas Kampus',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Temukan fasilitas yang sesuai dengan kebutuhan kegiatanmu.',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari fasilitas...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) {
                    // Fitur pencarian akan dikembangkan pada tahap berikutnya.
                  },
                ),
                const SizedBox(height: 20),
                ...fasilitas.map(
                  (item) => _KartuFasilitas(fasilitas: item),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Form peminjaman akan dikembangkan pada Tugas 6.',
              ),
            ),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Ajukan Peminjaman'),
      ),
    );
  }
}

class _KartuFasilitas extends StatelessWidget {
  const _KartuFasilitas({required this.fasilitas});

  final Map<String, String> fasilitas;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final status = fasilitas['status'] ?? 'Tersedia';

    final Color warnaStatus;
    if (status == 'Tersedia') {
      warnaStatus = theme.colorScheme.primary;
    } else if (status == 'Perlu Konfirmasi') {
      warnaStatus = theme.colorScheme.tertiary;
    } else {
      warnaStatus = theme.colorScheme.error;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.primaryContainer,
          foregroundColor: theme.colorScheme.onPrimaryContainer,
          child: const Icon(Icons.meeting_room_outlined),
        ),
        title: Text(
          fasilitas['nama'] ?? 'Fasilitas',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(fasilitas['lokasi'] ?? ''),
              const SizedBox(height: 4),
              Text('Kapasitas: ${fasilitas['kapasitas'] ?? '-'}'),
              const SizedBox(height: 8),
              Text(fasilitas['deskripsi'] ?? ''),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: warnaStatus.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: warnaStatus,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        isThreeLine: true,
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Detail ${fasilitas['nama']} akan dikembangkan pada Tugas 6.',
              ),
            ),
          );
        },
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.meeting_room_outlined,
              size: 64,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              'Belum ada fasilitas',
              style: theme.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Informasi fasilitas kampus akan ditampilkan di sini.',
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
