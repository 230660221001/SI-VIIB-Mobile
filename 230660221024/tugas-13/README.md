# Tugas 13 — Testing, Debugging, dan Perbaikan

- **Nama:** Ridho Akmal Aulia
- **NIM:** 230660221024
- **Kelas:** SI-VIIB

## Deskripsi
Proyek ini mendemonstrasikan proses *testing* (pengujian) dan *debugging* (perbaikan bug) pada form Absensi Organisasi Mahasiswa. Terdapat bug bawaan (data ganda jika tombol ditekan 2x) yang telah diperbaiki dan diverifikasi menggunakan *widget test*.

## Cara Menjalankan
1. Pastikan Anda berada di direktori project ini.
2. Jalankan `flutter pub get`.
3. Jalankan aplikasi: `flutter run -d chrome`.
4. Jalankan pengujian otomatis: `flutter test`.
5. Jalankan analisis kode: `flutter analyze`.

## Daftar Berkas
- `lib/main.dart` — Kode UI yang sudah diperbaiki dari bug.
- `test/widget_test.dart` — Kode pengujian otomatis.
- `test-case.md` — 8 skenario pengujian manual.
- `bug-report.md` — Laporan bug yang berhasil diperbaiki.
- `refleksi.md` — Refleksi dan deklarasi AI.