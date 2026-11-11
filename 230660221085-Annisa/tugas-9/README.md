# Tugas 9 — Integrasi REST API (Pengajuan Laboratorium)

- **Nama:** Annisa Nur Sabariyah
- **NIM:** 230660221085
- **Kelas:** SI-VIIB
- **Domain Sistem:** Aplikasi Pengajuan Peminjaman Laboratorium

## Deskripsi Singkat

Tugas ini mengimplementasikan konsumsi REST API pada aplikasi pengajuan laboratorium. Aplikasi dapat
berkomunikasi dengan server untuk mengambil daftar pengajuan (HTTP `GET`) dan mengirim pengajuan baru
(HTTP `POST`). Server simulasi yang dipakai adalah `jsonplaceholder` (`https://jsonplaceholder.typicode.com`).

Sesuai arsitektur perangkat lunak, logika jaringan dipisahkan ke lapisan *Service*
(`service-api.dart`), sedangkan antarmuka (`halaman-api.dart`) hanya menangani state dan tampilan.
Antarmuka menangani tiga kondisi wajib: *loading* (indikator putar saat mengambil data), *sukses*
(daftar pengajuan tampil), dan *error* (pesan kegagalan beserta tombol "Coba Lagi"). Form POST
memvalidasi input, menonaktifkan tombol kirim selama proses berlangsung, dan menampilkan umpan balik
berupa *SnackBar*.

## Daftar Berkas

1. **`service-api.dart`** — Model data `DataPengajuan` (dengan `fromJson`) dan `DataPengajuanBaru`
   (dengan `toJson`), serta class `LaboratoriumService` yang menjalankan `http.get` dan `http.post`
   lengkap dengan *timeout* dan penanganan error.
2. **`halaman-api.dart`** — Widget `HalamanApi` yang memuat daftar pengajuan, menampilkan kondisi
   loading/sukses/error, plus form POST pengajuan baru.
3. **`catatan-integrasi-api.md`** — Tabel endpoint API, struktur model, dan strategi penanganan error.
4. **`screenshot-loading.png`** — Bukti tampilan saat indikator loading berputar.
5. **`screenshot-sukses.png`** — Bukti tampilan saat data berhasil dimuat dari server.
6. **`screenshot-error.png`** — Bukti tampilan saat pemanggilan server gagal.
7. **`README.md`** — Dokumentasi ini.

## Cara Menjalankan Aplikasi

Aplikasi berjalan pada Flutter SDK (target web/Chrome atau emulator Android).

1. Buat project Flutter, lalu tambahkan dependency pada `pubspec.yaml`:

   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     http: ^1.2.0
   ```

2. Jalankan `flutter pub get`.
3. Salin `service-api.dart` dan `halaman-api.dart` ke dalam folder `lib/`.
4. Buat `lib/main.dart` berikut:

   ```dart
   import 'package:flutter/material.dart';

   import 'halaman-api.dart';

   void main() {
     runApp(const MaterialApp(
       debugShowCheckedModeBanner: false,
       home: HalamanApi(),
     ));
   }
   ```

5. Jalankan aplikasi:

   ```bash
   flutter run -d chrome      # target web
   flutter run                # emulator / perangkat fisik
   ```

## Strategi Penanganan Error

- **Timeout** — setiap permintaan dibatasi 5 detik. Bila lewat, pesan "Waktu tunggu habis (timeout)."
  ditampilkan.
- **Koneksi gagal** — kegagalan jaringan diterjemahkan menjadi pesan "Gagal memuat data. Periksa
  koneksi internet." atau "Gagal mengirim data. Periksa koneksi internet." pada form POST.
- **Status HTTP tidak sesuai** — kode status dari server ditampilkan apa adanya, misalnya
  "Server merespons status 500."
- **Format data tidak dikenali** — jawaban server yang tidak dapat diparse ditampilkan sebagai
  "Format data dari server tidak dikenali."
- **Pemulihan** — pada kondisi error tersedia tombol "Coba Lagi" yang memanggil ulang proses
  pengambilan data.

## Catatan Teknis

- `jsonplaceholder` tidak menyimpan data POST secara persisten, sehingga daftar yang tampil tidak
  otomatis bertambah setelah pengajuan dikirim. Pada backend nyata, cukup panggil `_muatData()`
  setelah POST berhasil.
- Data ruang dan keterangan dipetakan ke bahasa Indonesia agar sesuai konteks domain aplikasi
  pengajuan laboratorium.
