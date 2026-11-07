# Laporan Progress UTS — FasKampus

## 2.1 Identitas Mahasiswa

| Keterangan | Identitas |
|---|---|
| Nama | Muhammad Andre Nugraha |
| NIM | 230660221113 |
| Kelas | SI-VIIB |
| Program Studi | Sistem Informasi |
| Fakultas | Teknologi Informasi |
| Mata Kuliah | Pemrograman Aplikasi Bergerak |
| Nama Aplikasi | FasKampus |
| Repository GitHub | https://github.com/PBWFEND/SI-VIIB-Mobile |
| Folder Pengumpulan | `tugas-8/` |

## 2.2 Ringkasan Eksekutif

FasKampus merupakan aplikasi berbasis Flutter yang dirancang untuk membantu mahasiswa dan organisasi kampus dalam mencari informasi serta mengajukan peminjaman fasilitas kampus. Aplikasi ini dikembangkan sebagai solusi atas proses peminjaman fasilitas yang sebelumnya masih dilakukan secara manual, sehingga mahasiswa perlu menghubungi atau datang langsung kepada pihak kampus untuk memperoleh informasi fasilitas dan mengajukan peminjaman.

Selama Pertemuan 1 sampai 7, pengembangan FasKampus telah melalui beberapa tahap, mulai dari penentuan ide aplikasi, analisis kebutuhan, perancangan antarmuka, navigasi dan interaksi, hingga pengelolaan data menggunakan CRUD lokal. Pada tahap MVP awal, aplikasi sudah memiliki halaman daftar fasilitas, formulir peminjaman, model data pengajuan, serta fitur tambah, tampil, ubah, dan hapus data. Meskipun demikian, aplikasi masih menggunakan data lokal di dalam memori dan belum terhubung dengan database atau backend. Beberapa fitur yang direncanakan, seperti pemeriksaan benturan jadwal dan pengelolaan pengajuan oleh admin, masih menjadi bagian pengembangan berikutnya.

## 2.3 Status Milestone

| Milestone | Target Pengerjaan | Status | Hasil yang Sudah Dicapai |
|---|---|---|---|
| M1 — Analisis Kebutuhan | Menentukan masalah, pengguna, kebutuhan fungsional dan nonfungsional, prioritas MoSCoW, serta user flow. | Selesai | Tersedia dokumen kebutuhan FasKampus, dua user persona, daftar kebutuhan F-01 sampai F-08, kebutuhan nonfungsional, prioritas MoSCoW, dan diagram user flow. |
| M2 — UI/UX | Membuat Information Architecture, wireframe, keputusan desain, dan implementasi halaman utama. | Selesai | Tersedia Information Architecture, wireframe, catatan keputusan UI, serta halaman daftar fasilitas dengan kartu informasi, warna aplikasi, dan tombol pengajuan. |
| M3 — MVP Awal | Mengimplementasikan navigasi, form interaksi, model data, dan CRUD lokal. | Sebagian | Form peminjaman, validasi input, feedback SnackBar, model `DataPengajuan`, serta operasi Create, Read, Update, dan Delete sudah tersedia. Integrasi antarlayar dan penyimpanan permanen masih perlu dikembangkan. |

**Keterangan status:**

- Selesai: target utama pada milestone telah dikerjakan.
- Sebagian: sebagian fungsi sudah tersedia, tetapi masih terdapat bagian yang perlu diperbaiki atau dikembangkan.

## 2.4 Pemetaan Kebutuhan ke Implementasi

| ID | Kebutuhan Fungsional | Prioritas | Implementasi pada FasKampus | Status |
|---|---|---|---|---|
| F-01 | Mahasiswa dapat melihat daftar fasilitas kampus beserta informasi ringkas. | Must Have | Tersedia pada `halaman_utama.dart`, menampilkan nama fasilitas, lokasi, kapasitas, deskripsi, dan status ketersediaan. | Selesai |
| F-02 | Mahasiswa dapat melihat detail fasilitas yang dipilih. | Should Have | Informasi fasilitas ditampilkan melalui kartu pada halaman utama, tetapi belum tersedia halaman detail fasilitas tersendiri. | Sebagian |
| F-03 | Mahasiswa dapat mengajukan peminjaman fasilitas dengan mengisi data yang diperlukan. | Must Have | Form peminjaman tersedia pada `form-interaksi.dart` dengan pilihan fasilitas, tanggal, jam mulai, jam selesai, dan tujuan. | Selesai |
| F-04 | Sistem dapat memeriksa benturan jadwal sebelum pengajuan dikirim. | Must Have | Validasi input form sudah tersedia, tetapi pemeriksaan benturan jadwal antarpengajuan belum diimplementasikan. | Belum |
| F-05 | Mahasiswa dapat melihat status pengajuan dan alasan penolakan. | Should Have | Status Menunggu, Disetujui, dan Ditolak tersedia pada data pengajuan dan ditampilkan dalam halaman CRUD. Halaman status khusus serta alasan penolakan belum tersedia. | Sebagian |
| F-06 | Admin dapat melihat daftar dan rincian pengajuan yang masuk. | Must Have | Belum tersedia dashboard khusus admin untuk mengelola pengajuan mahasiswa. | Belum |
| F-07 | Admin dapat menyetujui atau menolak pengajuan dengan alasan penolakan. | Must Have | Perubahan status tersedia melalui fitur ubah data, tetapi belum terdapat proses persetujuan khusus berdasarkan hak akses admin. | Sebagian |
| F-08 | Mahasiswa dapat melihat riwayat pengajuan beserta tanggal dan status. | Could Have | Data pengajuan dapat ditampilkan dalam daftar CRUD lokal, tetapi belum tersedia halaman riwayat khusus yang terhubung dengan akun mahasiswa. | Sebagian |

**Catatan:** Status implementasi di atas menggambarkan kondisi kode proyek saat ini. Fitur yang masih direncanakan tidak dihitung sebagai fitur yang sudah berjalan.

## 2.5 Bukti Implementasi / Screenshot

Bukti implementasi digunakan untuk menunjukkan tampilan dan interaksi aplikasi FasKampus. Screenshot yang disiapkan meliputi:

### 1. Screenshot Daftar Pengajuan — `screenshot-daftar.png`

Menunjukkan halaman CRUD lokal yang menampilkan data pengajuan peminjaman fasilitas. Screenshot ini dapat menggunakan gambar yang sudah tersedia pada Tugas 7, yaitu `screenshot-daftar.png`.

### 2. Screenshot Form Peminjaman — `screenshot-form.png`

Menunjukkan halaman formulir peminjaman fasilitas yang berisi pilihan fasilitas, tanggal penggunaan, jam mulai, jam selesai, dan tujuan peminjaman.

Screenshot ini perlu diambil dari aplikasi yang sedang dijalankan. Simpan hasilnya dengan nama `screenshot-form.png`.

### 3. Screenshot Hapus Data — `screenshot-hapus.png`

Menunjukkan proses penghapusan data pengajuan melalui dialog konfirmasi atau tampilan daftar setelah data berhasil dihapus. Screenshot ini dapat menggunakan gambar yang sudah tersedia pada Tugas 7, yaitu `screenshot-hapus.png`.

**Lokasi penyimpanan screenshot:**

```text
tugas-8/
├── screenshot-daftar.png
├── screenshot-form.png
└── screenshot-hapus.png
```

Screenshot harus berasal dari hasil menjalankan aplikasi, bukan gambar rancangan wireframe. Pastikan tulisan dan informasi pada gambar masih dapat dibaca.

## 2.6 Kendala Teknis dan Solusi

Selama proses pengembangan FasKampus dari Pertemuan 1 sampai 7, terdapat beberapa kendala teknis yang perlu diselesaikan.

### Kendala 1 — Konfigurasi Flutter dan Android SDK

**Masalah:**

Pada awal pengembangan, perintah `flutter` belum dapat dikenali melalui terminal. Selain itu, konfigurasi Android SDK sempat mengalami masalah karena lokasi SDK menggunakan direktori yang memiliki spasi dan beberapa direktori SDK dipindahkan ke lokasi baru.

**Solusi:**

Melakukan pemeriksaan lokasi Flutter SDK dan Android SDK, kemudian menyesuaikan environment variable serta PATH agar direktori `bin` Flutter, `platform-tools`, dan `cmdline-tools` dapat dikenali oleh terminal. Pemeriksaan dilakukan kembali menggunakan perintah `flutter doctor` dan `where`.

### Kendala 2 — Import File dan Konstanta Warna

**Masalah:**

Pada saat pengembangan beberapa halaman, muncul error seperti `Target of URI doesn't exist` karena nama atau lokasi file yang diimpor tidak sesuai. Pernah juga muncul error `Undefined name 'merahAkademik'` karena konstanta warna belum tersedia pada file yang menggunakannya.

**Solusi:**

Memeriksa kembali nama file, lokasi file, dan penulisan import agar sesuai dengan struktur proyek. Konstanta warna juga didefinisikan pada file yang tepat atau disiapkan agar dapat diakses oleh halaman yang membutuhkannya.

### Kendala 3 — Pengelolaan Data Update dan Delete

**Masalah:**

Pada implementasi awal CRUD, operasi tambah sudah dapat dilakukan, tetapi operasi ubah dan hapus belum berjalan sesuai harapan. Salah satu hal yang perlu diperhatikan adalah pemilihan data yang benar ketika daftar pengajuan berubah.

**Solusi:**

Menggunakan `id` sebagai identitas setiap pengajuan. Untuk operasi Update, aplikasi mencari posisi data menggunakan `indexWhere()` berdasarkan id, kemudian mengganti data pada posisi yang ditemukan. Untuk operasi Delete, aplikasi menggunakan `removeWhere()` berdasarkan id. Setelah data berubah, `setState()` dipanggil agar tampilan diperbarui.

## 2.7 Rencana Pengembangan M5 — Integrasi REST API

Pada tahap berikutnya, FasKampus direncanakan untuk dikembangkan dengan menghubungkan aplikasi Flutter ke backend menggunakan REST API. Pengembangan ini bertujuan agar data fasilitas dan pengajuan tidak hanya tersimpan di dalam memori aplikasi, tetapi dapat dikelola secara terpusat.

Rencana pengembangan meliputi:

1. **Menyiapkan backend dan database**

   Menyiapkan layanan backend serta database untuk menyimpan data fasilitas, data mahasiswa, dan data pengajuan peminjaman.

2. **Mengambil data fasilitas melalui REST API**

   Mengubah sumber data fasilitas yang sebelumnya ditulis langsung di dalam kode menjadi data yang diperoleh dari server menggunakan HTTP request.

3. **Mengirim data pengajuan ke server**

   Menghubungkan formulir peminjaman dengan endpoint API agar data yang dikirim mahasiswa dapat disimpan pada database backend.

4. **Mengambil status dan riwayat pengajuan**

   Mengambil data pengajuan dari server agar mahasiswa dapat melihat perkembangan dan riwayat peminjaman secara lebih terstruktur.

5. **Mengembangkan pengelolaan admin**

   Menyiapkan endpoint dan fitur admin untuk melihat pengajuan, memeriksa jadwal, serta menyetujui atau menolak permintaan peminjaman.

6. **Menangani proses asinkron**

   Menggunakan `Future`, `async`, dan `await` ketika melakukan komunikasi dengan API agar proses pengambilan dan pengiriman data dapat ditangani dengan baik.

Dengan pengembangan tersebut, FasKampus diharapkan dapat berkembang dari prototype CRUD lokal menjadi aplikasi peminjaman fasilitas kampus yang dapat menggunakan data secara terpusat.

## 2.8 Refleksi Pembelajaran

Selama mengerjakan FasKampus dari Pertemuan 1 sampai 7, saya memahami bahwa pembuatan aplikasi mobile tidak hanya berfokus pada tampilan, tetapi juga membutuhkan analisis kebutuhan, perancangan alur pengguna, navigasi, dan pengelolaan data. Saya juga mendapatkan pengalaman menggunakan Flutter dan Dart untuk membuat halaman aplikasi, mengelola form, serta menerapkan operasi CRUD menggunakan List dan setState. Dalam proses pengerjaan, saya menemukan beberapa kendala seperti konfigurasi SDK, kesalahan import file, dan pengelolaan data yang kemudian dipelajari cara penyelesaiannya. Ke depannya, saya ingin mengembangkan FasKampus dengan REST API agar data pengajuan dapat tersimpan secara permanen dan dapat dikelola secara terpusat.

## 2.9 Pernyataan Penggunaan AI

Dalam proses pengerjaan proyek FasKampus, saya menggunakan bantuan AI sebagai pendukung pembelajaran dan pengembangan proyek. Bantuan tersebut digunakan untuk memahami materi Flutter dan Dart, mencari penyebab error pada kode, memberikan saran perbaikan implementasi, serta membantu menyusun dan meninjau dokumentasi proyek.

Penggunaan AI tidak menggantikan proses memahami dan memeriksa hasil pekerjaan. Kode dan dokumentasi tetap perlu saya pelajari, sesuaikan, serta uji kembali agar saya dapat menjelaskan fungsi dan cara kerja aplikasi ketika dilakukan evaluasi oleh dosen.