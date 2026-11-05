String predikat(int nilai) {
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

// TODO 6 — Fungsi arrow
int kalikanSkor(int skor, int faktor) => skor * faktor;

void main() {
  // ---------- Data ----------
  final daftarKomponen = [
    {'nama': 'Tugas', 'bobot': 30, 'skor': 28},
    {'nama': 'Praktikum', 'bobot': 25, 'skor': 24},
    {'nama': 'UTS', 'bobot': 20, 'skor': 15},
    {'nama': 'UAS', 'bobot': 25, 'skor': 23},
  ];

  // ============================================================
  // TODO 1 — Konstanta dan variabel
  // ============================================================
  final int jumlahKomponen = daftarKomponen.length; 
  final String namaKuliah = 'PAB';
  print('Jumlah komponen penilaian: $jumlahKomponen (mata kuliah$namaKuliah).');
  print('');

  // ============================================================
  // TODO 2 — Percabangan
  // ============================================================
  print('Predikat untuk nilai 88: ${predikat(88)}');
  print('Predikat untuk nilai 50: ${predikat(50)}');
  print('');

  // ============================================================
  // TODO 3 — Perulangan
  // ============================================================
  for (var komponen in daftarKomponen) {
    String nama = komponen['nama'] as String;
    int bobot = komponen['bobot'] as int;
    int skor = komponen['skor'] as int;
    
    // Menghitung capaian dan membulatkannya
    int capaian = (skor / bobot * 100).round();
    
    print('$nama: bobot$bobot, skor $skor, capaian$capaian%');
  }
  print('');

  // ============================================================
  // TODO 4 — Accumulator
  // ============================================================
  int totalBobot = 0;
  int totalSkor = 0;
  
  for (var komponen in daftarKomponen) {
    totalBobot += komponen['bobot'] as int;
    totalSkor += komponen['skor'] as int;
  }
  
  
  double rataRata = (totalSkor / totalBobot) * 100;
  
  print('Total bobot: $totalBobot, total skor: $totalSkor, ratarata:${rataRata.toStringAsFixed(1)}%.');
  print('');

  // ============================================================
  // TODO 5 — Map dan destructuring (pola dekonstruksi entri) / firstWhere
  // ============================================================
  var komponenUAS = daftarKomponen.firstWhere(
    (komponen) => komponen['nama'] == 'UAS',
    orElse: () => {'nama': 'Tidak Ditemukan', 'bobot': 0, 'skor': 0},
  );
  print('Kode komponen UAS: ${komponenUAS['nama']} (bobot${komponenUAS['bobot']}).');
  print('');

  // ============================================================
  // TODO 6 — Fungsi arrow (pemanggilan)
  // ============================================================
  print('Hasil kalikanSkor(90, 2) adalah: ${kalikanSkor(90, 2)}');
}