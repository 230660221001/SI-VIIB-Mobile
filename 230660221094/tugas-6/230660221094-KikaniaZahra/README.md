# Tugas 6 — Navigasi dan Interaksi SIPUSKAM

## Identitas Mahasiswa

- **Nama:** Kikania Zahra
- **NIM:** 230660221094
- **Mata Kuliah:** Pemrograman Aplikasi Bergerak (PAB)
- **Tugas:** Pertemuan 6 — Navigasi dan Interaksi

## Deskripsi Aplikasi

SIPUSKAM merupakan aplikasi perpustakaan kampus berbasis Flutter yang menyediakan tampilan daftar buku, informasi detail buku, dan form penambahan data buku. Aplikasi ini menerapkan navigasi ant halaman serta interaksi berupa pengiriman argumen, validasi form, dan umpan balik kepada pengguna.

## Fitur

1. Menampilkan daftar buku.
2. Membuka halaman detail buku yang dipilih.
3. Mengirimkan data buku melalui argumen navigasi.
4. Menampilkan form untuk menambahkan buku.
5. Memvalidasi kolom pada form.
6. Mengembalikan hasil dari form ke halaman sebelumnya.
7. Menampilkan notifikasi melalui SnackBar setelah proses berhasil.

*Catatan: Cantumkan fitur yang benar-benar sudah diterapkan dan diuji pada kode.*

## Struktur Berkas

```text
tugas-6/
└── <nim>-<nama>/
    ├── README.md
    ├── navigation-flow.md
    ├── form-interaksi.dart
    ├── screenshot-alur.png
    ├── screenshot-feedback.png
    └── catatan-keputusan-navigasi.md
```

## Cara Menjalankan Aplikasi

1. Pastikan Flutter SDK telah terpasang.
2. Buka proyek SIPUSKAM melalui VS Code.
3. Pastikan file implementasi berada pada lokasi yang sesuai.
4. Jalankan aplikasi melalui terminal dengan perintah:

   ```bash
   flutter run -d chrome
   ```

5. Uji navigasi menuju detail buku dan form tambah buku.
6. Periksa validasi form serta notifikasi setelah data berhasil dikirim.

## Dokumentasi Screenshot

- **screenshot-alur.png:** Bukti halaman detail buku yang menampilkan data buku yang dipilih.
- **screenshot-feedback.png:** Bukti umpan balik setelah form berhasil dikirim, berupa SnackBar.

## Refleksi

1. Tantangan utama dalam pengerjaan tugas ini adalah menjaga kesesuaian antara nama rute, halaman yang dituju, dan data yang dikirim melalui navigasi.
2. Pemeriksaan argumen dan validasi form diperlukan agar aplikasi dapat menangani masukan pengguna secara lebih terstruktur.
3. Melalui tugas ini, saya memahami bahwa dokumentasi alur, keputusan implementasi, dan kode harus konsisten agar navigasi serta interaksi aplikasi mudah diuji.

## Deklarasi Penggunaan AI

AI digunakan sebagai alat bantu untuk memahami konsep navigasi Flutter, menyusun dokumentasi, dan memeriksa struktur implementasi. Kode dan dokumentasi akhir perlu diperiksa serta disesuaikan dengan implementasi aplikasi yang benar-benar dibuat dan diuji oleh mahasiswa.