# Tugas 6 — Navigation Flow dan Interaksi

- **Nama:** Ridho Akmal Aulia
- **NIM:** 230660221024
- **Kelas:** SI-VIIB
- **Mata Kuliah:** Pemrograman Aplikasi Bergerak
- **Domain Sistem:** Aplikasi Absensi Organisasi Mahasiswa
- **Tenggat:** Sebelum Pertemuan 7

## Deskripsi Singkat

Tugas ini menghubungkan layar-layar aplikasi Absensi Organisasi Mahasiswa menggunakan `Navigator` dengan *route* bernama. Alur dimulai dari Halaman Daftar Kegiatan, berlanjut ke Detail Kegiatan (mengirim data via `arguments`), dan berakhir di Form Check-in. Form dilengkapi dengan validasi input (Nama dan NIM) serta umpan balik (`SnackBar`) setelah kehadiran berhasil dikirim. Layar detail dan form juga dilengkapi dengan tombol kembali (`pop`) untuk memastikan navigasi tidak membingungkan pengguna.

## Berkas Tugas

- `navigation-flow.md` — Daftar route dan diagram alur navigasi.
- `form-interaksi.dart` — Implementasi kode Flutter (navigasi, arguments, form, validasi).
- `screenshot-alur.png` — Bukti navigasi membuka layar detail.
- `screenshot-feedback.png` — Bukti umpan balik SnackBar muncul.
- `catatan-keputusan-navigasi.md` — Tabel keputusan navigasi dan alasan.
- `README.md` — Dokumentasi ini.

## Refleksi (3 Kalimat)

Bagian yang paling sulit dipertahankan konsistensinya adalah memastikan nama *route* pada `Navigator.pushNamed` di kode benar-benar sama persis dengan yang didaftarkan pada peta `routes` di `MaterialApp` (termasuk urusan huruf besar/kecil). Selain itu, memastikan data `arguments` dikirim dan diterima dengan tipe yang tepat agar tidak terjadi *null pointer error* saat layar detail dibuka membutuhkan ketelitian ekstra. Dari proses ini, saya belajar bahwa perancangan alur (navigation flow) sebelum menulis kode sangat membantu mengurangi *bug* navigasi yang membingungkan.

## Deklarasi Penggunaan AI

Deklarasi penggunaan AI: AI coding assistant — membantu menyusun struktur peta `routes`, validasi form, dan penanganan tipe data `arguments`; seluruh alur dan kode ditinjau ulang oleh penulis sesuai dengan rancangan Tugas 5.