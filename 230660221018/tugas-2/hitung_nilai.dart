// Modul Hitung Nilai
// Mata Kuliah: Pemrograman Aplikasi Bergerak
//
// Bantuan AI: ChatGPT — membantu memeriksa struktur data,
// logika fungsi, dan kesesuaian sintaks dasar Dart.

double hitungRataRata(List<Map<String, Object>> komponen) {
  var totalSkor = 0;

  for (final item in komponen) {
    totalSkor += item['skor'] as int;
  }

  return totalSkor / komponen.length;
}

// Aturan predikat berdasarkan rata-rata skor:
// >= 18 -> A
// >= 16 dan < 18 -> B
// >= 14 dan < 16 -> C
// < 14 -> Perlu perbaikan
String predikat(double nilai) {
  if (nilai >= 18) {
    return 'A';
  } else if (nilai >= 16) {
    return 'B';
  } else if (nilai >= 14) {
    return 'C';
  } else {
    return 'Perlu perbaikan';
  }
}

void main() {
  const namaMataKuliah = 'Pemrograman Aplikasi Bergerak';

  final List<Map<String, Object>> komponen = [
    {'nama': 'Tugas 1', 'bobot': 20, 'skor': 18},
    {'nama': 'Tugas 2', 'bobot': 20, 'skor': 17},
    {'nama': 'Praktikum', 'bobot': 25, 'skor': 22},
    {'nama': 'UTS', 'bobot': 15, 'skor': 13},
    {'nama': 'UAS', 'bobot': 20, 'skor': 18},
  ];

  final rataRata = hitungRataRata(komponen);
  final hasilPredikat = predikat(rataRata);

  print('=== MODUL HITUNG NILAI ===');
  print('Mata Kuliah: $namaMataKuliah');
  print('');
  print('Daftar Komponen Penilaian:');

  for (final item in komponen) {
    print(
      '- ${item['nama']}: '
      'Bobot ${item['bobot']}, '
      'Skor ${item['skor']}',
    );
  }

  print('');
  print('Rata-rata Skor: ${rataRata.toStringAsFixed(2)}');
  print('Predikat Akhir: $hasilPredikat');
}
