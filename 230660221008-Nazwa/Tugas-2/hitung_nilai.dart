void main() {
  print('Mata Kuliah: Pemrograman Aplikasi Bergerak');
  print('------------------------------------------');

  // 1. Struktur Data: List<Map<String, Object>> dengan 6 komponen
  final komponen = [
    {'nama': 'Kehadiran', 'bobot': 10, 'skor': 10},
    {'nama': 'Kuis', 'bobot': 10, 'skor': 8},
    {'nama': 'Tugas', 'bobot': 20, 'skor': 18},
    {'nama': 'Praktikum', 'bobot': 25, 'skor': 23},
    {'nama': 'UTS', 'bobot': 15, 'skor': 12},
    {'nama': 'UAS', 'bobot': 20, 'skor': 17},
  ];

  // Menampilkan daftar komponen ke layar
  for (var k in komponen) {
    print('- ${k['nama']}: Bobot ${k['bobot']}%, Skor ${k['skor']}');
  }

  // Menghitung dan menampilkan hasil
  double rataRata = hitungRataRata(komponen);
  print('------------------------------------------');
  print('Rata-rata skor komponen : ${rataRata.toStringAsFixed(2)}');
  print('Predikat Akhir          : ${predikat(rataRata)}');
}

// 2. Fungsi hitungRataRata mengembalikan double
double hitungRataRata(List<Map<String, Object>> komponen) {
  double totalSkor = 0;
  for (var k in komponen) {
    totalSkor += (k['skor'] as int); // Casting tipe nilai ke integer
  }
  return totalSkor / komponen.length;
}

// 3. Fungsi predikat dengan aturan rentang
// Aturan predikat berdasarkan rata-rata skor per komponen:
// >= 14.0       -> A
// 11.0 - 13.99  -> B
// 8.0 - 10.99   -> C
// < 8.0         -> Perlu perbaikan
String predikat(double nilai) {
  if (nilai >= 14.0) return 'A';
  if (nilai >= 11.0) return 'B';
  if (nilai >= 8.0) return 'C';
  return 'Perlu perbaikan';
}