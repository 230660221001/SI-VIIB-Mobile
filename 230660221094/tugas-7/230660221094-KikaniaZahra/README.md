# Tugas 7 — SIPUSKAM

## Deskripsi Aplikasi

Tugas 7 merupakan implementasi awal aplikasi SIPUSKAM yang menerapkan pengelolaan data lokal menggunakan Flutter. Pada tugas ini, aplikasi menggunakan model `DataBuku` untuk mengelola informasi buku yang meliputi ID, judul, penulis, kategori, dan status. Fitur yang diimplementasikan mencakup penambahan data (Create), penampilan daftar data (Read), pembaruan data (Update), serta penghapusan data (Delete) dengan dialog konfirmasi.

## Fitur yang Diimplementasikan

- **Create:** Menambahkan data buku melalui formulir.
- **Read:** Menampilkan daftar buku menggunakan `ListView.builder`.
- **Update:** Mengubah status buku berdasarkan ID.
- **Delete:** Menghapus data berdasarkan ID setelah konfirmasi pengguna.

## Penyimpanan Data

Data disimpan sementara dalam memori aplikasi dan belum menggunakan penyimpanan persisten. Oleh karena itu, data yang ditambahkan atau diubah dapat hilang ketika aplikasi dimulai ulang.

## Refleksi

1. Saya memahami bahwa model data membantu mengelompokkan atribut agar pengelolaan data dalam aplikasi menjadi lebih terstruktur.
2. Saya mempelajari penerapan operasi CRUD menggunakan `setState`, `ListView.builder`, `indexWhere`, dan `removeWhere` pada Flutter.
3. Saya memahami bahwa penyimpanan data dalam memori bersifat sementara sehingga penyimpanan persisten dapat dipertimbangkan untuk pengembangan aplikasi selanjutnya.

## Deklarasi Penggunaan AI

Saya menggunakan ChatGPT sebagai alat bantu untuk memahami konsep CRUD lokal, menyusun struktur kode, dan menyiapkan dokumentasi tugas. Kode dan dokumentasi perlu saya periksa serta sesuaikan dengan implementasi aplikasi dan pemahaman saya sendiri.