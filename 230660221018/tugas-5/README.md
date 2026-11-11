# SIPORA — Sistem Informasi Pengajuan Observasi dan Riset Akademik

SIPORA merupakan rancangan aplikasi yang bertujuan mempermudah mahasiswa dalam mengajukan surat observasi dan penelitian akademik kepada pihak fakultas. Aplikasi ini dirancang untuk membantu proses pengajuan menjadi lebih terstruktur, memudahkan pemantauan status permohonan, serta menyediakan informasi pengajuan dalam satu antarmuka yang mudah digunakan.

Proyek ini dikembangkan sebagai bagian dari tugas mata kuliah **Pemrograman Aplikasi Bergerak** menggunakan Flutter. Pengembangan dilakukan secara bertahap, mulai dari implementasi antarmuka aplikasi hingga analisis kebutuhan dan perancangan pengalaman pengguna (UI/UX).

## 1. Informasi Proyek

| Komponen            | Keterangan                                              |
| ------------------- | ------------------------------------------------------- |
| Nama aplikasi       | SIPORA                                                  |
| Kepanjangan         | Sistem Informasi Pengajuan Observasi dan Riset Akademik |
| Platform            | Aplikasi web berbasis Flutter                           |
| Bahasa pemrograman  | Dart                                                    |
| Framework           | Flutter                                                 |
| Bidang              | Sistem Informasi Akademik                               |
| Pengguna utama      | Mahasiswa dan petugas fakultas                          |
| Status pengembangan | Prototipe akademik                                      |

## 2. Latar Belakang

Pengajuan surat observasi dan penelitian merupakan salah satu kebutuhan administratif mahasiswa dalam mendukung kegiatan akademik. Proses pengajuan yang belum terstruktur dapat menyulitkan mahasiswa ketika menyampaikan permohonan maupun mengetahui perkembangan status pengajuannya.

SIPORA dirancang sebagai solusi digital yang menyediakan alur pengajuan surat secara lebih terorganisasi. Melalui aplikasi ini, mahasiswa dapat mengisi data pengajuan, mengunggah dokumen persyaratan, dan memantau status permohonan. Di sisi lain, petugas fakultas berperan dalam memeriksa dan memproses pengajuan sesuai prosedur yang berlaku.

## 3. Tujuan Pengembangan

Tujuan pengembangan SIPORA adalah:

1. Menyediakan antarmuka pengajuan surat observasi dan penelitian yang mudah dipahami.
2. Membantu mahasiswa mengetahui status pengajuan secara terstruktur.
3. Mendukung pengelolaan administrasi pengajuan oleh petugas fakultas.
4. Menerapkan prinsip desain antarmuka yang konsisten, informatif, dan berorientasi pada kebutuhan pengguna.
5. Menerapkan konsep dasar pengembangan aplikasi menggunakan Flutter dan Dart.

## 4. Pengguna Aplikasi

### Mahasiswa

Mahasiswa merupakan pengguna yang mengajukan permohonan surat untuk kebutuhan observasi atau penelitian akademik.

Kebutuhan mahasiswa meliputi:

* Mengisi formulir pengajuan surat.
* Memilih jenis surat sesuai kebutuhan.
* Mengunggah dokumen persyaratan.
* Melihat daftar pengajuan yang telah dibuat.
* Memantau status pengajuan.
* Mengakses surat yang telah selesai diproses dalam bentuk berkas digital.

### Petugas Fakultas

Petugas fakultas merupakan pihak yang menangani administrasi pengajuan surat.

Kebutuhan petugas meliputi:

* Melihat pengajuan yang masuk.
* Memeriksa kelengkapan data dan dokumen.
* Memperbarui status pengajuan.
* Memproses permohonan sesuai prosedur administrasi.
* Menyediakan surat yang telah selesai diproses kepada mahasiswa.

## 5. Fitur dan Ruang Lingkup

Fitur yang direncanakan dalam SIPORA meliputi:

| Fitur            | Deskripsi                                                             |
| ---------------- | --------------------------------------------------------------------- |
| Beranda          | Menyajikan informasi utama dan ringkasan pengajuan.                   |
| Pengajuan surat  | Menyediakan formulir pengajuan surat observasi atau penelitian.       |
| Unggah dokumen   | Mendukung penyampaian dokumen persyaratan pengajuan.                  |
| Daftar pengajuan | Menampilkan informasi pengajuan yang telah dibuat.                    |
| Status pengajuan | Menyajikan perkembangan proses pengajuan.                             |
| Unduh surat      | Menyediakan akses terhadap surat digital yang telah selesai diproses. |

Fitur tersebut merupakan ruang lingkup fungsional yang direncanakan. Implementasi setiap fitur bergantung pada tahap pengembangan aplikasi. Antarmuka prototipe tidak dengan sendirinya menunjukkan bahwa fungsi autentikasi, penyimpanan data, unggah berkas, atau pemrosesan surat telah terhubung ke layanan backend.

## 6. Teknologi yang Digunakan

* **Flutter** — framework untuk membangun antarmuka aplikasi.
* **Dart** — bahasa pemrograman yang digunakan dalam pengembangan.
* **Material Design** — acuan komponen dan pola antarmuka.
* **Google Chrome** — browser untuk menjalankan aplikasi pada platform web.
* **Visual Studio Code** — editor kode yang digunakan dalam proses pengembangan.

## 7. Struktur Proyek

Struktur direktori dapat disesuaikan dengan implementasi aktual proyek.

```text
sipora/
├── lib/
│   ├── main.dart
│   └── ...
├── test/
│   └── widget_test.dart
├── web/
├── pubspec.yaml
├── analysis_options.yaml
└── README.md
```

Keterangan:

* `lib/` berisi kode sumber aplikasi Flutter.
* `main.dart` menjadi titik masuk aplikasi apabila digunakan sebagai entry point.
* `test/` berisi berkas pengujian aplikasi.
* `web/` berisi konfigurasi dan berkas pendukung platform web.
* `pubspec.yaml` mengatur dependensi dan konfigurasi proyek Flutter.
* `analysis_options.yaml` mengatur aturan analisis kode Dart.
* `README.md` menjelaskan informasi dan petunjuk penggunaan proyek.

## 8. Persyaratan Sistem

Sebelum menjalankan proyek, pastikan perangkat telah memiliki:

1. Flutter SDK.
2. Dart SDK yang kompatibel dengan versi Flutter.
3. Visual Studio Code atau editor lain yang mendukung Flutter.
4. Google Chrome.
5. Git, apabila proyek dikelola menggunakan sistem version control.

Periksa instalasi Flutter melalui terminal:

```bash
flutter doctor
```

Pastikan dukungan Flutter Web tersedia dan perangkat Chrome dapat digunakan.

## 9. Cara Menjalankan Aplikasi

### Langkah 1 — Buka direktori proyek

Buka terminal pada folder utama proyek SIPORA.

### Langkah 2 — Unduh dependensi

```bash
flutter pub get
```

### Langkah 3 — Periksa perangkat yang tersedia

```bash
flutter devices
```

Pastikan Chrome terdeteksi sebagai perangkat untuk menjalankan aplikasi web.

### Langkah 4 — Jalankan aplikasi

```bash
flutter run -d chrome
```

Flutter akan membangun aplikasi dan membukanya di browser Chrome.

### Langkah 5 — Periksa tampilan aplikasi

Amati konsistensi tata letak, keterbacaan teks, hierarki informasi, navigasi, dan responsivitas antarmuka. Pastikan konten dapat diakses dengan menggulir halaman apabila panjang konten melebihi tinggi layar.

## 10. Prinsip Perancangan UI/UX

Perancangan antarmuka SIPORA memperhatikan beberapa prinsip berikut:

* **Konsistensi:** penggunaan warna, tipografi, ikon, tombol, dan jarak antarkomponen secara konsisten.
* **Kejelasan informasi:** informasi pengajuan dan statusnya disajikan menggunakan label yang mudah dipahami.
* **Kemudahan penggunaan:** alur pengajuan dirancang agar dapat dipahami mahasiswa tanpa langkah yang tidak diperlukan.
* **Hierarki visual:** informasi utama ditempatkan agar mudah ditemukan dan dibedakan dari informasi pendukung.
* **Responsivitas:** tata letak dirancang agar tetap nyaman digunakan pada ukuran layar yang berbeda.
* **Umpan balik:** setiap tindakan pengguna idealnya disertai informasi yang jelas mengenai hasil atau status proses.

## 11. Rencana Pengujian

Pengujian direncanakan untuk mengevaluasi fungsi dan kualitas antarmuka aplikasi.

| Aspek            | Hal yang diperiksa                                      |
| ---------------- | ------------------------------------------------------- |
| Tampilan         | Kesesuaian tata letak dan konsistensi komponen.         |
| Navigasi         | Kemudahan berpindah antarbagian aplikasi.               |
| Formulir         | Kejelasan label, input, dan validasi.                   |
| Status pengajuan | Kejelasan informasi tahapan pengajuan.                  |
| Responsivitas    | Kesesuaian tampilan pada berbagai ukuran layar.         |
| Pengujian widget | Kesesuaian perilaku komponen dengan skenario pengujian. |

Pengujian dilakukan sesuai dengan fitur yang telah diimplementasikan. Fitur yang masih berupa rancangan perlu dibedakan dari fungsi yang telah diuji.

## 12. Pengembangan Selanjutnya

Pengembangan SIPORA dapat dilanjutkan melalui beberapa tahap:

1. Penyempurnaan kebutuhan fungsional dan nonfungsional berdasarkan kebutuhan pengguna.
2. Penyusunan persona pengguna, alur pengguna (*user flow*), dan pemetaan kebutuhan terhadap antarmuka.
3. Penyempurnaan prototipe UI/UX berdasarkan hasil evaluasi.
4. Implementasi validasi formulir dan pengelolaan status pengajuan.
5. Integrasi autentikasi, basis data, penyimpanan dokumen, serta pengelolaan hak akses apabila diperlukan.
6. Pengujian fungsional, responsivitas, keamanan, dan kemudahan penggunaan.

## 13. Penutup

SIPORA dikembangkan sebagai rancangan sistem informasi untuk mendukung proses pengajuan surat observasi dan penelitian akademik. Pengembangan dilakukan dengan memperhatikan kebutuhan pengguna, keteraturan alur administrasi, dan kualitas antarmuka. Melalui pengembangan bertahap, proyek ini diharapkan dapat menjadi dasar bagi implementasi sistem pengajuan surat akademik yang lebih terstruktur dan mudah digunakan.

