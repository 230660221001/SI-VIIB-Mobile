void main() {
  final List<Map<String, Object>> komponen = [
    {'nama': 'Tugas', 'bobot': 20, 'skor': 18},
    {'nama': 'Praktikum', 'bobot': 10, 'skor': 10},
    {'nama': 'Kehadiran', 'bobot': 10, 'skor': 10},
    {'nama': 'Ujian Tengah Semester', 'bobot': 30, 'skor': 30},
    {'nama': 'Ujian Akhir Semester', 'bobot': 20, 'skor': 20},
  ];
String predikat(double nilai) {
  if (nilai >= 86.0) {
    return 'A (Sangat Baik)';
  } else if (nilai >= 76.0) {
    return 'B (Baik)';
  } else if (nilai >= 61.0) {
    return 'C (Cukup)';
  } else {
    return 'Perlu perbaikan';
  }
}
double hitungTotalSkor(List<Map<String, Object>> komponen) { // Bantuan: Claude membantu men-debug fungsi hitungTotalSkor // (penamaan variabel, cast Object ke int, dan alur akumulasi total skor)
  double total = 0.0;
  for (var item in komponen) {
    total += (item['skor'] as num).toDouble();
  }
  return total;
}



  print('====================================');
  print('Mata Kuliah: Pemrograman Aplikasi Bergerak');
  print('====================================');
  print('Nama Mahasiswa : Rian Rianto');
  print('NIM            : 230660221004');
  print('Kelas          : SI-VIIB');
  print('====================================');

  print('\nDaftar Komponen Penilaian:');
  for (var item in komponen) {
    print('- ${item['nama']}: Bobot = ${item['bobot']}, Skor = ${item['skor']}');
  }

  double hitungTotalskor = hitungTotalSkor(komponen);
  String predikatAkhir = predikat(hitungTotalskor);

  print('\nHasil Akhir:');
  print('Total Skor : $hitungTotalskor');
  print('Predikat Akhir : $predikatAkhir');
  print('====================================');
}