# Tugas 3 — Halaman Aplikasi Sederhana

**Nama Aplikasi:** Lapor Fasilitas FTI  
**Nama:** Marsya Anastasya
**NIM:** 230660221100

## Deskripsi Halaman

Lapor Fasilitas FTI adalah prototipe aplikasi mobile untuk membantu mahasiswa dan dosen melaporkan kerusakan fasilitas di lingkungan Fakultas Teknologi Informasi. Halaman beranda menampilkan ringkasan jumlah laporan, informasi laporan terbaru, serta navigasi menuju halaman daftar laporan dan panduan penggunaan. Pengguna dapat membuka formulir untuk memilih jenis fasilitas, mengisi lokasi, menjelaskan kerusakan, dan menambahkan laporan ke daftar yang ditampilkan. Data laporan pada prototipe ini dikelola di dalam aplikasi dan belum terhubung ke backend atau database.

## Domain Sistem Informasi

Sistem Pelaporan Kerusakan Fasilitas Fakultas Teknologi Informasi. Domain ini berfokus pada pencatatan dan pemantauan laporan kerusakan fasilitas kampus, seperti AC, proyektor, kursi, dan lampu, beserta status penanganannya.

## Widget Layout yang Digunakan

- `Column` untuk menyusun elemen secara vertikal, misalnya judul dan isi kartu.
- `Row` untuk menyusun elemen secara horizontal, misalnya ringkasan laporan dan informasi pada kartu laporan.
- `ListView` untuk menampilkan konten yang dapat digulir.
- `Padding` untuk memberikan jarak di sekitar konten.

 

## Widget Tree

Diagram struktur widget aplikasi tersedia dalam file `widget-tree.png`, sedangkan sumber diagram Mermaid tersedia dalam file `widget-tree.mmd`. Diagram menggambarkan struktur utama aplikasi, termasuk halaman beranda, navigasi antartab, kartu laporan, dan formulir penambahan laporan.

## Refleksi

Layout yang paling sulit saya rangkai adalah `ListView`, karena konten halaman terdiri dari beberapa bagian yang berbeda dan perlu tetap dapat digulir dengan nyaman. Saya perlu menyusun `Column` dan `Row` di dalam item daftar agar ringkasan laporan, informasi fasilitas, dan status laporan tersaji dengan teratur. Saya juga perlu memperhatikan struktur widget dan batas ruang agar tampilan tetap rapi serta tidak menimbulkan overflow saat dijalankan.