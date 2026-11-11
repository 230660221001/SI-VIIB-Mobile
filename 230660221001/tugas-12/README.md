# Tugas 12 — Validasi dan Keamanan Praktis

## Identitas
- **Nama:** Ghatan Zalfaa Kautsar
- **NIM:** 230660221001
- **Mata Kuliah:** Pemrograman Aplikasi Bergerak (PAB)

## Dependency
- `flutter_secure_storage: ^9.2.2` (Untuk penyimpanan token yang aman)
- `http: ^1.2.0`

## Cara Menjalankan
1. `flutter pub get`
2. `flutter run -d chrome`

## Batasan Keamanan
- API yang digunakan pada tugas ini masih berupa simulasi (belum terhubung ke backend asli).
- `flutter_secure_storage` pada platform web menggunakan enkripsi berbasis browser (WebCrypto), sehingga keamanannya bergantung pada keamanan browser pengguna.
- Pesan error telah disamarkan agar tidak membocorkan *stack trace* atau detail internal server.

## Deklarasi Penggunaan AI
Deklarasi penggunaan AI: Claude — membantu menyusun pola validasi form dan struktur *security checklist*; aturan data, pengujian, dan logika keamanan diverifikasi oleh penulis.