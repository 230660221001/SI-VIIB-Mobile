// Tugas 2 — Modul Hitung Nilai
// Nama  : Talitha Ardelia Ivana
// NIM   : 230660221114
// Kelas : SI-VIIB

final String namaMataKuliah = 'Analisis Proses Bisnis';

final List<Map<String, Object>> komponen = [
  {'nama': 'Studi kasus', 'bobot': 25, 'skor': 23},
  {'nama': 'Pemetaan proses', 'bobot': 20, 'skor': 18},
  {'nama': 'Presentasi kelompok', 'bobot': 15, 'skor': 14},
  {'nama': 'Laporan analisis', 'bobot': 20, 'skor': 17},
  {'nama': 'Proyek akhir', 'bobot': 20, 'skor': 19},
];

double hitungTotalSkor(List<Map<String, Object>> komponen) {
  double total = 0;
  for (final item in komponen) {
    total += item['skor'] as int;
  }
  return total;
}

String predikat(double nilai) {
  if (nilai >= 86) {
    return 'A (Sangat Baik)';
  } else if (nilai >= 76) {
    return 'B (Baik)';
  } else if (nilai >= 61) {
    return 'C (Cukup)';
  } else {
    return 'Perlu perbaikan';
  }
}

void main() {
  print('====================================');
  print('Mata Kuliah: $namaMataKuliah');
  print('====================================');
  print('Nama Mahasiswa : Talitha Ardelia Ivana');
  print('NIM            : 230660221114');
  print('Kelas          : SI-VIIB');
  print('====================================');

  print('\nDaftar Komponen Penilaian:');
  for (final item in komponen) {
    print(
      '- ${item['nama']}: '
      'Bobot = ${item['bobot']}, '
      'Skor = ${item['skor']}',
    );
  }

  final totalBobot = komponen.fold<int>(
    0,
    (total, item) => total + (item['bobot'] as int),
  );
  final totalSkor = hitungTotalSkor(komponen);

  print('\nHasil Akhir:');
  print('Total Bobot : $totalBobot');
  print('Total Skor  : ${totalSkor.toStringAsFixed(1)}');
  print('Predikat Akhir : ${predikat(totalSkor)}');
  print('====================================');
  print('\nExited.');
}
