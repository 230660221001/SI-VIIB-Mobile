# Tugas 4 — Analisis Kebutuhan dan User Flow

## Identitas Mahasiswa

| Keterangan      | Detail                                    |
| --------------- | ----------------------------------------- |
| **Nama**        | Kikania Zahra                             |
| **NPM**         | 230660221094                              |
| **Mata Kuliah** | Pemrograman Aplikasi Bergerak (PAB)       |
| **Pertemuan**   | Pertemuan 4                               |
| **Tugas**       | Tugas 4 — Dokumen Kebutuhan dan User Flow |
| **Aplikasi**    | SIPUSKAM                                  |
| **Domain**      | Sistem Informasi Perpustakaan Kampus      |

---

## 1. Deskripsi Tugas

Tugas 4 merupakan bagian dari pembelajaran **Analisis Kebutuhan dan User Flow** pada mata kuliah Pemrograman Aplikasi Bergerak. Pada tugas ini dilakukan analisis terhadap pengguna, kebutuhan fungsional dan nonfungsional, prioritas fitur, serta alur interaksi pengguna sebagai dasar untuk perancangan antarmuka dan pengembangan aplikasi pada tahap berikutnya.

Aplikasi yang dianalisis adalah **SIPUSKAM (Sistem Informasi Perpustakaan Kampus)**. Aplikasi ini ditujukan untuk membantu mahasiswa memperoleh informasi mengenai koleksi buku dan membantu petugas perpustakaan dalam mengelola informasi buku.

---

## 2. Tujuan Tugas

Tujuan pengerjaan Tugas 4 adalah:

1. Mengidentifikasi pengguna aplikasi melalui **user persona**.
2. Menentukan kebutuhan fungsional berdasarkan tujuan dan kendala pengguna.
3. Menentukan kebutuhan nonfungsional yang memiliki kriteria terukur.
4. Menentukan prioritas kebutuhan menggunakan metode **MoSCoW**.
5. Merancang **user flow** berdasarkan tujuan utama pengguna.
6. Memetakan kebutuhan fungsional ke halaman dan widget yang direncanakan.
7. Menghasilkan dokumen analisis yang dapat menjadi dasar untuk perancangan UI/UX pada tahap berikutnya.

---

## 3. Ruang Lingkup Analisis

Analisis pada tugas ini berfokus pada dua jenis pengguna SIPUSKAM, yaitu:

### Mahasiswa

Mahasiswa menggunakan aplikasi untuk:

* melihat daftar koleksi buku;
* mencari buku berdasarkan judul atau kata kunci;
* melihat detail informasi buku;
* mengetahui status ketersediaan buku.

### Petugas Perpustakaan

Petugas menggunakan aplikasi untuk:

* menambahkan data buku;
* mengubah informasi buku;
* mengubah status ketersediaan buku.

---

## 4. Hasil Analisis

### 4.1 User Persona

Analisis menghasilkan dua persona dengan peran berbeda:

* **Rani — Mahasiswa**

  * Membutuhkan informasi koleksi buku.
  * Menggunakan aplikasi untuk mencari buku dan mengetahui ketersediaannya.
  * Menggunakan ponsel dalam konteks aktivitas perkuliahan dan perpustakaan.

* **Dimas — Petugas Perpustakaan**

  * Bertanggung jawab terhadap informasi koleksi buku.
  * Menggunakan aplikasi untuk mengelola data dan status buku.
  * Menggunakan aplikasi secara rutin dalam kegiatan pengelolaan perpustakaan.

---

### 4.2 Kebutuhan Fungsional

Terdapat enam kebutuhan fungsional utama:

| ID       | Kebutuhan                                                          |
| -------- | ------------------------------------------------------------------ |
| **F-01** | Mahasiswa dapat melihat daftar buku yang tersedia di perpustakaan. |
| **F-02** | Mahasiswa dapat melihat detail informasi buku.                     |
| **F-03** | Mahasiswa dapat mencari buku berdasarkan judul atau kata kunci.    |
| **F-04** | Petugas perpustakaan dapat menambahkan data buku.                  |
| **F-05** | Petugas perpustakaan dapat mengubah informasi buku.                |
| **F-06** | Petugas perpustakaan dapat mengubah status ketersediaan buku.      |

---

### 4.3 Kebutuhan Nonfungsional

Kebutuhan nonfungsional yang ditentukan meliputi:

* **NF-01 — Kegunaan:** informasi buku dapat ditemukan dalam maksimal 5 langkah dari halaman utama.
* **NF-02 — Kinerja:** daftar buku ditampilkan dalam waktu maksimal 3 detik pada koneksi internet yang stabil.

---

### 4.4 Prioritas Fitur

Prioritas kebutuhan fungsional menggunakan metode **MoSCoW**:

| Prioritas                 | Kebutuhan                                                    |
| ------------------------- | ------------------------------------------------------------ |
| **Must Have**             | F-01, F-02, F-03, F-04                                       |
| **Should Have**           | F-05, F-06                                                   |
| **Could Have**            | Belum terdapat kebutuhan yang ditempatkan pada kategori ini. |
| **Won't Have (saat ini)** | Belum terdapat kebutuhan yang ditunda pada tahap ini.        |

Prioritas tersebut digunakan untuk membedakan fungsi utama aplikasi dengan fungsi pengelolaan data yang dapat dikembangkan setelah fungsi dasar tersedia.

---

## 5. User Flow

User flow yang dibuat berfokus pada satu tujuan utama:

> **Mahasiswa mencari informasi buku dan mengetahui status ketersediaannya.**

Aktor dalam alur ini adalah **Rani — Mahasiswa**.

Alur memiliki lebih dari delapan langkah dan dua titik keputusan:

1. Mahasiswa membuka aplikasi SIPUSKAM.
2. Sistem menampilkan halaman utama.
3. Mahasiswa memilih menu Daftar Buku.
4. Sistem menampilkan daftar koleksi buku.
5. Mahasiswa memasukkan judul atau kata kunci.
6. Sistem memeriksa apakah buku ditemukan.
7. Jika ditemukan, sistem menampilkan hasil pencarian.
8. Mahasiswa memilih buku.
9. Sistem menampilkan detail buku.
10. Sistem memeriksa status ketersediaan buku.
11. Sistem menampilkan status buku.
12. Mahasiswa mengetahui informasi dan status ketersediaan buku.

Apabila buku tidak ditemukan, pengguna diarahkan kembali ke proses pencarian dengan pesan bahwa buku tidak ditemukan. Apabila buku sedang dipinjam, sistem menampilkan informasi bahwa buku tidak tersedia.

---

## 6. Pemetaan Kebutuhan ke Antarmuka

Setiap kebutuhan fungsional dipetakan ke halaman dan widget yang direncanakan berdasarkan materi Pertemuan 3.

| ID   | Halaman             | Widget yang Direncanakan                             |
| ---- | ------------------- | ---------------------------------------------------- |
| F-01 | Halaman Daftar Buku | `Scaffold`, `AppBar`, `ListView.builder`, `ListTile` |
| F-02 | Halaman Detail Buku | `Scaffold`, `AppBar`, `Column`, `Card`               |
| F-03 | Halaman Daftar Buku | `Scaffold`, `AppBar`, `Column`, `ListView.builder`   |
| F-04 | Halaman Tambah Buku | `Scaffold`, `AppBar`, `Column`, `Row`                |
| F-05 | Halaman Edit Buku   | `Scaffold`, `AppBar`, `Column`, `Row`                |
| F-06 | Halaman Edit Buku   | `Scaffold`, `AppBar`, `Column`, `Row`                |

Widget yang dicantumkan merupakan **rencana awal** dan masih dapat diperhalus pada tahap perancangan antarmuka berikutnya.

---

## 7. Struktur File

File yang dikumpulkan dalam Tugas 4 terdiri dari:

```text
tugas-4/
└── 230660221094-Kikania-Zahra/
    ├── README.md
    ├── dokumen-kebutuhan.md
    └── user-flow.png
```

### `dokumen-kebutuhan.md`

Berisi keseluruhan analisis kebutuhan aplikasi, meliputi:

* deskripsi aplikasi;
* user persona;
* kebutuhan fungsional;
* kebutuhan nonfungsional;
* prioritas fitur MoSCoW;
* user flow;
* daftar langkah user flow;
* pemetaan kebutuhan ke antarmuka;
* checklist pemeriksaan.

### `user-flow.png`

Berisi diagram visual user flow **Mencari Informasi Buku** yang menggambarkan interaksi mahasiswa dari saat membuka SIPUSKAM hingga mengetahui informasi dan status ketersediaan buku.

---

## 8. Keterkaitan dengan Pertemuan Sebelumnya

Tugas 4 melanjutkan hasil analisis dan rancangan dari pertemuan sebelumnya. Domain **SIPUSKAM** tetap digunakan agar kebutuhan, user flow, dan rancangan antarmuka memiliki kesinambungan dengan tugas sebelumnya.

Widget yang digunakan dalam pemetaan kebutuhan mengacu pada materi **Pertemuan 3**, seperti:

* `MaterialApp`;
* `Scaffold`;
* `AppBar`;
* `Column`;
* `Row`;
* `ListView.builder`;
* `ListTile`;
* `Card`.

Pada tahap Tugas 4, widget tersebut masih merupakan rencana pemetaan antarmuka dan belum menjadi keputusan final mengenai desain UI.

---

## 9. Refleksi

Saya memahami bahwa analisis kebutuhan membantu menentukan fungsi aplikasi berdasarkan tujuan dan kendala pengguna sebelum masuk ke tahap perancangan antarmuka. Saya belajar menghubungkan user persona, kebutuhan fungsional, prioritas MoSCoW, dan user flow agar setiap fitur memiliki alasan dan alur penggunaan yang jelas. Melalui tugas ini saya juga memahami pentingnya membuat user flow dengan titik keputusan dan cabang kegagalan agar proses penggunaan aplikasi dapat ditelusuri secara lebih lengkap.

---

## 10. Deklarasi Penggunaan AI

**Deklarasi penggunaan AI:** ChatGPT — digunakan untuk membantu memahami panduan dan template Tugas 4, memberikan masukan terhadap perumusan kebutuhan fungsional dan nonfungsional, membantu mengevaluasi struktur user persona dan MoSCoW, serta memberikan masukan terhadap user flow dan pemetaan kebutuhan ke antarmuka; hasil analisis diperiksa dan dirumuskan ulang oleh penulis.

---

## 11. Checklist Sebelum Pengumpulan

* [x] Identitas mahasiswa dicantumkan.
* [x] Deskripsi aplikasi dicantumkan.
* [x] Dua persona dengan peran berbeda telah dibuat.
* [x] Setiap persona memiliki lima komponen.
* [x] Minimal enam kebutuhan fungsional telah dibuat.
* [x] Minimal dua kebutuhan nonfungsional telah dibuat.
* [x] Seluruh kebutuhan fungsional telah diberikan prioritas MoSCoW.
* [x] Jumlah Must Have tidak lebih dari lima.
* [x] User flow memiliki lebih dari delapan langkah.
* [x] User flow memiliki dua titik keputusan.
* [x] Setiap titik keputusan memiliki cabang gagal.
* [x] Setiap kebutuhan fungsional telah dipetakan ke halaman dan widget.
* [x] `dokumen-kebutuhan.md` telah disiapkan.
* [x] `user-flow.png` telah disiapkan.
* [x] `README.md` telah disiapkan.
* [ ] User flow telah diuji melalui peer review dengan satu teman sekelas.
* [ ] Setelah peer review, hasil pemeriksaan akhir dilakukan sebelum pengumpulan.
