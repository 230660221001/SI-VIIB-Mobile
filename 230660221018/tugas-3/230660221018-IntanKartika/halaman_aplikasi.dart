import 'package:flutter/material.dart';

class HalamanAplikasi extends StatelessWidget {
  const HalamanAplikasi({super.key});

  // Data statis untuk kebutuhan Tugas 3.
  final List<Map<String, String>> pengajuan = const [
    {
      'jenis': 'Surat Observasi',
      'tujuan': 'PT Maju Jaya',
      'status': 'Diproses',
    },
    {
      'jenis': 'Surat Penelitian',
      'tujuan': 'Universitas ABC',
      'status': 'Disetujui',
    },
    {
      'jenis': 'Surat Observasi',
      'tujuan': 'CV Teknologi Nusantara',
      'status': 'Selesai',
    },
    {
      'jenis': 'Surat Penelitian',
      'tujuan': 'PT Digital Indonesia',
      'status': 'Ditolak',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIPORA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F8FB),
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 24,
          title: const Text(
            'SIPORA',
            style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.2),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header pengguna
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF3FF),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: const Color(0xFFD7E8FF)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1565C0),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.person_outline,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Halo, Intan',
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF172033),
                                  ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Pantau pengajuan surat observasi dan penelitian Anda.',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: const Color(0xFF5F6B7A)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 22),

                // Ringkasan pengajuan
                Row(
                  children: [
                    Expanded(
                      child: _buildSummaryCard(
                        context,
                        icon: Icons.description_outlined,
                        label: 'Total Pengajuan',
                        value: '4',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildSummaryCard(
                        context,
                        icon: Icons.hourglass_empty,
                        label: 'Diproses',
                        value: '1',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildSummaryCard(
                        context,
                        icon: Icons.check_circle_outline,
                        label: 'Selesai',
                        value: '1',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 26),

                // Judul daftar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Riwayat Pengajuan',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF172033),
                      ),
                    ),
                    Text(
                      '${pengajuan.length} pengajuan',
                      style: Theme.of(context).textTheme.bodySmall
                          ?.copyWith(color: const Color(0xFF6B7788)),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Daftar pengajuan
                Expanded(
                  child: ListView.builder(
                    itemCount: pengajuan.length,
                    itemBuilder: (context, index) {
                      final data = pengajuan[index];

                      return _buildPengajuanCard(
                        context,
                        jenis: data['jenis']!,
                        tujuan: data['tujuan']!,
                        status: data['status']!,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5EAF0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24, color: const Color(0xFF1565C0)),
          const SizedBox(height: 12),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: const Color(0xFF172033),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall
                ?.copyWith(color: const Color(0xFF6B7788)),
          ),
        ],
      ),
    );
  }

  Widget _buildPengajuanCard(
    BuildContext context, {
    required String jenis,
    required String tujuan,
    required String status,
  }) {
    final statusStyle = _getStatusStyle(status);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5EAF0)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF3FF),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.description_outlined,
              color: Color(0xFF1565C0),
              size: 24,
            ),
          ),
          const SizedBox(width: 14),

          // Informasi pengajuan
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jenis,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF172033),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Tujuan: $tujuan',
                  style: Theme.of(context).textTheme.bodyMedium
                      ?.copyWith(color: const Color(0xFF687587)),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Status
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: statusStyle.background,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusStyle.text,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _StatusStyle _getStatusStyle(String status) {
    switch (status) {
      case 'Disetujui':
        return const _StatusStyle(
          background: Color(0xFFE8F5E9),
          text: Color(0xFF2E7D32),
        );

      case 'Selesai':
        return const _StatusStyle(
          background: Color(0xFFE3F2FD),
          text: Color(0xFF1565C0),
        );

      case 'Ditolak':
        return const _StatusStyle(
          background: Color(0xFFFFEBEE),
          text: Color(0xFFC62828),
        );

      case 'Diproses':
      default:
        return const _StatusStyle(
          background: Color(0xFFFFF4E5),
          text: Color(0xFFB26A00),
        );
    }
  }
}

class _StatusStyle {
  final Color background;
  final Color text;

  const _StatusStyle({required this.background, required this.text});
}
