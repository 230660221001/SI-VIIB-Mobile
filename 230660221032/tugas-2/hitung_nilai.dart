// 1.1 Struktur Data List<Map<String, Object>>
final List<Map<String, Object>> komponen = [
  {'nama': 'Tugas', 'bobot': 30, 'skor': 25},
  {'nama': 'Praktikum', 'bobot': 25, 'skor': 18},
  {'nama': 'Kehadiran', 'bobot': 10, 'skor': 8},
  {'nama': 'Ujian Tengah Semester', 'bobot': 15, 'skor': 13},
  {'nama': 'Ujian Akhir Semester', 'bobot': 20, 'skor': 16},
];

// 1.2 Fungsi Hitung Rata-Rata
double hitungRataRata(List<Map<String, Object>> komponen) {
  double totalSkor = 0.0;
  for (var item in komponen) {
    totalSkor += (item['skor'] as num).toDouble();
  }

  return totalSkor / komponen.length;
}

// 1.3 Fungsi Predikat
// Aturan predikat:
// >= 17.2 -> A
// 14.2 - 17.1 -> B
// 12.2 - 14.1 -> C
// < 12.1 -> Perlu perbaikan
String predikat(double nilai) {
  if (nilai >= 17.2) {
    return 'A';
  } else if (nilai >= 14.2) {
    return 'B';
  } else if (nilai >= 12.2) {
    return 'C';
  } else {
    return 'Perlu perbaikan';
  }
}

// 1.4 Blok main ()
void main() {
  String namaMatkul = 'Pemrograman Aplikasi Bergerak'; //Nama Mata Kuliah
  print('Mata Kuliah: $namaMatkul\n'); //Menampilkan Nama Mata Kuliah

  //Menampilkan Daftar Komponen Penilaian
  print('Daftar Komponen Penilaian');
  for (var item in komponen) {
    print(
      '- ${item['nama']}: Bobot = ${item['bobot']}, Skor = ${item['skor']}',
    );
  }

  double rataRata = hitungRataRata(komponen); //Hitung Rata-rata Skor

  String predikatAkhir = predikat(rataRata); // Menentukan Predikat Akhir

  //Menampilkan Hasil Rata-Rata dan Predikat
  print('\nHasil Rata-rata dan Predikat Akhir');
  print('Rata-rata Skor : ${rataRata.toStringAsFixed(2)}');
  print('Predikat Akhir : $predikatAkhir');
}
