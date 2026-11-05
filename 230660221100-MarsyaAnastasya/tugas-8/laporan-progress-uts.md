# Laporan Progress Project UTS (Milestone M4)

| | |
|:--|:--|
| **Nama** | Marsya Anastasya |
| **NIM** | 230660221100 |
| **Kelas** | SI-VIIB |
| **Domain SI** | Layanan Pelaporan dan Pengelolaan Fasilitas Fakultas |
| **Judul Aplikasi** | Lapor Fasilitas FTI |
| **Tautan Repository** | - |

---

## 1. Ringkasan Eksekutif Project

Lapor Fasilitas FTI merupakan aplikasi mobile yang dirancang untuk membantu proses pelaporan kerusakan fasilitas di lingkungan Fakultas Teknologi Informasi. Aplikasi ini dibuat karena proses pelaporan kerusakan fasilitas membutuhkan sarana yang memudahkan mahasiswa atau pengguna fasilitas dalam menyampaikan laporan, sekaligus membantu petugas fasilitas dalam memantau dan menangani laporan yang masuk.

Aplikasi ini memiliki dua jenis pengguna, yaitu Pelapor dan Petugas Fasilitas Fakultas. Pelapor dapat membuat laporan dengan mengisi jenis fasilitas, lokasi, dan deskripsi kerusakan, serta melihat perkembangan status laporan. Petugas dapat melihat daftar laporan masuk, membuka detail laporan, dan memperbarui status penanganan. Solusi berbasis mobile dipilih karena dapat memudahkan pengguna mengakses layanan pelaporan melalui perangkat yang digunakan sehari-hari.

## 2. Ketercapaian Milestone (M1 s.d. M3)

| Milestone | Deliverable | Status (Selesai / Sebagian) | Catatan / Bukti |
|:----------|:------------|:----------------------------|:----------------|
| M1: Kebutuhan | Dokumen kebutuhan dan User Flow | Selesai | Dokumen kebutuhan fungsional dan nonfungsional serta User Flow pada Tugas 4. |
| M2: UI/UX | Wireframe dan Navigasi | Selesai | Rancangan antarmuka pada Tugas 5 dan alur navigasi pada Tugas 6. |
| M3: MVP Awal | Model data dan CRUD lokal | Selesai | Implementasi model `DataLaporan` dan operasi CRUD lokal pada Tugas 7 melalui file `crud-lokal.dart`. |

## 3. Matriks Kebutuhan ke Implementasi

| ID Kebutuhan | Deskripsi Kebutuhan | Prioritas MoSCoW | Halaman Pemenuh | Operasi Data Terkait |
|:-------------|:-------------------|:----------------:|:----------------|:---------------------|
| F-01 | Pelapor dapat mengirim laporan kerusakan dengan mengisi jenis fasilitas, lokasi, deskripsi, dan melampirkan foto jika tersedia. | Must | Form Laporan | Create |
| F-02 | Pelapor dapat melampirkan video sebagai bukti jika diperlukan. | Could | Form Laporan | Create |
| F-03 | Petugas dapat melihat daftar laporan kerusakan yang masuk. | Must | Laporan Masuk | Read |
| F-04 | Petugas dapat membuka detail laporan untuk melihat fasilitas, lokasi, deskripsi, dan lampiran jika tersedia. | Must | Detail Laporan Petugas | Read |
| F-05 | Petugas dapat mengubah status laporan menjadi Dikerjakan ketika penanganan dimulai. | Should | Detail Laporan Petugas / Form Status | Update |
| F-06 | Petugas dapat mengubah status menjadi Selesai setelah perbaikan dan melampirkan foto bukti perbaikan jika tersedia. | Must | Detail Laporan Petugas / Form Status | Update |
| F-07 | Pelapor dapat melihat status terbaru dari laporan yang telah dikirim. | Must | Beranda dan Detail Laporan Pelapor | Read |
| F-08 | Pelapor mendapatkan notifikasi ketika status laporan berubah. | Should | Notifikasi | Belum diimplementasikan |
| F-09 | Petugas mendapatkan notifikasi ketika laporan baru masuk. | Should | Notifikasi Petugas | Belum diimplementasikan |
| F-10 | Petugas mendapatkan pengingat jika laporan masih berstatus Menunggu setelah satu hari. | Should | Pengingat Petugas | Belum diimplementasikan |

**Catatan:** Fitur pemilihan dan pengunggahan file foto maupun video belum diterapkan secara nyata karena keterbatasan lingkungan DartPad. Struktur model data sudah menyediakan field lampiran yang diperlukan, tetapi tombol lampiran masih berupa simulasi. Notifikasi dan pengingat otomatis juga belum tersedia pada MVP lokal.

## 4. Tangkapan Layar Aplikasi Berjalan

Tangkapan layar berikut digunakan untuk menunjukkan implementasi aplikasi:

1. **`screenshot-daftar.png`** — Menampilkan halaman daftar laporan yang sudah berisi data.
2. **`screenshot-form.png`** — Menampilkan halaman form pengisian laporan beserta validasi input.
3. **`screenshot-hapus.png`** — Menampilkan dialog konfirmasi sebelum laporan dihapus.

## 5. Kendala dan Solusi Teknis

| No. | Kendala Teknis | Solusi |
|:---:|:---------------|:-------|
| 1 | Pengelolaan navigasi antarhalaman sempat mengalami kendala karena penggunaan `BuildContext` dan posisi pemanggilan navigasi. | Logika navigasi dipusatkan pada widget utama yang memiliki state agar pemanggilan navigasi menggunakan context yang sesuai. |
| 2 | Penggunaan fitur pemilihan file foto dan video belum dapat diterapkan secara langsung pada lingkungan DartPad. | Tombol lampiran dibuat sebagai simulasi menggunakan pesan `SnackBar`, sedangkan field lampiran tetap disediakan pada model data untuk pengembangan berikutnya. |
| 3 | Data laporan perlu tetap konsisten ketika digunakan oleh Pelapor dan Petugas. | Data laporan dikelola melalui satu sumber data lokal pada widget utama dan perubahan data dilakukan menggunakan `setState`. |

## 6. Rencana Pengembangan Milestone M5 (REST API)

Pada Milestone M5, aplikasi akan dikembangkan dengan menghubungkan aplikasi Flutter ke REST API agar data laporan tidak hanya tersimpan sementara di dalam memori aplikasi. Data yang akan diambil dari backend meliputi daftar laporan, detail laporan, status penanganan, serta informasi waktu pembuatan laporan.

Aplikasi juga direncanakan menggunakan layanan backend untuk menyimpan laporan baru, memperbarui status laporan, dan mengelola lampiran foto atau video. Beberapa endpoint yang dapat disiapkan antara lain:

- `GET /laporan` untuk mengambil daftar laporan.
- `GET /laporan/{id}` untuk mengambil detail laporan.
- `POST /laporan` untuk mengirim laporan baru.
- `PATCH /laporan/{id}/status` untuk memperbarui status laporan.
- Layanan penyimpanan file untuk mengelola lampiran laporan dan bukti perbaikan.

Selain itu, pengembangan berikutnya dapat mencakup autentikasi pengguna, notifikasi perubahan status, notifikasi laporan baru, dan pengingat laporan yang belum ditangani selama satu hari.

## 7. Refleksi Pembelajaran Tengah Semester

Melalui pengerjaan proyek ini, saya memahami bahwa pengembangan aplikasi Flutter membutuhkan keterkaitan antara struktur widget, navigasi, model data, dan pengelolaan state. Penggunaan `StatefulWidget` dan `setState` membantu saya memahami bagaimana perubahan data dapat ditampilkan kembali pada antarmuka aplikasi. Saya juga mempelajari bahwa kebutuhan fungsional harus diterjemahkan menjadi halaman dan operasi data yang sesuai agar setiap fitur memiliki tujuan yang jelas. Tantangan terbesar adalah menjaga konsistensi data ketika aplikasi digunakan oleh dua jenis pengguna dengan hak akses dan alur kerja yang berbeda.

 