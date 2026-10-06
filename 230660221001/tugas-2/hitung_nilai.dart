// ============================================================================
// Tugas 2 - Modul Hitung Nilai
// Mata Kuliah : Pemrograman Aplikasi Bergerak (PAB)
// Domain      : Sistem Penjualan Beras di Pabrik BSM
// ============================================================================
// Program ini menghitung rata-rata tertimbang dari komponen penilaian dan
// menentukan predikat akhir berdasarkan rentang nilai pada fungsi predikat().
//
// Bantuan: Claude — meninjau logika rata-rata tertimbang dan dokumentasi
// rentang predikat.
//
// Cara menjalankan:
//   dart hitung_nilai.dart
// ============================================================================

const String namaMataKuliah = 'Pemrograman Aplikasi Bergerak';

// Aturan predikat (nilai skala 0-100; batas bawah termasuk, batas atas tidak):
//   nilai >= 86            -> A (Sangat Baik)
//   76 <= nilai < 86       -> B (Baik)
//   61 <= nilai < 76       -> C (Cukup)
//   nilai < 61             -> Perlu Perbaikan
String predikat(double nilai) {
  if (nilai >= 86) {
    return 'A (Sangat Baik)';
  } else if (nilai >= 76) {
    return 'B (Baik)';
  } else if (nilai >= 61) {
    return 'C (Cukup)';
  } else {
    return 'Perlu Perbaikan';
  }
}

// Menghitung rata-rata TERTIMBANG dari seluruh komponen penilaian:
//   rata-rata = jumlah(skor x bobot) / jumlah(bobot)
// Parameter: komponen -> List berisi Map dengan kunci 'nama', 'bobot', 'skor'
//            ('skor' berskala 0-100, 'bobot' berupa persen).
// Return: double (rata-rata tertimbang; 0.0 jika data kosong atau bobot 0).
double hitungRataRata(List<Map<String, Object>> komponen) {
  if (komponen.isEmpty) return 0.0;

  var totalBobot = 0.0;
  var totalSkorBerbobot = 0.0;

  for (final item in komponen) {
    // Nilai di dalam Map bertipe Object, jadi harus dikonversi eksplisit.
    // 'as num' menerima int maupun double, lalu diubah ke double.
    final bobot = (item['bobot'] as num).toDouble();
    final skor = (item['skor'] as num).toDouble();

    totalBobot += bobot;
    totalSkorBerbobot += skor * bobot;
  }

  if (totalBobot == 0) return 0.0;
  return totalSkorBerbobot / totalBobot;
}

void main() {
  final garis = '=' * 60;

  // ============================================================
  // 1. Data Komponen Penilaian
  // Data contoh untuk domain Sistem Penjualan Beras BSM: evaluasi modul
  // pada aplikasi mobile. Skor berskala 0-100, bobot berjumlah 100.
  // ============================================================
  final List<Map<String, Object>> komponenPenilaian = [
    {'nama': 'Katalog Produk', 'bobot': 20, 'skor': 90},
    {'nama': 'Keranjang & Checkout', 'bobot': 25, 'skor': 88},
    {'nama': 'Konfirmasi Pembayaran', 'bobot': 20, 'skor': 85},
    {'nama': 'Status Pesanan & Resi', 'bobot': 15, 'skor': 93},
    {'nama': 'Login & Hak Akses', 'bobot': 20, 'skor': 80},
  ];

  // ============================================================
  // 2. Menampilkan Nama Mata Kuliah
  // ============================================================
  print(garis);
  print('  MODUL HITUNG NILAI - SISTEM PENJUALAN BERAS BSM');
  print('  Mata Kuliah: $namaMataKuliah');
  print(garis);
  print('');

  // ============================================================
  // 3. Menampilkan Daftar Komponen
  // ============================================================
  print('--- Daftar Komponen Penilaian ---');
  for (var i = 0; i < komponenPenilaian.length; i++) {
    final item = komponenPenilaian[i];
    print(
      '${i + 1}. ${item['nama']} '
      '(Bobot: ${item['bobot']}%, Skor: ${item['skor']})',
    );
  }
  print('');

  // ============================================================
  // 4. Menghitung dan Menampilkan Rata-rata
  // ============================================================
  final rataRata = hitungRataRata(komponenPenilaian);
  print('Rata-rata Tertimbang: ${rataRata.toStringAsFixed(2)}');
  print('');

  // ============================================================
  // 5. Menentukan dan Menampilkan Predikat Akhir
  // ============================================================
  final predikatAkhir = predikat(rataRata);
  print('Predikat Akhir: $predikatAkhir');
  print(garis);
}