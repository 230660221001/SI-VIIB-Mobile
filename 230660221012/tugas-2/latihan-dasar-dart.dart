// code/pertemuan-02/latihan-dasar-dart.dart

// TODO 1 — Deklarasikan konstanta jumlah komponen dan variabel nama kuliah
const int JUMLAH_KOMPONEN = 4;
String namaMataKuliah = "Pengembangan Aplikasi Bergerak";

// TODO 2 — Tulis fungsi predikat(int nilai) dengan rentang yang benar
String predikat(int nilai) {
  if (nilai >= 85) {
    return 'A';
  } else if (nilai >= 75) {
    return 'B';
  } else if (nilai >= 65) {
    return 'C';
  } else if (nilai >= 50) {
    return 'D';
  } else {
    return 'E';
  }
}

// TODO 6 — Tulis fungsi arrow kalikanSkor
double kalikanSkor(int nilai, double bobot) => nilai * bobot;

void main() {
  print("=== Skema Penilaian $namaMataKuliah ===");
  print("Jumlah Komponen: $JUMLAH_KOMPONEN\n");

  // Data komponen penilaian (Nama Komponen, Nilai, Bobot)
  List<Map<String, dynamic>> komponenPenilaian = [
    {'nama': 'Tugas', 'nilai': 85, 'bobot': 0.20},
    {'nama': 'Kuis', 'nilai': 78, 'bobot': 0.15},
    {'nama': 'UTS', 'nilai': 80, 'bobot': 0.30},
    {'nama': 'UAS', 'nilai': 90, 'bobot': 0.35},
  ];

  // TODO 3 — Jalankan perulangan pada daftar komponen dan cetak baris per komponen
  print("--- Rincian Komponen Penilaian ---");
  for (var komponen in komponenPenilaian) {
    String nama = komponen['nama'];
    int nilai = komponen['nilai'];
    double bobot = komponen['bobot'];

    print(
      "Komponen: $nama | Nilai: $nilai | Bobot: ${(bobot * 100).toInt()}% | Predikat: ${predikat(nilai)}",
    );
  }

  // TODO 4 — Akumulasikan total bobot dan total skor dengan perulangan
  double totalBobot = 0.0;
  double totalSkor = 0.0;

  for (var komponen in komponenPenilaian) {
    int nilai = komponen['nilai'];
    double bobot = komponen['bobot'];

    totalBobot += bobot;
    totalSkor += kalikanSkor(nilai, bobot);
  }

  print("\n--- Ringkasan Akhir ---");
  print("Total Bobot: ${(totalBobot * 100).toStringAsFixed(0)}%");
  print("Nilai Akhir (Total Skor): ${totalSkor.toStringAsFixed(2)}");
  print("Predikat Akhir: ${predikat(totalSkor.round())}");

  // TODO 5 — Ambil komponen UAS menggunakan firstWhere dengan orElse
  print("\n--- Pencarian Komponen UAS ---");
  var komponenUAS = komponenPenilaian.firstWhere(
    (komponen) => komponen['nama'] == 'UAS',
    orElse: () => {'nama': 'UAS', 'nilai': 0, 'bobot': 0.0},
  );

  print(
    "Komponen Ditemukan: ${komponenUAS['nama']} dengan Nilai: ${komponenUAS['nilai']}",
  );
}
