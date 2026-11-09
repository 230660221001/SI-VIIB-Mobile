# Laporan Progress Project UTS (Milestone M4)

| | |
|:--|:--|
| **Nama** | Talitha Ardelia Ivana |
| **NIM** | 230660221114 |
| **Kelas** | SI-VIIB |
| **Domain SI** | Akademik — PKBM Al Qosimmiyah |
| **Judul Aplikasi** | Akademik PKBM Al Qosimmiyah |
| **Tautan Repository** | . |

---

### 2. Ringkasan Eksekutif Project

Aplikasi Akademik PKBM Al Qosimmiyah merupakan aplikasi mobile yang dirancang untuk membantu warga belajar dalam mengakses informasi akademik secara lebih mudah melalui perangkat smartphone. Aplikasi ini berfokus pada kebutuhan siswa atau warga belajar, bukan untuk pengelolaan data oleh admin.

Aplikasi menyediakan beberapa fitur utama, yaitu melihat nilai akademik, melihat jadwal pelajaran, melihat jadwal ujian, serta membuat dan mengelola catatan belajar pribadi. Fitur catatan belajar memungkinkan pengguna menambahkan, melihat, mengubah, dan menghapus catatan. Pengguna juga dapat menyematkan catatan penting agar lebih mudah ditemukan.

Aplikasi dikembangkan menggunakan Flutter dan bahasa pemrograman Dart. Pada tahap MVP, data catatan masih disimpan sementara di dalam memori aplikasi sehingga belum menggunakan database maupun REST API.

### 3. Evaluasi Milestone M1–M3

| Milestone | Target Pengerjaan | Status | Keterangan |
|---|---|---|---|
| M1 – Analisis Kebutuhan | Mengidentifikasi masalah, menentukan pengguna, dan menyusun kebutuhan aplikasi. | Selesai | Kebutuhan aplikasi difokuskan pada warga belajar PKBM Al Qosimmiyah. |
| M2 – Desain UI/UX dan Navigasi | Membuat rancangan tampilan, struktur halaman, dan alur navigasi aplikasi. | Selesai | Terdapat halaman Beranda, Nilai, Pelajaran, Ujian, dan Catatan. |
| M3 – MVP dan CRUD | Mengimplementasikan fitur utama dan pengelolaan data catatan. | Dalam pengembangan | Fitur catatan menggunakan CRUD lokal serta fitur sematkan catatan. |
| M4 – Evaluasi Tengah Semester | Menyusun laporan perkembangan dan melakukan demonstrasi aplikasi. | Sedang dikerjakan | Menyiapkan dokumentasi, bukti tampilan, dan rencana pengembangan berikutnya. |

### 4. Requirements Traceability Matrix

| ID | Kebutuhan Fungsional | Prioritas | Implementasi pada Aplikasi | Status |
|---|---|---|---|---|
| F-01 | Pengguna dapat melihat nilai akademik. | Must | Halaman Nilai Akademik | Sudah dibuat |
| F-02 | Pengguna dapat melihat jadwal pelajaran. | Must | Halaman Jadwal Pelajaran | Sudah dibuat |
| F-03 | Pengguna dapat melihat jadwal ujian. | Must | Halaman Jadwal Ujian | Sudah dibuat |
| F-04 | Pengguna dapat menambahkan catatan belajar. | Must | Form Tambah Catatan | Dalam pengembangan |
| F-05 | Pengguna dapat melihat dan mengubah catatan belajar. | Must | Daftar dan Form Edit Catatan | Dalam pengembangan |
| F-06 | Pengguna dapat menghapus catatan belajar. | Must | Fitur Hapus Catatan | Dalam pengembangan |
| F-07 | Pengguna dapat menyematkan catatan penting. | Should | Fitur Pin Catatan | Dalam pengembangan |

*Catatan: Status pada tabel perlu disesuaikan dengan hasil pengujian aplikasi yang benar-benar sudah berjalan.*

### 5. Bukti Implementasi Aplikasi

Berikut bukti tampilan yang perlu dilampirkan berdasarkan hasil aplikasi yang dijalankan:

**5.1 Halaman Beranda**

Menampilkan halaman utama aplikasi Akademik PKBM Al Qosimmiyah dan akses menuju layanan akademik.

[Sisipkan screenshot halaman Beranda]

**5.2 Halaman Nilai Akademik**

Menampilkan daftar nilai mata pelajaran yang dapat dilihat oleh warga belajar.

[Sisipkan screenshot halaman Nilai]

**5.3 Halaman Jadwal Pelajaran dan Ujian**

Menampilkan informasi jadwal kegiatan pembelajaran dan jadwal ujian.

[Sisipkan screenshot halaman Jadwal Pelajaran dan Jadwal Ujian]

**5.4 Halaman Catatan Belajar**

Menampilkan daftar catatan pribadi yang dapat dikelola oleh pengguna.

[Sisipkan screenshot halaman Catatan]

**5.5 Form Tambah atau Edit Catatan**

Menampilkan formulir untuk mengisi judul dan isi catatan belajar.

[Sisipkan screenshot Form Catatan]

### 6. Kendala Teknis dan Solusi

| No. | Kendala | Solusi |
|---|---|---|
| 1 | Form tambah catatan mengalami kendala ketika menyimpan data. | Memeriksa fungsi penyimpanan, validasi input, dan penggunaan `setState()` agar perubahan data ditampilkan kembali pada halaman. |
| 2 | Navigasi antarhalaman perlu disesuaikan agar seluruh fitur dapat diakses dengan mudah. | Menyesuaikan struktur navigasi dan memastikan setiap menu mengarah ke halaman yang sesuai. |
| 3 | Data catatan masih disimpan di dalam memori aplikasi sehingga belum tersimpan secara permanen. | Menggunakan pengelolaan data lokal pada tahap MVP dan merencanakan integrasi database melalui REST API pada milestone berikutnya. |

### 7. Rencana Pengembangan M5 – REST API

Pada milestone M5, aplikasi akan dikembangkan dengan mengintegrasikan REST API agar data dapat disimpan secara permanen dan diakses kembali ketika aplikasi dibuka.

Rencana endpoint REST API:

| Method | Endpoint | Fungsi |
|---|---|---|
| GET | `/api/nilai` | Mengambil data nilai akademik. |
| GET | `/api/jadwal-pelajaran` | Mengambil data jadwal pelajaran. |
| GET | `/api/jadwal-ujian` | Mengambil data jadwal ujian. |
| GET | `/api/catatan` | Mengambil daftar catatan belajar. |
| POST | `/api/catatan` | Menambahkan catatan baru. |
| PUT | `/api/catatan/{id}` | Mengubah catatan berdasarkan ID. |
| DELETE | `/api/catatan/{id}` | Menghapus catatan berdasarkan ID. |

Selain itu, data catatan akan dikembangkan agar tersimpan di database melalui backend. Fitur penyematan catatan juga akan disimpan sehingga status pin tidak hilang ketika aplikasi dibuka kembali.

### 8. Refleksi

Selama mengembangkan aplikasi Akademik PKBM Al Qosimmiyah, saya mempelajari proses pembuatan aplikasi mobile menggunakan Flutter dan Dart, mulai dari analisis kebutuhan, perancangan tampilan, navigasi, hingga implementasi fitur CRUD. Saya juga menemukan beberapa kendala, terutama pada proses penyimpanan catatan dan pengaturan navigasi. Dari proses tersebut, saya belajar memperbaiki kode dan memahami pengelolaan data pada aplikasi. Selanjutnya, saya akan mengembangkan aplikasi dengan mengintegrasikan REST API agar data dapat tersimpan secara permanen.
