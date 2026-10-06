# Tugas 3 — Halaman Aplikasi Sederhana

## Identitas
- **Nama:** Ghatan Zalfaa Kautsar
- **NIM:** 230660221001
- **Mata Kuliah:** Pemrograman Aplikasi Bergerak (PAB)
- **Pertemuan:** 3
- **Domain:** Sistem Penjualan Beras di Pabrik BSM

## Nama Aplikasi
**Sistem Penjualan Beras BSM**

## Deskripsi Halaman
Halaman ini menampilkan katalog produk beras yang dijual oleh Pabrik BSM. Pengguna dapat melihat daftar beras beserta kualitas, harga per kilogram, dan status ketersediaan stok. Halaman ini menjadi titik awal bagi konsumen untuk memilih produk sebelum melakukan pemesanan. Tampilan menggunakan layout `Column` untuk menyusun sapaan dan daftar produk secara vertikal, `Row` untuk menyusun ikon, informasi produk, dan status stok dalam satu baris, serta `ListView.builder` untuk menampilkan daftar produk secara efisien.

## Cara Menjalankan
```bash
flutter run -d chrome

## Langkah-Langkah Pengerjaan

### Langkah 1: Buat File di Komputer Anda

1. Buka VS Code.
2. Buat file `halaman_aplikasi.dart` dan `README.md` di folder `230660221001\tugas-3\`.
3. Salin kode di atas ke masing-masing file.

### Langkah 2: Jalankan dan Ambil Screenshot

1. Salin isi `halaman_aplikasi.dart` ke `lib/main.dart` di project Flutter Anda (atau buat project baru dengan `flutter create pab_tugas3`).
2. Jalankan:
   ```powershell
   flutter run -d chrome