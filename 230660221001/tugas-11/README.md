# Tugas 11 — Integrasi Fitur Perangkat (Kamera & Galeri)

## Identitas
- **Nama:** Ghatan Zalfaa Kautsar
- **NIM:** 230660221001
- **Mata Kuliah:** Pemrograman Aplikasi Bergerak (PAB)
- **Domain:** Sistem Penjualan Beras di Pabrik BSM

## Dependency
- `image_picker: ^1.1.2`

## Cara Menjalankan
1. `flutter pub get`
2. `flutter run -d chrome` (atau emulator Android).
3. Klik "Pilih dari Galeri" untuk membuka file picker.

## Batasan Platform
Pengujian dilakukan di target web (Chrome). Pada target web, pemilihan foto menggunakan dialog file browser. Fitur kamera langsung (`ImageSource.camera`) membutuhkan perangkat fisik (Android/iOS) yang memiliki kamera.