// Tugas 2 — Modul Hitung Nilai (Penilaian Praktikum Lab Komputer)
// Nama: Dian Erwin | NIM: 230660221022
// Kelas: SI-VIIA

// Data komponen. Kunci konsisten: nama (String), bobot (int), skor (int, skor <= bobot).
final List<Map<String, Object>> komponen = [
  {'nama': 'Kehadiran', 'bobot': 10, 'skor': 9},
  {'nama': 'Tugas Praktikum', 'bobot': 30, 'skor': 26},
  {'nama': 'Laporan', 'bobot': 20, 'skor': 17},
  {'nama': 'Ujian Praktik', 'bobot': 25, 'skor': 21},
  {'nama': 'Proyek Mini', 'bobot': 15, 'skor': 12},
];

// Menghitung total skor (nilai akhir).
// Catatan: Karena total bobot adalah 100 dan skor masing-masing komponen sudah <= bobot,
// maka nilai akhir didapat dari penjumlahan seluruh skor. Jika dibagi jumlah komponen, 
// nilainya akan salah (menjadi belasan).
double hitungRataRata(List<Map<String, Object>> komponen) {
  double totalSkor = 0.0;
  for (var k in komponen) {
    // Menggunakan kata kunci `as int` untuk casting Object ke int, lalu dikonversi ke double
    totalSkor += (k['skor'] as int).toDouble();
  }
  return totalSkor;
}

// Aturan predikat:
// >= 86    -> A
// 76 - 85  -> B
// 61 - 75  -> C
// < 61     -> Perlu perbaikan
String predikat(double nilai) {
  if (nilai >= 86) {
    return 'A';
  } else if (nilai >= 76) {
    return 'B';
  } else if (nilai >= 61) {
    return 'C';
  } else {
    return 'Perlu perbaikan';
  }
}

void main() {
  print('=== Penilaian Praktikum Lab Komputer ===');
  for (var k in komponen) {
    print('- ${k['nama']}: Bobot ${k['bobot']}%, Skor ${k['skor']}');
  }
  
  double nilaiAkhir = hitungRataRata(komponen);
  
  print('----------------------------------------');
  print('Nilai Akhir    : ${nilaiAkhir.toStringAsFixed(1)}');
  print('Predikat Akhir : ${predikat(nilaiAkhir)}');
}

// Bantuan: Claude — menyiapkan kerangka file
// Bantuan: AI Assistant — memperbaiki logika akumulasi skor dan casting tipe data Map
