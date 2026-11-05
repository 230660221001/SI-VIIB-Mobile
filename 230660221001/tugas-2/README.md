# Tugas 2 — Modul Hitung Nilai

## Identitas

- **Nama:** Ghatan Zalfaa Kautsar
- **NIM:** 230660221001
- **Mata Kuliah:** Pemrograman Aplikasi Bergerak (PAB)
- **Pertemuan:** 2
- **Domain:** Sistem Penjualan Beras di Pabrik BSM

## Cara Menjalankan

```bash
dart hitung_nilai.dart
```

## Aturan Predikat

Nilai berskala 0-100; batas bawah termasuk, batas atas tidak.

| Rentang nilai | Predikat |
|:--------------|:---------|
| nilai >= 86 | A (Sangat Baik) |
| 76 <= nilai < 86 | B (Baik) |
| 61 <= nilai < 76 | C (Cukup) |
| nilai < 61 | Perlu Perbaikan |

## Hasil Keluaran Program

```text
============================================================
  MODUL HITUNG NILAI - SISTEM PENJUALAN BERAS BSM
  Mata Kuliah: Pemrograman Aplikasi Bergerak
============================================================

--- Daftar Komponen Penilaian ---
1. Katalog Produk (Bobot: 20%, Skor: 90)
2. Keranjang & Checkout (Bobot: 25%, Skor: 88)
3. Konfirmasi Pembayaran (Bobot: 20%, Skor: 85)
4. Status Pesanan & Resi (Bobot: 15%, Skor: 93)
5. Login & Hak Akses (Bobot: 20%, Skor: 80)

Rata-rata Tertimbang: 86.95

Predikat Akhir: A (Sangat Baik)
============================================================
```

Data komponen adalah data contoh: skor berskala 0-100 dan bobot berjumlah 100. Rata-rata dihitung secara tertimbang, yaitu jumlah(skor x bobot) dibagi jumlah(bobot).

## Refleksi

Bagian sintaks Dart yang paling perlu saya waspadai adalah mengambil nilai dari Map<String, Object>, karena tipe Object tidak bisa langsung dihitung sehingga setiap nilai harus dikonversi eksplisit dengan as. Versi awal saya mengonversi skor menjadi int yang akan gagal saat program berjalan jika skor ditulis desimal, sehingga versi akhir memakai num lalu toDouble. Saya juga menyadari bahwa kunci bobot harus benar-benar dipakai dalam perhitungan, sebab rata-rata awal yang mengabaikan bobot menghasilkan angka yang tidak sebanding dengan rentang predikat.