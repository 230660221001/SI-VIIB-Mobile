
import 'package:flutter/material.dart';


class HalamanAplikasi extends StatefulWidget {
  const HalamanAplikasi({super.key});

  @override
  State<HalamanAplikasi> createState() => _HalamanAplikasiState();
}


class _HalamanAplikasiState extends State<HalamanAplikasi> {
  static const Color merahAkademik = Color(0xFFB21F32);
  static const Color merahGelap = Color(0xFF821526);
  static const Color latar = Color(0xFFF7F7F9);
  static const Color teksUtama = Color(0xFF242936);
  static const Color teksSekunder = Color(0xFF777D89);

  final TextEditingController pencarianController =
      TextEditingController();

  String kataKunci = '';
  String kategoriAktif = 'Semua';

  final List<Map<String, dynamic>> fasilitas = [
    {
      'nama': 'Ruang Kelas',
      'lokasi': 'Gedung Perkuliahan',
      'jumlah': '12 ruangan',
      'kategori': 'Ruangan',
      'status': 'Tersedia',
      'ikon': Icons.meeting_room_outlined,
    },
    {
      'nama': 'Aula Kampus',
      'lokasi': 'Gedung Utama',
      'jumlah': '2 aula',
      'kategori': 'Ruangan',
      'status': 'Tersedia',
      'ikon': Icons.account_balance_outlined,
    },
    {
      'nama': 'Proyektor',
      'lokasi': 'Bagian Inventaris',
      'jumlah': '8 unit',
      'kategori': 'Peralatan',
      'status': 'Tersedia',
      'ikon': Icons.connected_tv_outlined,
    },
    {
      'nama': 'Sound System',
      'lokasi': 'Bagian Inventaris',
      'jumlah': '3 unit',
      'kategori': 'Peralatan',
      'status': 'Terbatas',
      'ikon': Icons.speaker_outlined,
    },
  ];

  @override
  void dispose() {
    pencarianController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get fasilitasTerfilter {
    return fasilitas.where((item) {
      final nama = (item['nama'] as String).toLowerCase();
      final lokasi = (item['lokasi'] as String).toLowerCase();

      final cocokKataKunci =
          nama.contains(kataKunci.toLowerCase()) ||
          lokasi.contains(kataKunci.toLowerCase());

      final cocokKategori = kategoriAktif == 'Semua' ||
          item['kategori'] == kategoriAktif;

      return cocokKataKunci && cocokKategori;
    }).toList();
  }

  void tampilkanPesan(String pesan) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(pesan),
          behavior: SnackBarBehavior.floating,
          backgroundColor: merahGelap,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: latar,

      // HEADER APLIKASI
      appBar: AppBar(
        backgroundColor: merahAkademik,
        foregroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 20,
        title: Row(
          children: [
            Container(
              width: 39,
              height: 39,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.16),
                borderRadius: BorderRadius.circular(11),
              ),
              child: const Icon(
                Icons.account_balance_outlined,
                size: 24,
              ),
            ),
            const SizedBox(width: 11),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FasKampus',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.2,
                  ),
                ),
                Text(
                  'Layanan Fasilitas Kampus',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white70,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              tampilkanPesan('Belum ada notifikasi baru.');
            },
            tooltip: 'Notifikasi',
            icon: const Icon(Icons.notifications_none_rounded),
          ),
          const SizedBox(width: 7),
        ],
      ),

      // KONTEN UTAMA
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 20, 18, 28),
          children: [
            // SAPAAN PENGGUNA
            const Text(
              'Halo, Mahasiswa!',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: teksUtama,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Temukan dan ajukan fasilitas untuk kegiatan '
              'organisasi kampusmu.',
              style: TextStyle(
                fontSize: 13,
                height: 1.5,
                color: teksSekunder,
              ),
            ),

            const SizedBox(height: 21),

            // BANNER UTAMA
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [merahAkademik, merahGelap],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: merahAkademik.withValues(alpha: 0.18),
                    blurRadius: 16,
                    offset: const Offset(0, 7),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -10,
                    top: -12,
                    child: Icon(
                      Icons.account_balance,
                      size: 115,
                      color: Colors.white.withValues(alpha: 0.09),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          'LAYANAN MAHASISWA',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            letterSpacing: 1.1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Kegiatan Lancar,\nFasilitas Terpenuhi.',
                        style: TextStyle(
                          fontSize: 23,
                          height: 1.3,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 9),
                      const Text(
                        'Ajukan kebutuhan fasilitas kampus '
                        'dengan lebih mudah.',
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.5,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 19),
                      FilledButton.icon(
                        onPressed: () {
                          tampilkanPesan(
                            'Fitur pengajuan akan dikembangkan '
                            'pada tahap berikutnya.',
                          );
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: merahAkademik,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        icon: const Icon(
                          Icons.add_circle_outline,
                          size: 18,
                        ),
                        label: const Text(
                          'Ajukan Fasilitas',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // RINGKASAN
            const Text(
              'Ringkasan Fasilitas',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: teksUtama,
              ),
            ),
            const SizedBox(height: 13),

            Row(
              children: [
                Expanded(
                  child: _kartuRingkasan(
                    ikon: Icons.inventory_2_outlined,
                    angka: '${fasilitas.length}',
                    label: 'Jenis Fasilitas',
                    warnaIkon: merahAkademik,
                    latarIkon: const Color(0xFFFBE9EC),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _kartuRingkasan(
                    ikon: Icons.check_circle_outline,
                    angka: '${fasilitas.where(
                      (item) => item['status'] == 'Tersedia',
                    ).length}',
                    label: 'Siap Digunakan',
                    warnaIkon: const Color(0xFF238653),
                    latarIkon: const Color(0xFFE6F5EC),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 26),

            // JUDUL DAN PENCARIAN
            const Text(
              'Jelajahi Fasilitas',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: teksUtama,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Pilih fasilitas sesuai kebutuhan kegiatanmu.',
              style: TextStyle(
                fontSize: 12,
                color: teksSekunder,
              ),
            ),
            const SizedBox(height: 14),

            TextField(
              controller: pencarianController,
              onChanged: (nilai) {
                setState(() {
                  kataKunci = nilai;
                });
              },
              decoration: InputDecoration(
                hintText: 'Cari nama atau lokasi fasilitas...',
                hintStyle: const TextStyle(
                  color: teksSekunder,
                  fontSize: 12,
                ),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: merahAkademik,
                ),
                suffixIcon: kataKunci.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          pencarianController.clear();
                          setState(() {
                            kataKunci = '';
                          });
                        },
                        icon: const Icon(Icons.close),
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(
                    color: Color(0xFFE8E8ED),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(
                    color: Color(0xFFE8E8ED),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(
                    color: merahAkademik,
                    width: 1.4,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // FILTER KATEGORI
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['Semua', 'Ruangan', 'Peralatan'].map(
                  (kategori) {
                    final aktif = kategoriAktif == kategori;

                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(kategori),
                        selected: aktif,
                        showCheckmark: false,
                        onSelected: (_) {
                          setState(() {
                            kategoriAktif = kategori;
                          });
                        },
                        selectedColor: merahAkademik,
                        backgroundColor: Colors.white,
                        side: BorderSide(
                          color: aktif
                              ? merahAkademik
                              : const Color(0xFFE6E6EB),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: aktif ? Colors.white : teksSekunder,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),

            const SizedBox(height: 16),

            // DAFTAR FASILITAS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Fasilitas Kampus',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: teksUtama,
                  ),
                ),
                Text(
                  '${fasilitasTerfilter.length} ditemukan',
                  style: const TextStyle(
                    fontSize: 11,
                    color: teksSekunder,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 11),

            if (fasilitasTerfilter.isEmpty)
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.search_off_rounded,
                      size: 40,
                      color: teksSekunder,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Fasilitas tidak ditemukan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: teksUtama,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Coba kata kunci atau kategori lain.',
                      style: TextStyle(
                        fontSize: 12,
                        color: teksSekunder,
                      ),
                    ),
                  ],
                ),
              )
            else
              ...fasilitasTerfilter.map(
                (item) => _kartuFasilitas(item),
              ),

            const SizedBox(height: 15),

            // CATATAN
            Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: const Color(0xFFFBEDEF),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFF2D5DA),
                ),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: merahAkademik,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Informasi fasilitas pada halaman ini '
                      'merupakan data contoh untuk demonstrasi '
                      'antarmuka aplikasi.',
                      style: TextStyle(
                        fontSize: 11,
                        height: 1.5,
                        color: teksUtama,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // NAVIGASI BAWAH
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Color(0xFFECECF0)),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _itemNavigasi(
                  ikon: Icons.home_rounded,
                  label: 'Beranda',
                  aktif: true,
                  aksi: () {},
                ),
                _itemNavigasi(
                  ikon: Icons.widgets_outlined,
                  label: 'Fasilitas',
                  aksi: () {
                    tampilkanPesan(
                      'Kamu sedang melihat daftar fasilitas.',
                    );
                  },
                ),
                _itemNavigasi(
                  ikon: Icons.assignment_outlined,
                  label: 'Pengajuan',
                  aksi: () {
                    tampilkanPesan(
                      'Riwayat pengajuan tersedia pada '
                      'pengembangan berikutnya.',
                    );
                  },
                ),
                _itemNavigasi(
                  ikon: Icons.person_outline_rounded,
                  label: 'Profil',
                  aksi: () {
                    tampilkanPesan(
                      'Halaman profil akan dikembangkan '
                      'pada tahap berikutnya.',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // KARTU RINGKASAN
  Widget _kartuRingkasan({
    required IconData ikon,
    required String angka,
    required String label,
    required Color warnaIkon,
    required Color latarIkon,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFFECECF0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: latarIkon,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              ikon,
              color: warnaIkon,
              size: 22,
            ),
          ),
          const SizedBox(height: 13),
          Text(
            angka,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: teksUtama,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: teksSekunder,
            ),
          ),
        ],
      ),
    );
  }

  // KARTU FASILITAS
  Widget _kartuFasilitas(Map<String, dynamic> item) {
    final tersedia = item['status'] == 'Tersedia';

    return Container(
      margin: const EdgeInsets.only(bottom: 11),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFFECECF0),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 53,
            height: 58,
            decoration: BoxDecoration(
              color: const Color(0xFFFBEDEF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              item['ikon'] as IconData,
              color: merahAkademik,
              size: 27,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['nama'] as String,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: teksUtama,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 13,
                      color: teksSekunder,
                    ),
                    const SizedBox(width: 3),
                    Expanded(
                      child: Text(
                        item['lokasi'] as String,
                        style: const TextStyle(
                          fontSize: 10,
                          color: teksSekunder,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  item['jumlah'] as String,
                  style: const TextStyle(
                    fontSize: 10,
                    color: merahAkademik,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: tersedia
                      ? const Color(0xFFE5F5EB)
                      : const Color(0xFFFFF0D8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  item['status'] as String,
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: tersedia
                        ? const Color(0xFF218653)
                        : const Color(0xFF9A6500),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ITEM NAVIGASI BAWAH
  Widget _itemNavigasi({
    required IconData ikon,
    required String label,
    required VoidCallback aksi,
    bool aktif = false,
  }) {
    return InkWell(
      onTap: aksi,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              ikon,
              size: 23,
              color: aktif ? merahAkademik : teksSekunder,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight:
                    aktif ? FontWeight.bold : FontWeight.normal,
                color: aktif ? merahAkademik : teksSekunder,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
