# Tugas 3 — FasKampus

**Nama:** Muhammad Andre Nugraha  
**NIM:** 230660221113  
**Program Studi:** Sistem Informasi  
**Mata Kuliah:** Pengembangan Aplikasi Bergerak

## 1. Deskripsi Aplikasi

FasKampus merupakan aplikasi berbasis Flutter yang dirancang untuk membantu mahasiswa melihat informasi fasilitas kampus dengan lebih mudah. Aplikasi ini menampilkan ringkasan fasilitas, fitur pencarian, filter kategori, dan daftar fasilitas seperti ruang kelas, aula kampus, proyektor, serta sound system.

## 2. Fitur Aplikasi

- Menampilkan halaman utama FasKampus.
- Menampilkan banner informasi fasilitas kampus.
- Menampilkan ringkasan jumlah dan ketersediaan fasilitas.
- Menyediakan kolom pencarian fasilitas.
- Menyediakan filter kategori fasilitas.
- Menampilkan daftar fasilitas kampus.
- Menampilkan navigasi bawah untuk Beranda, Fasilitas, Riwayat, dan Profil.

## 3. Struktur Widget

Aplikasi dibuat menggunakan Flutter dengan struktur utama `MaterialApp`, `HalamanAplikasi`, dan `Scaffold`. Pada bagian isi halaman digunakan beberapa widget layout, seperti `SafeArea`, `ListView`, `Column`, `Row`, `Stack`, dan `Padding`.

Diagram struktur widget dapat dilihat pada file `widget-tree.png`, sedangkan kode sumber diagram disimpan pada file `widget-tree.mmd`.

## 4. Cara Menjalankan Aplikasi

Pastikan Flutter SDK telah terpasang dan perangkat atau browser untuk menjalankan aplikasi tersedia.

Jalankan perintah berikut melalui terminal pada direktori proyek Flutter:

```bash
flutter pub get
flutter run -d chrome
```

Jika ingin menjalankan aplikasi melalui perangkat Android atau emulator, gunakan:

```bash
flutter devices
flutter run
```

## 5. Daftar File Tugas

- `halaman_aplikasi.dart` — kode sumber halaman utama FasKampus.
- `widget-tree.png` — gambar diagram struktur widget.
- `widget-tree.mmd` — kode sumber diagram Mermaid.
- `screenshot-halaman.png` — tangkapan layar aplikasi saat dijalankan.
- `README.md` — dokumentasi tugas.

## 6. Refleksi

Melalui tugas ini, saya belajar menyusun tampilan aplikasi Flutter menggunakan widget dan memahami hubungan antara widget induk dengan widget anak. Saya juga belajar menggunakan widget layout seperti `Column`, `Row`, `Stack`, dan `ListView` untuk menyusun elemen antarmuka agar lebih teratur. Kesulitan yang saya temui adalah menyesuaikan susunan widget dengan desain halaman, tetapi hal tersebut membantu saya lebih memahami struktur dasar aplikasi Flutter.