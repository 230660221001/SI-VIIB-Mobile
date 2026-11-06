void main() {
  // 1. Nama mata kuliah / Program
  print('--- Evaluasi Keaktifan Relawan Panti Baca Ceria (CeriaReads) ---');

  // 1.1 Struktur Data: List> berisi 5 komponen
  final komponen = <Map<String, Object>>[
    {'nama': 'Kehadiran Lapak Baca', 'bobot': 30, 'skor': 28},
    {'nama': 'Kontribusi Program Kerja', 'bobot': 25, 'skor': 23}, 
    {'nama': 'Input Data Peminjaman', 'bobot': 20, 'skor': 20},
    {'nama': 'Kerapian Katalog Buku', 'bobot': 15, 'skor': 14},
    {'nama': 'Ide Kreatif Literasi', 'bobot': 10, 'skor': 8},
  ];

  // 2. Menampilkan daftar komponen (nama, bobot, skor)
  print('\nRincian Komponen Penilaian:');
  for (final k in komponen) {
    print('- ${k['nama']}: Bobot ${k['bobot']}, Skor ${k['skor']}');
  }

  // 3. Menghitung dan menampilkan rata-rata skor
  final rataRata = hitungRataRata(komponen);
  print('\nRata-rata skor per komponen: $rataRata');

  // 4. Menentukan dan menampilkan predikat akhir
  final predikatAkhir = predikat(rataRata);
  print('Predikat Akhir Relawan: $predikatAkhir');
}

// 1.2 Fungsi hitungRataRata
double hitungRataRata(List<Map<String, Object>> komponen) {
  double totalSkor = 0;
  for (final item in komponen) {
    totalSkor += (item['skor'] as int);
  }
  return totalSkor / komponen.length;
}

// 1.3 Fungsi predikat
String predikat(double nilai) {
  if (nilai >= 17.0) {
    return 'Relawan Bintang (Sangat Aktif)';
  } else if (nilai >= 14.0) {
    return 'Relawan Hebat (Aktif)';
  } else if (nilai >= 10.0) {
    return 'Relawan Berkembang (Cukup)';
  } else {
    return 'Perlu Pendampingan Khusus';
  }
}