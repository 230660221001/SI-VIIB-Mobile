## 1. Arsitektur

Aplikasi mobile menjadi antarmuka yang digunakan mahasiswa untuk mencari buku dan mengajukan peminjaman. Penyimpanan lokal dapat menyimpan data sementara atau data yang perlu tersedia di perangkat. Backend Sistem Informasi menjadi pusat pengelolaan data buku, anggota, dan transaksi peminjaman agar informasi dapat digunakan bersama oleh mahasiswa dan petugas perpustakaan.

## 2. Kebutuhan dan Alur

Dua kebutuhan Must have adalah mahasiswa dapat melihat katalog buku beserta ketersediaannya, dan mahasiswa dapat mengajukan peminjaman buku yang masih tersedia.

Alurnya dimulai ketika mahasiswa membuka aplikasi dan melihat katalog. Mahasiswa memilih buku, memeriksa detail serta ketersediaannya, lalu membuka formulir peminjaman. Setelah data diisi, sistem memvalidasi pengajuan. Jika data tidak valid atau buku tidak tersedia, sistem menampilkan pesan dan meminta mahasiswa memperbaiki pilihan atau formulir. Jika valid dan buku tersedia, pengajuan dicatat dan aplikasi menampilkan konfirmasi.

## 3. Struktur Komponen

Halaman katalog dapat menggunakan `Scaffold` dengan `AppBar` dan `ListView.builder` untuk menampilkan daftar buku dalam bentuk `Card` atau `ListTile`. Halaman form dapat menggunakan `Scaffold`, `Form`, `TextFormField`, dan tombol untuk mengirim pengajuan. Navigasi dari katalog ke form dapat menggunakan `Navigator.push()` atau `Navigator.pushNamed()`, sedangkan `Navigator.pop()` digunakan untuk kembali ke halaman sebelumnya.

## 4. Data dan State

Model `Buku` dapat memiliki field `id` bertipe `String`, `judul` bertipe `String`, `penulis` bertipe `String`, dan `tersedia` bertipe `bool`. ID membedakan setiap buku, judul dan penulis menjadi informasi katalog, sedangkan `tersedia` menunjukkan apakah buku dapat dipinjam.

Daftar buku dan riwayat peminjaman dapat dikelola pada state menggunakan `StatefulWidget`. Operasi Create menambahkan data transaksi peminjaman ke daftar riwayat setelah form valid dan buku tersedia. Operasi Read menampilkan katalog atau riwayat melalui `ListView.builder`. Setelah data berubah, aplikasi memanggil `setState()` agar tampilan diperbarui.
