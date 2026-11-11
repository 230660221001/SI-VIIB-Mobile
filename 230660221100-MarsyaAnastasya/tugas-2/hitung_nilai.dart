const String namaMataKuliah = 'Pemrograman Aplikasi Bergerak';

final List<Map<String, Object>> komponen = [
  {'nama': 'Tugas', 'bobot': 25, 'skor': 23},
  {'nama': 'Praktikum', 'bobot': 25, 'skor': 24},
  {'nama': 'Kuis', 'bobot': 10, 'skor': 8},
  {'nama': 'UTS', 'bobot': 20, 'skor': 15},
  {'nama': 'UAS', 'bobot': 20, 'skor': 18},
];

// Menghitung rata-rata skor mentah.
double hitungRataRata(List<Map<String, Object>> komponen) {
  if (komponen.isEmpty) return 0.0;

  int totalSkor = 0;
  for (final item in komponen) {
    totalSkor += item['skor'] as int;
  }

  return totalSkor / komponen.length;
}

// Menghitung nilai akhir berbobot dalam skala 100.
double hitungNilaiAkhir(List<Map<String, Object>> komponen) {
  double totalNilai = 0.0;

  for (final item in komponen) {
    final bobot = item['bobot'] as int;
    final skor = item['skor'] as int;
    totalNilai += (skor / bobot) * bobot;
  }

  return totalNilai;
}

// Rentang predikat:
// A: nilai >= 85
// B: nilai >= 75 dan < 85
// C: nilai >= 65 dan < 75
// D: nilai >= 50 dan < 65
// E: nilai < 50
String predikat(double nilai) {
  if (nilai >= 85) return 'A';
  if (nilai >= 75) return 'B';
  if (nilai >= 65) return 'C';
  if (nilai >= 50) return 'D';
  return 'E';
}

void main() {
  final rataRata = hitungRataRata(komponen);
  final nilaiAkhir = hitungNilaiAkhir(komponen);

  print('Mata Kuliah: $namaMataKuliah');
  print('Daftar Komponen Penilaian:');

  for (final item in komponen) {
    print(
      '- ${item['nama']} | Bobot: ${item['bobot']}% '
      '| Skor: ${item['skor']}',
    );
  }

  print('Rata-rata skor mentah: ${rataRata.toStringAsFixed(2)}');
  print('Nilai akhir berbobot: ${nilaiAkhir.toStringAsFixed(2)}');
  print('Predikat akhir: ${predikat(nilaiAkhir)}');
}
