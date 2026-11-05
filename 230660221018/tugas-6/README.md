# SIPORA — Sistem Informasi Pengajuan Observasi dan Riset Akademik

## 1. Deskripsi Aplikasi

SIPORA (Sistem Informasi Pengajuan Observasi dan Riset Akademik) merupakan rancangan aplikasi berbasis Flutter yang bertujuan mempermudah mahasiswa dalam mengajukan surat observasi dan penelitian akademik. Aplikasi ini dirancang dengan alur pengajuan yang terstruktur agar mahasiswa dapat mengisi informasi yang diperlukan, memeriksa kembali data, dan memperoleh umpan balik selama proses pengajuan.

Pengembangan SIPORA pada tahap ini berfokus pada rancangan antarmuka, validasi formulir, dan navigasi antarlayar. Aplikasi masih berupa prototipe interaktif dan belum terhubung dengan basis data maupun sistem pengelolaan surat di tingkat fakultas.

## 2. Tujuan Pengembangan

Tujuan pengembangan SIPORA adalah:

- Merancang antarmuka pengajuan surat yang mudah dipahami dan digunakan mahasiswa.
- Menerapkan navigasi antara halaman Beranda dan formulir pengajuan.
- Menerapkan validasi input untuk membantu mengurangi kesalahan pengisian data.
- Mengakomodasi kebutuhan pengajuan penelitian skripsi secara individual serta observasi secara individual maupun berkelompok.
- Memberikan umpan balik yang jelas melalui pesan validasi, ringkasan konfirmasi, dan notifikasi.

## 3. Fitur Utama

| Fitur | Deskripsi |
|---|---|
| Beranda | Menampilkan informasi awal dan akses menuju formulir pengajuan surat. |
| Pemilihan jenis pengajuan | Memungkinkan pengguna memilih penelitian skripsi atau observasi. |
| Pengaturan anggota | Mendukung pengisian identitas satu atau beberapa anggota sesuai jenis pengajuan dan pilihan pengguna. |
| Formulir pengajuan | Menyediakan input identitas mahasiswa, semester, program studi, tujuan, alamat, jadwal, dan topik kegiatan. |
| Validasi formulir | Memeriksa kelengkapan dan kesesuaian data sebelum melanjutkan proses. |
| Konfirmasi pengajuan | Menampilkan ringkasan data agar pengguna dapat meninjau kembali informasi yang diisi. |
| Umpan balik | Memberikan pesan validasi dan notifikasi setelah interaksi pengguna. |

## 4. Teknologi yang Digunakan

- **Flutter** — framework untuk membangun antarmuka aplikasi.
- **Dart** — bahasa pemrograman yang digunakan dalam pengembangan.
- **Material Design** — acuan desain komponen antarmuka.
- **Flutter Web** — platform yang digunakan untuk menjalankan dan menguji aplikasi melalui peramban.

## 5. Struktur Proyek

```text
sipora/
├── lib/
│   ├── main.dart
│   ├── halaman-utama.dart
│   └── form-interaksi.dart
├── navigation-flow.md
├── catatan-keputusan-navigasi.md
├── screenshot-alur.png
├── screenshot-feedback.png
└── README.md
```

Keterangan:

- `main.dart` merupakan titik masuk aplikasi.
- `halaman-utama.dart` berisi implementasi halaman Beranda.
- `form-interaksi.dart` berisi formulir pengajuan beserta validasi dan umpan balik interaksi.
- `navigation-flow.md` mendokumentasikan alur navigasi aplikasi.
- `catatan-keputusan-navigasi.md` menjelaskan keputusan desain navigasi dan alasan pemilihannya.
- `screenshot-alur.png` mendokumentasikan alur penggunaan aplikasi.
- `screenshot-feedback.png` menunjukkan contoh umpan balik yang diberikan aplikasi.

## 6. Cara Menjalankan Aplikasi

Pastikan Flutter dan Dart telah terpasang serta dapat dijalankan melalui terminal.

1. Buka terminal pada direktori utama proyek SIPORA.
2. Jalankan perintah berikut untuk memeriksa konfigurasi Flutter.

   ```bash
   flutter doctor
   ```

3. Unduh dependensi proyek.

   ```bash
   flutter pub get
   ```

4. Jalankan aplikasi melalui peramban Chrome.

   ```bash
   flutter run -d chrome
   ```

5. Uji navigasi dari Beranda ke formulir, kelengkapan input, validasi, pemilihan jenis pengajuan, ringkasan konfirmasi, dan umpan balik yang ditampilkan.

## 7. Alur Penggunaan

1. Pengguna membuka aplikasi dan melihat halaman Beranda.
2. Pengguna memilih menu **Ajukan Surat**.
3. Aplikasi menampilkan formulir pengajuan.
4. Pengguna memilih jenis pengajuan, yaitu penelitian skripsi atau observasi.
5. Pengguna mengisi identitas, informasi tujuan, jadwal, dan data lain yang diperlukan.
6. Untuk observasi berkelompok, pengguna dapat menambahkan identitas anggota lainnya.
7. Pengguna memeriksa kelengkapan data dan melanjutkan proses validasi.
8. Setelah data valid, aplikasi menampilkan ringkasan konfirmasi.
9. Aplikasi memberikan umpan balik atas interaksi pengiriman simulasi.

## 8. Batasan Aplikasi

SIPORA masih berupa prototipe interaktif untuk kebutuhan pembelajaran. Data yang dimasukkan belum disimpan secara permanen ke basis data dan belum dikirim kepada petugas fakultas. Aplikasi juga belum memproses persetujuan, penolakan, maupun penerbitan surat secara nyata.

Dengan demikian, notifikasi dan konfirmasi yang ditampilkan hanya menunjukkan hasil interaksi pada prototipe, bukan bukti bahwa pengajuan telah diterima atau disetujui secara administratif.

## 9. Refleksi Pengembangan

Melalui pengembangan SIPORA, saya mempelajari bahwa pembuatan aplikasi tidak hanya berfokus pada tampilan antarmuka, tetapi juga pada kesesuaian alur dengan kebutuhan pengguna. Formulir pengajuan memerlukan validasi yang tepat agar pengguna mengetahui informasi yang belum lengkap dan dapat memperbaikinya sebelum melanjutkan proses.

Saya juga memahami pentingnya konsistensi navigasi, pengelolaan controller, serta pemberian umpan balik yang jelas. Perbedaan kebutuhan antara penelitian skripsi dan observasi berkelompok menjadi pertimbangan dalam merancang formulir yang lebih fleksibel.

Ke depan, SIPORA dapat dikembangkan dengan penyimpanan data, autentikasi pengguna, pemantauan status pengajuan, dan integrasi dengan petugas fakultas. Pengembangan lanjutan tersebut perlu disertai perhatian terhadap keamanan data mahasiswa, hak akses, dan kejelasan status pengajuan.

## 10. Deklarasi Penggunaan AI

Dalam penyusunan dan pengembangan tugas ini, AI digunakan sebagai alat bantu untuk mendukung proses pembelajaran, antara lain dalam memberikan saran struktur dokumentasi, membantu peninjauan kode, serta menyusun dan memperbaiki penjelasan teknis. Pemilihan fitur, penyesuaian implementasi, pemeriksaan hasil, dan pengujian aplikasi tetap menjadi tanggung jawab saya.

---

**Catatan:** SIPORA dikembangkan sebagai prototipe pembelajaran untuk menunjukkan penerapan rancangan antarmuka, validasi formulir, navigasi, dan umpan balik pengguna menggunakan Flutter.