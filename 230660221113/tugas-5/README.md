# FasKampus — Layanan Fasilitas Kampus

FasKampus merupakan prototype aplikasi berbasis mobile yang dirancang untuk membantu mahasiswa mencari informasi fasilitas kampus, mengajukan peminjaman fasilitas, dan memantau status pengajuan. Aplikasi ini dikembangkan menggunakan Flutter dengan bahasa pemrograman Dart.

## 1. Tujuan Proyek

Proyek ini bertujuan menghasilkan rancangan antarmuka aplikasi layanan fasilitas kampus yang sederhana, mudah dipahami, dan sesuai dengan kebutuhan pengguna.

FasKampus memiliki dua jenis pengguna:

* **Mahasiswa:** mencari fasilitas, mengajukan peminjaman, serta memantau status dan riwayat pengajuan.
* **Admin:** memeriksa pengajuan yang masuk dan menentukan persetujuan atau penolakan peminjaman.

## 2. Teknologi yang Digunakan

* **Flutter:** framework untuk pengembangan antarmuka aplikasi.
* **Dart:** bahasa pemrograman yang digunakan dalam pengembangan aplikasi.
* **Material Design:** dasar komponen antarmuka aplikasi.

## 3. Fitur Prototype

Fitur yang telah tersedia pada halaman utama:

* Menampilkan daftar fasilitas kampus.
* Menampilkan ringkasan jumlah jenis fasilitas dan fasilitas yang tersedia.
* Mencari fasilitas berdasarkan nama atau lokasi.
* Memfilter fasilitas berdasarkan kategori.
* Menampilkan informasi lokasi, jumlah, dan status fasilitas.
* Menampilkan feedback menggunakan SnackBar.
* Menyediakan navigasi bawah untuk Beranda, Fasilitas, Pengajuan, dan Profil.

## 4. Struktur Information Architecture

Rancangan aplikasi terdiri dari tujuh layar berdasarkan kebutuhan fungsional:

| ID         | Nama Layar                         | Prioritas   |
| ---------- | ---------------------------------- | ----------- |
| F-01       | Beranda / Daftar Fasilitas         | Must have   |
| F-02       | Detail Fasilitas                   | Should have |
| F-03, F-04 | Form Peminjaman                    | Must have   |
| F-05       | Status Pengajuan                   | Should have |
| F-06       | Dashboard Admin / Detail Pengajuan | Must have   |
| F-07       | Detail Pengajuan Admin             | Must have   |
| F-08       | Riwayat Peminjaman                 | Could have  |

Pada Tugas 5, implementasi Flutter difokuskan pada layar Beranda / Daftar Fasilitas. Layar lainnya menjadi bagian dari rancangan IA untuk pengembangan selanjutnya.

## 5. Struktur File Pendukung

Dokumen dan aset perancangan yang digunakan dalam proyek ini:

* `README.md` — dokumentasi proyek.
* `wireframe.png` — wireframe minimal dua layar, yaitu Beranda dan Status Pengajuan.
* `catatan-keputusan-ui.md` — dokumentasi alasan dan keputusan desain antarmuka.
* `halaman_aplikasi.dart` — implementasi halaman utama aplikasi Flutter.

*Catatan: `halaman_aplikasi.dart` merupakan file kode aplikasi dan ditempatkan di direktori sumber proyek Flutter sesuai struktur proyek yang digunakan.*

## 6. Cara Menjalankan Aplikasi

Pastikan Flutter SDK telah terpasang dan perangkat atau emulator telah tersedia.

1. Buka terminal pada direktori utama proyek Flutter.

2. Jalankan perintah berikut untuk memeriksa instalasi Flutter:

   ```bash
   flutter doctor
   ```

3. Unduh dependensi proyek:

   ```bash
   flutter pub get
   ```

4. Jalankan aplikasi:

   ```bash
   flutter run
   ```

Jika file `halaman_aplikasi.dart` belum menjadi halaman utama aplikasi, sesuaikan pemanggilannya melalui `lib/main.dart` berdasarkan struktur proyek.

## 7. Batasan Prototype

Prototype ini masih menggunakan data fasilitas contoh yang disimpan secara langsung dalam kode. Data belum terhubung dengan database atau backend.

Fitur pengajuan peminjaman, pemeriksaan benturan jadwal, autentikasi pengguna, pengelolaan pengajuan oleh admin, dan riwayat peminjaman belum diimplementasikan sepenuhnya.

Beberapa tombol dan menu masih memberikan feedback demonstrasi, sehingga belum dapat dianggap sebagai fitur operasional.

## 8. Pengembangan Selanjutnya

Pengembangan berikutnya direncanakan mencakup:

1. Pembuatan layar Detail Fasilitas.
2. Implementasi formulir peminjaman.
3. Pemeriksaan benturan jadwal peminjaman.
4. Pembuatan layar Status Pengajuan dan Riwayat Peminjaman.
5. Pembuatan dashboard admin dan fitur persetujuan pengajuan.
6. Integrasi database dan backend.
7. Penyempurnaan navigasi serta pengujian antarmuka.

## 9. Status Proyek

**Tahap:** Prototype antarmuka — Tugas 5.

**Fokus saat ini:** Information Architecture, wireframe, dokumentasi keputusan UI, dan implementasi halaman utama Flutter.

## 10. Penutup

FasKampus dikembangkan sebagai prototype layanan fasilitas kampus yang mengutamakan kemudahan pencarian fasilitas dan kejelasan informasi. Rancangan dan implementasi akan dikembangkan secara bertahap berdasarkan kebutuhan fungsional serta hasil evaluasi antarmuka.
