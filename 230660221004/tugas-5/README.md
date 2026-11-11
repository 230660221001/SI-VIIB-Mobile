# Tugas 5 — Prototype UI/UX (PresentGo)

**Nama:** RIAN R
**NIM:** 230660221004

## Deskripsi Tugas

Dokumen ini berisi prototype UI/UX untuk PresentGo, melanjutkan domain absensi organisasi PT Kencana Makmur Lestari dan dokumen kebutuhan Tugas 4. Isinya mencakup information architecture (6 layar, layar utama Halaman Beranda), wireframe low fidelity 2 layar dengan anotasi kebutuhan dan keadaan kosong, implementasi layar utama di Flutter dengan tema terpusat, serta catatan keputusan UI/UX yang merujuk pada kebutuhan dan persona dari Tugas 4.

## Refleksi

Bagian yang paling sulit dipertahankan konsistensinya adalah antara wireframe dan kode Flutter, karena wireframe awal hanya menggambar kotak "ringkasan hari ini" secara umum tanpa menentukan apakah itu berbentuk kartu tunggal atau daftar. Saat menulis `halaman-utama.dart`, keputusan itu harus diambil ulang (menjadi `ListView.builder` dengan `Card` per kategori status), sehingga wireframe perlu ditinjau kembali agar anotasinya tetap menjelaskan widget yang benar-benar dipakai. Proses bolak-balik antara wireframe dan kode inilah yang lebih menyita waktu dibandingkan menyusun information architecture atau catatan keputusan.

## Deklarasi Penggunaan AI

Deklarasi penggunaan AI: Claude (Anthropic) — membantu menyusun draf information architecture, wireframe, implementasi layar Flutter, dan catatan keputusan UI/UX berdasarkan domain dan dokumen kebutuhan PresentGo yang sudah ditentukan penulis; keputusan akhir dan implementasi dirumuskan ulang oleh penulis.
