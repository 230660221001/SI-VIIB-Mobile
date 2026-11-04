
# Dokumen Kebutuhan Aplikasi Akademik PKBM Al Qosimmiyah

**Nama:** Talitha Ardelia Ivana  
**NIM:** 230660221114  
**Kelas:** SI-VIIB  
**Domain SI:** Akademik — PKBM Al Qosimmiyah

## 1. Deskripsi Aplikasi

Aplikasi Akademik PKBM Al Qosimmiyah merupakan aplikasi mobile yang dirancang untuk membantu peserta didik memperoleh informasi akademik secara lebih praktis. Pengguna membutuhkan akses yang mudah terhadap nilai akademik, jadwal pelajaran, dan jadwal ujian tanpa harus mencari informasi tersebut secara terpisah atau menunggu informasi disampaikan secara langsung. Aplikasi mobile dipilih karena dapat diakses melalui ponsel, sehingga peserta didik dapat memeriksa informasi akademik kapan saja dan di mana saja selama perangkat tersedia. Selain itu, aplikasi menyediakan tampilan informasi dalam bentuk halaman, kartu, dan daftar agar lebih mudah dibaca.

## 2. User Persona

### Persona 1 — Alya — Peserta Didik

| Komponen | Isi |
|:---------|:----|
| Nama dan peran | Alya — Peserta didik PKBM Al Qosimmiyah |
| Tujuan | Melihat nilai akademik, jadwal pelajaran, dan jadwal ujian dengan mudah. |
| Kendala | Tidak selalu mengingat jadwal pelajaran dan ujian serta membutuhkan akses cepat terhadap informasi nilai. |
| Perangkat dan konteks | Menggunakan ponsel Android saat berada di rumah, di lingkungan PKBM, atau ketika mempersiapkan kegiatan belajar. |
| Frekuensi penggunaan | Beberapa kali dalam seminggu, terutama sebelum belajar, saat memeriksa nilai, dan menjelang ujian. |

### Persona 2 — Ibu Rina — Admin Akademik

| Komponen | Isi |
|:---------|:----|
| Nama dan peran | Ibu Rina — Admin akademik PKBM Al Qosimmiyah |
| Tujuan | Membantu memastikan informasi nilai, jadwal pelajaran, dan jadwal ujian tersedia serta dapat diakses peserta didik. |
| Kendala | Perlu memastikan informasi yang disampaikan konsisten dan mengurangi pertanyaan berulang dari peserta didik mengenai informasi akademik. |
| Perangkat dan konteks | Menggunakan ponsel atau komputer saat mengelola administrasi akademik di lingkungan PKBM. |
| Frekuensi penggunaan | Secara rutin pada hari kerja dan ketika terdapat pembaruan informasi akademik. |

*Catatan: Persona admin merupakan gambaran kebutuhan peran yang direncanakan. Jika aplikasi saat ini hanya memiliki tampilan peserta didik, fitur pengelolaan admin dapat ditempatkan pada prioritas pengembangan berikutnya.*

## 3. Kebutuhan Fungsional

| ID | Rumusan Kebutuhan | Terkait Persona |
|:---|:------------------|:----------------|
| F-01 | Peserta didik dapat membuka halaman beranda untuk melihat ringkasan informasi akademik. | Persona 1 |
| F-02 | Peserta didik dapat melihat daftar nilai akademik untuk mengetahui hasil belajar setiap mata pelajaran. | Persona 1 |
| F-03 | Peserta didik dapat melihat jadwal pelajaran untuk mengetahui hari, jam, dan mata pelajaran yang berlangsung. | Persona 1 |
| F-04 | Peserta didik dapat melihat jadwal ujian untuk mengetahui tanggal dan waktu pelaksanaan ujian. | Persona 1 |
| F-05 | Peserta didik dapat memilih mata pelajaran untuk melihat informasi nilai yang berkaitan dengan mata pelajaran tersebut. | Persona 1 |
| F-06 | Peserta didik dapat kembali ke halaman beranda dari halaman informasi akademik agar dapat memilih fitur lain. | Persona 1 |
| F-07 | Admin akademik dapat memperbarui informasi nilai, jadwal pelajaran, dan jadwal ujian agar informasi yang ditampilkan tetap sesuai dengan data terbaru. | Persona 2 |
| F-08 | Peserta didik dapat melihat keterangan ketika informasi nilai atau jadwal belum tersedia agar mengetahui kondisi data yang ditampilkan. | Persona 1 |

## 4. Kebutuhan Nonfungsional

| ID | Kategori | Rumusan | Kriteria Terukur |
|:---|:---------|:--------|:-----------------|
| NF-01 | Kegunaan | Aplikasi harus memiliki navigasi yang mudah dipahami peserta didik. | Pengguna dapat mencapai halaman Nilai Akademik, Jadwal Pelajaran, atau Jadwal Ujian maksimal dalam 3 kali tindakan dari halaman beranda. |
| NF-02 | Kinerja | Aplikasi harus menampilkan informasi akademik dengan waktu tunggu yang wajar. | Pada kondisi pengujian normal, halaman yang menggunakan data lokal tampil maksimal 3 detik setelah dibuka. |
| NF-03 | Kompatibilitas | Aplikasi harus dapat digunakan pada perangkat Android yang didukung. | Seluruh halaman utama dapat dibuka dan digunakan pada perangkat Android dengan resolusi layar minimal 360 × 640 piksel tanpa elemen utama terpotong. |
| NF-04 | Kegunaan | Informasi akademik harus mudah dibaca. | Setiap halaman utama menampilkan judul yang jelas dan informasi dalam susunan konsisten, tanpa teks utama terpotong pada ukuran layar pengujian. |

## 5. Prioritas Fitur (MoSCoW)

| Prioritas | ID Kebutuhan | Alasan |
|:----------|:-------------|:-------|
| Must have | F-01, F-02, F-03, F-04 | Beranda, nilai, jadwal pelajaran, dan jadwal ujian merupakan fitur inti yang memenuhi kebutuhan utama peserta didik. |
| Should have | F-05, F-08 | Pemilihan mata pelajaran dan keterangan ketika data belum tersedia membantu peserta didik memahami informasi yang ditampilkan. |
| Could have | F-06 | Navigasi kembali ke beranda meningkatkan kenyamanan penggunaan, tetapi dapat disempurnakan setelah fitur inti tersedia. |
| Won't have (saat ini) | F-07 | Pengelolaan data oleh admin belum menjadi fokus versi awal apabila aplikasi hanya berupa prototipe tampilan peserta didik. Fitur ini dapat dikembangkan pada tahap selanjutnya ketika mekanisme pengelolaan dan pembaruan data sudah direncanakan. |

## 6. Pemetaan Kebutuhan ke Antarmuka

| ID Kebutuhan | Rumusan (ringkas) | Prioritas | Halaman yang Memenuhi | Widget yang Direncanakan (P3) |
|:-------------|:------------------|:----------|:----------------------|:-----------------------------|
| F-01 | Melihat ringkasan informasi akademik | Must | Beranda | `Scaffold` + `AppBar` + `Column` + `Card` |
| F-02 | Melihat daftar nilai akademik | Must | Nilai Akademik | `Scaffold` + `AppBar` + `ListView.builder` + `Card` |
| F-03 | Melihat jadwal pelajaran | Must | Jadwal Pelajaran | `Scaffold` + `AppBar` + `ListView.builder` + `ListTile` |
| F-04 | Melihat jadwal ujian | Must | Jadwal Ujian | `Scaffold` + `AppBar` + `ListView.builder` + `Card` |
| F-05 | Memilih mata pelajaran untuk melihat nilai | Should | Nilai Akademik | `ListView.builder` + `ListTile` + `Card` |
| F-06 | Kembali ke halaman beranda | Could | Seluruh halaman informasi akademik | `Scaffold` + `AppBar` + `NavigationBar` |
| F-07 | Admin memperbarui informasi akademik | Won't have (saat ini) | Halaman Pengelolaan Admin (rencana pengembangan) | `Scaffold` + `AppBar` + `Column` + `ListView.builder` |
| F-08 | Melihat keterangan ketika data belum tersedia | Should | Nilai Akademik, Jadwal Pelajaran, dan Jadwal Ujian | `Scaffold` + `Column` + `Card` |