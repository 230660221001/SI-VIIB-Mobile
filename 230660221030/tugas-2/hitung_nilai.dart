
final String namaMataKuliah = 'Pemrograman Aplikasi Bergerak (PAB)';

// Daftar komponen penilaian
final List<Map<String, Object>> komponen = [
  {'nama': 'Tugas', 'bobot': 30, 'skor': 90},
  {'nama': 'Praktikum', 'bobot': 25, 'skor': 88},
  {'nama': 'Kuis', 'bobot': 10, 'skor': 80},
  {'nama': 'UTS', 'bobot': 15, 'skor': 85},
  {'nama': 'UAS', 'bobot': 20, 'skor': 92},
];

// Fungsi menghitung rata-rata tertimbang
double hitungRataRata(List<Map<String, Object>> komponen) {
  var totalBobot = 0;
  var totalNilai = 0.0;

  for (final item in komponen) {
    final bobot = item['bobot'] as int;
    final skor = item['skor'] as int;

    totalBobot += bobot;
    totalNilai += bobot * skor;
  }

  if (totalBobot == 0) return 0.0;

  return totalNilai / totalBobot;
}

// Fungsi menentukan predikat nilai
// A = 86–100, B = 76–85, C = 61–75, D = di bawah 61
String predikat(double nilai) {
  if (nilai >= 86) return 'A';
  if (nilai >= 76) return 'B';
  if (nilai >= 61) return 'C';
  return 'D';
}

void main() {
  print('Mata Kuliah: $namaMataKuliah');
  print('\nDaftar Komponen Penilaian:');

  for (final item in komponen) {
    print(
      '- ${item['nama']}: bobot ${item['bobot']}%, skor ${item['skor']}',
    );
  }

  final totalBobot = komponen.fold<int>(
    0,
    (total, item) => total + (item['bobot'] as int),
  );

  final rataRata = hitungRataRata(komponen);

  print('\nTotal Bobot: $totalBobot%');
  print('Rata-rata Tertimbang: ${rataRata.toStringAsFixed(2)}');
  print('Predikat Akhir: ${predikat(rataRata)}');
}