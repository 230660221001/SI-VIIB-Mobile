# PustakaKu — Prototype UI/UX Flutter

## 1. Deskripsi Proyek

PustakaKu merupakan prototype aplikasi perpustakaan kampus yang dikembangkan menggunakan Flutter. Aplikasi ini dirancang untuk membantu pengguna melihat katalog buku, mencari buku berdasarkan judul atau penulis, serta mengetahui status ketersediaan buku.

Prototype ini berfokus pada halaman katalog buku sebagai halaman utama aplikasi. Pengembangan dilakukan dengan memperhatikan struktur informasi, konsistensi komponen, keterbacaan, dan kemudahan penggunaan.

## 2. Fitur Halaman Utama

Fitur yang ditampilkan pada halaman utama meliputi:

- **Identitas aplikasi:** menampilkan nama PustakaKu.
- **Katalog buku:** menampilkan daftar buku yang tersedia pada prototype.
- **Informasi buku:** menampilkan judul, penulis, dan status ketersediaan.
- **Kolom pencarian:** menyediakan antarmuka untuk mencari buku berdasarkan judul atau penulis.
- **Status ketersediaan:** membedakan buku yang tersedia dan sedang dipinjam.
- **Tombol pengajuan peminjaman:** menyediakan akses menuju tindakan pengajuan peminjaman.

Catatan: keberadaan elemen pada antarmuka tidak otomatis berarti seluruh fungsinya telah terimplementasi. Fungsi pencarian dan pengajuan peminjaman perlu diverifikasi melalui pengujian aplikasi.

## 3. Teknologi yang Digunakan

- **Flutter:** framework untuk membangun antarmuka aplikasi.
- **Dart:** bahasa pemrograman yang digunakan dalam pengembangan.
- **Material Design 3:** sistem desain untuk menjaga konsistensi komponen antarmuka.

## 4. Struktur Berkas

```text
pustakaku/
├── lib/
│   ├── main.dart
│   ├── halaman-utama.dart
│   └── halaman_aplikasi.dart
├── information-architecture.md
├── catatan-keputusan-ui.md
├── wireframe.png
├── screenshot-halaman.png
└── README.md
```

Keterangan:
- `main.dart`: titik awal aplikasi dan konfigurasi tema.
- `halaman-utama.dart`: implementasi halaman utama PustakaKu.
- `halaman_aplikasi.dart`: berkas halaman katalog dari implementasi sebelumnya.
- `information-architecture.md`: dokumentasi struktur informasi dan alur pengguna.
- `catatan-keputusan-ui.md`: dokumentasi alasan pemilihan desain UI/UX.
- `wireframe.png`: rancangan awal antarmuka.
- `screenshot-halaman.png`: dokumentasi hasil tampilan aplikasi.

## 5. Cara Menjalankan Aplikasi

Pastikan Flutter dan Google Chrome sudah tersedia di perangkat.

1. Buka terminal pada folder utama proyek.
2. Jalankan perintah berikut untuk mengambil dependensi:

   ```bash
   flutter pub get
   ```

3. Jalankan aplikasi menggunakan Chrome:

   ```bash
   flutter run -d chrome
   ```

4. Tunggu hingga aplikasi terbuka di browser.

## 6. Refleksi

Melalui tugas ini, saya memahami bahwa perancangan UI/UX perlu memperhatikan struktur informasi, konsistensi tampilan, dan kebutuhan pengguna. Penggunaan Flutter dan Material Design 3 membantu saya menyusun komponen antarmuka secara lebih terstruktur. Saya juga memahami bahwa prototype perlu diuji untuk memastikan setiap elemen antarmuka berfungsi sesuai dengan tujuan perancangannya.

## 7. Deklarasi Penggunaan AI

Dalam pengerjaan tugas ini, saya menggunakan bantuan AI sebagai pendamping untuk menyusun dokumentasi, memahami keputusan desain UI/UX, dan membantu pengembangan kode prototype. Saya tetap perlu memeriksa, memahami, dan menyesuaikan hasil yang digunakan dengan implementasi aplikasi serta ketentuan tugas.

