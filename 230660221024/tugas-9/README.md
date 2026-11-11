# Tugas 9 — Implementasi Konsumsi REST API

- **Nama:** Ridho Akmal Aulia
- **NIM:** 230660221024
- **Kelas:** SI-VIIB
- **Domain Sistem:** Aplikasi Absensi Organisasi Mahasiswa
- **Tenggat:** Sebelum Pertemuan 10

## Deskripsi Singkat

Tugas ini mengimplementasikan integrasi REST API pada aplikasi Absensi Organisasi Mahasiswa. Aplikasi kini dapat berkomunikasi dengan server (menggunakan API simulasi `jsonplaceholder`) untuk mengambil daftar kegiatan (HTTP `GET`) dan mengirim data kegiatan baru (HTTP `POST`). 

Sesuai dengan prinsip arsitektur perangkat lunak, logika jaringan dipisahkan ke dalam lapisan *Service* (`service-api.dart`). Antarmuka (`halaman-api.dart`) dibangun untuk menangani tiga kondisi wajib: *Loading* (indikator putar saat mengambil data), *Sukses* (menampilkan daftar), dan *Error* (menampilkan pesan kegagalan beserta tombol "Coba Lagi" saat jaringan terputus).

## Daftar Berkas

1. **`service-api.dart`** — Berisi model data `DataKegiatan` (dengan `fromJson` dan `toJson`) dan class `KegiatanService` yang menangani `http.get` dan `http.post` lengkap dengan *error handling* dan *timeout*.
2. **`halaman-api.dart`** — Berisi antarmuka `HalamanApi` (manajemen state loading/sukses/error) dan `FormTambahKegiatan`.
3. **`catatan-integrasi-api.md`** — Tabel endpoint API, struktur model, dan strategi penanganan error.
4. **`screenshot-loading.png`** — Bukti tampilan saat indikator loading berputar.
5. **`screenshot-sukses.png`** — Bukti tampilan saat data berhasil dimuat dari server.
6. **`screenshot-error.png`** — Bukti tampilan saat simulasi kegagalan jaringan (misal URL salah).
7. **`README.md`** — Dokumentasi ini.

## Cara Menjalankan Aplikasi

Aplikasi ini dapat dijalankan menggunakan Flutter SDK (target Web/Chrome) atau DartPad (dengan menggabungkan kedua file Dart).

1. Buka project Flutter (`aplikasi-pab`).
2. Pastikan package `http` sudah ditambahkan di `pubspec.yaml` (`http: ^1.2.0`), lalu jalankan `flutter pub get`.
3. Salin kode dari `service-api.dart` dan `halaman-api.dart` ke dalam `lib/main.dart` (pastikan `runApp` memanggil `HalamanApi`).
4. Jalankan perintah berikut di terminal:
   ```bash
   flutter run -d chrome