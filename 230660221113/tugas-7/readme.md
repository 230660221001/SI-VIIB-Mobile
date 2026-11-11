# FasKampus

## 1. Deskripsi Aplikasi

FasKampus merupakan aplikasi berbasis Flutter yang dirancang untuk membantu mahasiswa dan organisasi kampus mengajukan peminjaman fasilitas kampus untuk kegiatan seperti seminar, rapat, workshop, dan kegiatan organisasi lainnya.

Aplikasi ini dikembangkan sebagai proyek mata kuliah **Pemrograman Aplikasi Bergerak** dengan menggunakan bahasa pemrograman Dart dan framework Flutter.

## 2. Identitas Mahasiswa

- **Nama:** Muhammad Andre Nugraha
- **NIM:** 230660221113
- **Program Studi:** Sistem Informasi
- **Fakultas:** Teknologi Informasi
- **Mata Kuliah:** Pemrograman Aplikasi Bergerak
- **Nama Aplikasi:** FasKampus

## 3. Tujuan Pengembangan

Tujuan pengembangan FasKampus adalah:

1. Mempermudah proses pengajuan peminjaman fasilitas kampus.
2. Menyediakan formulir untuk memasukkan data pengajuan.
3. Menerapkan operasi CRUD (*Create, Read, Update, Delete*).
4. Memahami pengelolaan data menggunakan Dart dan Flutter.
5. Mengembangkan antarmuka aplikasi yang sederhana dan mudah digunakan.

## 4. Fitur Aplikasi

Fitur yang dikembangkan pada tahap ini meliputi:

- Menampilkan daftar fasilitas kampus.
- Mengisi formulir pengajuan peminjaman.
- Menambahkan data pengajuan.
- Menampilkan daftar pengajuan yang telah dibuat.
- Mengubah informasi dan status pengajuan.
- Menghapus pengajuan melalui dialog konfirmasi.
- Menampilkan status pengajuan, yaitu Menunggu, Disetujui, dan Ditolak.

## 5. Teknologi yang Digunakan

- **Framework:** Flutter
- **Bahasa Pemrograman:** Dart
- **IDE:** Visual Studio Code
- **Pengelolaan Kode:** Git dan GitHub
- **Penyimpanan Data:** List di dalam memori aplikasi untuk tahap pengembangan saat ini.

## 6. Struktur File

Struktur file utama yang digunakan dalam proyek ini adalah:

```text
lib/
├── main.dart
├── halaman_utama.dart
├── crud_lokal.dart
├── form-interaksi.dart
└── data_pengajuan.dart
```

Keterangan:

| File | Fungsi |
|---|---|
| `main.dart` | Titik awal untuk menjalankan aplikasi FasKampus. |
| `halaman_utama.dart` | Menampilkan halaman utama dan daftar fasilitas kampus. |
| `crud_lokal.dart` | Mengelola daftar pengajuan melalui operasi CRUD lokal. |
| `form-interaksi.dart` | Menyediakan formulir untuk memasukkan data pengajuan. |
| `data_pengajuan.dart` | Mendefinisikan model data pengajuan. |

## 7. Model Data

Data pengajuan menggunakan class `Data