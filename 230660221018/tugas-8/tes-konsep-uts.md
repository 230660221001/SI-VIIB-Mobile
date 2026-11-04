# Tes Konsep UTS — Intan Kartika 230660221018

## Soal 1 — Konsep Aplikasi Bergerak dalam SI

1. **Karakteristik: Mobilitas dan fleksibilitas.**  
   Contoh penerapan: Mahasiswa dapat mengajukan surat melalui smartphone dari mana saja tanpa harus datang ke loket administrasi.

2. **Karakteristik: Memanfaatkan fitur perangkat mobile.**  
   Contoh penerapan: Mahasiswa dapat mengambil foto atau mengunggah dokumen persyaratan menggunakan kamera dan penyimpanan smartphone.

3. **Karakteristik: Kemudahan akses dan interaksi.**  
   Contoh penerapan: Mahasiswa dapat mengisi formulir dan memeriksa status pengajuan melalui tampilan sederhana yang mendukung interaksi sentuh.

## Soal 2 — Dasar Pemrograman Dart

- `List<String> daftarSurat = []`: Membuat daftar kosong yang dapat menyimpan beberapa data bertipe String.
- Parameter `String jenis`: Menerima masukan berupa nama atau jenis surat.
- `jenis.isEmpty`: Memeriksa apakah input kosong agar data tidak valid dapat dicegah.
- `return`: Menghentikan fungsi ketika input kosong sehingga proses penambahan tidak dilanjutkan.
- `daftarSurat.add(jenis)`: Menambahkan jenis surat ke bagian akhir List.
- Perulangan `for`: Mengakses dan menampilkan setiap data berdasarkan indeksnya.

**Kesalahan umum bila validasi `isEmpty` dihapus:**  
Pengguna dapat memasukkan data kosong sehingga daftar surat berisi informasi yang tidak valid dan dapat membingungkan saat ditampilkan.

## Soal 3 — Struktur Flutter dan Widget

- `MaterialApp`: Mengatur konfigurasi utama aplikasi, seperti tema dan navigasi.
- `Scaffold`: Menyediakan struktur dasar halaman aplikasi.
- `AppBar`: Menampilkan bagian atas halaman, seperti judul.
- `Column`: Menyusun widget secara vertikal.
- `Text`: Menampilkan informasi berbentuk teks.
- `ListView.builder`: Menampilkan daftar data secara dinamis dan efisien.

**Masalah bila `ListView.builder` di dalam `Column` tanpa `Expanded`:**  
ListView dapat mengalami error karena tidak memperoleh batas tinggi yang jelas.

**Penyebab:**  
Column tidak memberikan batas tinggi yang sesuai kepada ListView, padahal ListView membutuhkan ruang untuk menampilkan dan melakukan scrolling.

**Perbaikan:**  
Membungkus `ListView.builder` dengan `Expanded` agar menggunakan sisa ruang yang tersedia.

## Soal 4 — Analisis Kebutuhan dan User Flow

**Klasifikasi dan prioritas:**

| No. | Permintaan | Fungsional/Nonfungsional | Prioritas MoSCoW | Alasan |
|:---:|---|---|:---:|---|
| 1 | Mengajukan surat keterangan aktif kuliah | Fungsional | Must | Fungsi utama aplikasi untuk mengirim pengajuan surat. |
| 2 | Melihat status pengajuan | Fungsional | Must | Mahasiswa perlu mengetahui perkembangan pengajuan. |
| 3 | Menerima notifikasi saat surat siap diambil | Fungsional | Should | Memudahkan pengguna memperoleh informasi, tetapi bukan proses utama pengajuan. |

Ketiga permintaan tersebut termasuk kebutuhan fungsional karena menjelaskan layanan yang harus disediakan aplikasi. Kebutuhan nonfungsional dapat berupa keamanan data, kemudahan penggunaan, dan kecepatan akses.

**User flow untuk kebutuhan Must:**

1. Mahasiswa membuka aplikasi.
2. Memilih menu pengajuan surat.
3. Memilih surat keterangan aktif kuliah.
4. Mengisi formulir pengajuan.
5. Mengirim formulir setelah memeriksa data.
6. Sistem memvalidasi dan menyimpan pengajuan.
7. Mahasiswa melihat status pengajuan.

## Soal 5 — UI/UX Mobile

1. **Prinsip: Desain responsif.**  
   Keputusan desain: Menggunakan daftar vertikal atau kartu yang menampilkan nama surat, status, dan tombol ajukan.  
   Alasan: Tampilan lebih mudah dibaca pada layar smartphone yang terbatas.

2. **Prinsip: Kemudahan interaksi.**  
   Keputusan desain: Menggunakan tombol dengan ukuran dan jarak yang cukup untuk disentuh.  
   Alasan: Mengurangi kesalahan ketika pengguna memilih atau menekan tombol.

3. **Prinsip: Efisiensi dan konsistensi.**  
   Keputusan desain: Menyediakan pencarian serta tampilan item yang seragam.  
   Alasan: Pengguna dapat menemukan jenis surat dengan cepat tanpa memeriksa seluruh daftar satu per satu.

## Soal 6 — Navigasi dan Interaksi

**Metode navigasi dan kapan digunakan:**

- `push`: Membuka halaman baru menggunakan route secara langsung, misalnya dari daftar ke form pengajuan.
- `pushNamed`: Berpindah halaman berdasarkan nama route yang sudah didaftarkan pada `MaterialApp`.
- `pop`: Menutup halaman saat ini dan kembali ke halaman sebelumnya.

**Pengiriman data jenis surat ke halaman form:**  
Data dapat dikirim melalui parameter constructor halaman atau menggunakan `arguments` pada `Navigator.pushNamed()`. Dengan demikian, form dapat menampilkan jenis surat yang dipilih mahasiswa.

**Feedback setelah form dikirim:**  
Sistem menampilkan `SnackBar` berisi pesan seperti "Pengajuan berhasil dikirim". Selanjutnya, mahasiswa dapat diarahkan ke halaman detail status untuk melihat perkembangan pengajuan.

## Soal 7 — Model Data dan State

**Mengapa setiap field bersifat `final`:**  
Agar nilai atribut tidak berubah secara langsung setelah objek dibuat sehingga data lebih konsisten.

**Mengapa `id` wajib ada:**  
ID menjadi identitas unik setiap pengajuan sehingga data dapat ditemukan, diperbarui, atau dihapus dengan tepat.

**Perbedaan StatelessWidget dan StatefulWidget:**

- `StatelessWidget` digunakan untuk tampilan yang tidak memiliki perubahan state internal.
- `StatefulWidget` digunakan untuk tampilan yang datanya dapat berubah selama aplikasi berjalan.

**Halaman daftar menggunakan:** `StatefulWidget`.

**Alasan:**  
Daftar pengajuan dapat berubah ketika pengguna menambahkan, mengubah, atau menghapus data.

**Fungsi `setState`:**  
Memberi tahu Flutter bahwa data berubah sehingga tampilan perlu diperbarui.

**Apa yang terjadi bila data ditambah tanpa `setState`:**  
Data dapat masuk ke List, tetapi perubahan tersebut tidak langsung ditampilkan pada layar karena widget tidak diperintahkan untuk melakukan rebuild.

## Soal 8 — CRUD Lokal

| Operasi | Method List / mekanisme |
|:---|:---|
| Create | `add()` untuk menambahkan data. |
| Read | Mengakses data List dan menampilkannya dengan `ListView.builder`. |
| Update | `indexWhere()` untuk mencari data berdasarkan ID, kemudian memperbarui elemennya. |
| Delete | `removeWhere()` untuk menghapus data berdasarkan ID. |

**Mengapa id digunakan sebagai kunci update dan delete:**  
ID bersifat unik sehingga sistem dapat menemukan data yang tepat meskipun urutan daftar berubah.

**Konsekuensi bila index digunakan sebagai kunci:**  
Posisi data dapat berubah setelah penambahan atau penghapusan. Akibatnya, sistem berisiko memperbarui atau menghapus data yang salah.

## Soal 9 — Persistensi Data Lokal

**Perbedaan in-memory dan persistensi:**

- **In-memory:** Data disimpan sementara dalam memori aplikasi, misalnya menggunakan List pada state. Data akan hilang ketika aplikasi ditutup.
- **Shared Preferences:** Menyimpan data sederhana secara lokal sehingga data tetap tersedia setelah aplikasi ditutup dan dibuka kembali.

**Mengapa operasi shared_preferences asinkron (Future):**  
Karena proses membaca dan menyimpan data melibatkan akses penyimpanan perangkat yang membutuhkan waktu.

**Apa yang terjadi bila await diabaikan:**  
Instruksi berikutnya dapat berjalan sebelum proses penyimpanan selesai sehingga data belum tentu tersedia ketika langsung digunakan.

**Contoh situasi in-memory sudah cukup:**  
Saat membuat prototipe atau latihan CRUD yang hanya membutuhkan data selama aplikasi berjalan.

**Contoh situasi persistensi mutlak diperlukan:**  
Saat aplikasi harus mempertahankan riwayat pengajuan agar tetap dapat dilihat setelah aplikasi ditutup. Untuk data yang perlu diakses bersama oleh mahasiswa dan petugas, diperlukan penyimpanan backend.

## Soal 10 — Integrasi Konsep Lintas Pertemuan

### 1. Arsitektur

Aplikasi menggunakan Flutter sebagai antarmuka pengguna, penyimpanan lokal untuk data sementara, dan backend Sistem Informasi sebagai pengelola data utama.

Alur hubungan komponen:

```text
Mahasiswa
    |
    v
Aplikasi Mobile Flutter
    |
    +---- Penyimpanan Lokal
    |
    v
Backend Sistem Informasi
    |
    v
Database Perpustakaan
```

Aplikasi mobile berkomunikasi dengan backend melalui API agar data buku dan transaksi peminjaman dapat dikelola secara terpusat.

### 2. Kebutuhan & Alur

**Dua kebutuhan Must have:**

1. Melihat katalog buku beserta informasi ketersediaannya.
2. Mengajukan peminjaman buku melalui formulir.

**Alur pengguna:**

1. Mahasiswa membuka aplikasi.
2. Memilih menu katalog buku.
3. Memilih buku yang tersedia.
4. Membuka detail buku.
5. Memilih tombol pinjam.
6. Mengisi dan mengirim formulir.
7. Sistem memvalidasi data dan menampilkan konfirmasi peminjaman.

### 3. Struktur Komponen

Halaman utama terdiri atas `MaterialApp`, `Scaffold`, dan `AppBar`. Halaman katalog menggunakan `ListView.builder` untuk menampilkan daftar buku, sedangkan halaman form menggunakan `TextFormField` dan tombol untuk mengisi serta mengirim data.

Navigasi dari katalog ke form menggunakan `Navigator.pushNamed()` dengan mengirimkan data buku melalui `arguments`. `Navigator.pop()` digunakan untuk kembali ke halaman sebelumnya.

### 4. Data & State

Contoh model data Buku:

```dart
class Buku {
  const Buku({
    required this.id,
    required this.judul,
    required this.penulis,
    required this.kategori,
    required this.status,
  });

  final String id;
  final String judul;
  final String penulis;
  final String kategori;
  final String status;
}
```

Operasi **Create** digunakan untuk menambahkan transaksi peminjaman ke dalam List setelah formulir berhasil dikirim. Operasi **Read** digunakan untuk menampilkan katalog buku dan riwayat peminjaman menggunakan `ListView.builder`.

Pengelolaan perubahan data dilakukan menggunakan `setState()` agar tampilan diperbarui setelah terjadi penambahan transaksi. Pada pengembangan selanjutnya, data dapat disimpan melalui backend agar riwayat peminjaman dapat diakses secara terpusat.