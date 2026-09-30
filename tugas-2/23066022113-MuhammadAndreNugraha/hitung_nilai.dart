// Tugas 2 - Modul Hitung Nilai
// Nama: Muhammad Andre Nugraha
// NIM: [Isi NIM]
// Project SI: FasKampus

// Bantuan AI: ChatGPT digunakan untuk membantu memahami penggunaan
// List<Map<String, Object>>, fungsi, perulangan, dan percabangan.

// Nama mata kuliah
const String namaMataKuliah = 'Pemrograman Aplikasi Bergerak';

// Daftar komponen penilaian
final List<Map<String, Object>> komponen = [
  {
    'nama': 'Tugas',
    'bobot': 30,
    'skor': 28,
  },
  {
    'nama': 'Praktikum',
    'bobot': 25,
    'skor': 24,
  },
  {
    'nama': 'Kuis',
    'bobot': 10,
    'skor': 9,
  },
  {
    'nama': 'UTS',
    'bobot': 15,
    'skor': 13,
  },
  {
    'nama': 'UAS',
    'bobot': 20,
    'skor': 18,
  },
];

// Fungsi untuk menghitung rata-rata seluruh skor
double hitungRataRata(List<Map<String, Object>> komponen) {
  var totalSkor = 0;

  for (final item in komponen) {
    totalSkor += item['skor'] as int;
  }

  return totalSkor / komponen.length;
}

// Aturan predikat:
// >= 86 -> A
// 76 - 85.99 -> B
// 61 - 75.99 -> C
// < 61 -> Perlu perbaikan
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
  final rataRata = hitungRataRata(komponen);
  final hasilPredikat = predikat(rataRata);

  print('=== MODUL HITUNG NILAI ===');
  print('Mata Kuliah: $namaMataKuliah');
  print('');

  print('Daftar Komponen Penilaian:');

  for (final item in komponen) {
    final nama = item['nama'] as String;
    final bobot = item['bobot'] as int;
    final skor = item['skor'] as int;

    print('- $nama | Bobot: $bobot% | Skor: $skor');
  }

  print('');
  print('Rata-rata Skor: ${rataRata.toStringAsFixed(2)}');
  print('Predikat Akhir: $hasilPredikat');
}