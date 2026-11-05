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

double hitungRataRata(List<Map<String, Object>> komponen) {
  if (komponen.isEmpty) {
    return 0.0;
  }
  var totalSkor = 0;
  for (final k in komponen) {
    totalSkor += k['skor'] as int;
  }
  return totalSkor / komponen.length;
}

int hitungTotalBobot(List<Map<String, Object>> komponen) {
  var total = 0;
  for (final k in komponen) {
    total += k['bobot'] as int;
  }
  return total;
}

void main() {
  const namaMk = 'Pemrograman Aplikasi Bergerak';
  const kodeMk = 'USA-WP2360241';

  final komponen = <Map<String, Object>>[
    {'nama': 'Tugas', 'bobot': 20, 'skor': 85},
    {'nama': 'Praktikum', 'bobot': 20, 'skor': 88},
    {'nama': 'Kuis', 'bobot': 10, 'skor': 70},
    {'nama': 'UTS', 'bobot': 25, 'skor': 78},
    {'nama': 'UAS', 'bobot': 25, 'skor': 90},
  ];

  final totalBobot = hitungTotalBobot(komponen);
  final statusBobot = totalBobot == 100 ? 'valid' : 'tidak valid';
  final rataRata = hitungRataRata(komponen);

  print('=== MODUL HITUNG NILAI ===');
  print('Mata kuliah : $namaMk ($kodeMk)');
  print('');
  print('No  Komponen    Bobot  Skor');
  for (var i = 0; i < komponen.length; i++) {
    final k = komponen[i];
    final no = '${i + 1}'.padRight(4);
    final nama = (k['nama'] as String).padRight(12);
    final bobot = '${k['bobot']}%'.padRight(7);
    print('$no$nama$bobot${k['skor']}');
  }
  print('');
  print('Total bobot    : $totalBobot% ($statusBobot)');
  print('Rata-rata skor : ${rataRata.toStringAsFixed(2)}');
  print('Predikat akhir : ${predikat(rataRata)}');
}
