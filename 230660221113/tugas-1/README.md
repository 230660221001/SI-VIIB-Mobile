# Tugas 1 Pemrograman Aplikasi Bergerak

## Identitas

* **Nama:** Muhammad Andre Nugraha
* **NIM:** 230660221113
* **Program Studi:** Sistem Informasi
* **Mata Kuliah:** Pemrograman Aplikasi Bergerak
* **Nama Aplikasi:** FasKampus

---

## 1. Deskripsi Sistem

**FasKampus** adalah aplikasi mobile yang digunakan oleh organisasi mahasiswa seperti BEM, HIMA, dan UKM untuk mengajukan peminjaman fasilitas kampus untuk kegiatan seperti seminar, rapat, workshop, atau kegiatan organisasi lainnya. Permasalahan yang ingin diselesaikan adalah proses pengajuan peminjaman yang masih dapat dilakukan secara manual sehingga pengguna perlu datang atau menghubungi pihak kampus untuk mengetahui ketersediaan fasilitas dan status pengajuan. Aplikasi ini dibuat dalam bentuk mobile karena pengguna membutuhkan akses yang praktis saat berada di lingkungan kampus maupun di luar kampus (**moving context**) serta membutuhkan koneksi untuk mengirim pengajuan dan mendapatkan informasi ketersediaan fasilitas dari server (**connectivity**).

---

## 2. Ruang Lingkup Sistem

FasKampus berfokus pada proses pengajuan peminjaman ruang dan fasilitas pendukung untuk kegiatan organisasi mahasiswa.

Fasilitas yang dapat diajukan antara lain:

* Ruang kelas
* Aula
* Proyektor
* Sound system
* Mikrofon
* Meja
* Kursi

Proses utama aplikasi:

**Login → Melihat Fasilitas → Memilih Fasilitas → Menentukan Tanggal & Waktu → Mengisi Detail Kegiatan → Upload Surat/Proposal → Mengirim Pengajuan → Melihat Status Pengajuan**

Proses persetujuan dan pengelolaan data fasilitas dilakukan oleh **Backend SI/Admin** dan berada di luar lingkup utama aplikasi mobile.

---

## 3. Kebutuhan Sistem

| No | Permintaan                                               | Pengguna         | Karakteristik Mobile yang Terkait  | Fitur Aplikasi                  | Materi Pemenuh       |
| -- | -------------------------------------------------------- | ---------------- | ---------------------------------- | ------------------------------- | -------------------- |
| 1  | Pengguna dapat masuk ke aplikasi menggunakan akun        | Mahasiswa/Ormawa | Short usage sessions               | Login                           | UI/UX, Form Input    |
| 2  | Pengguna dapat melihat daftar fasilitas kampus           | Mahasiswa/Ormawa | Small/varied screens               | Daftar Fasilitas                | UI/UX, List          |
| 3  | Pengguna dapat melihat informasi fasilitas yang tersedia | Mahasiswa/Ormawa | Connectivity                       | Detail & Ketersediaan Fasilitas | REST API             |
| 4  | Pengguna dapat menentukan tanggal dan waktu peminjaman   | Mahasiswa/Ormawa | Touch interaction                  | Date & Time Picker              | UI/UX, Input         |
| 5  | Pengguna dapat mengajukan peminjaman fasilitas           | Mahasiswa/Ormawa | Moving context                     | Form Pengajuan                  | Form Validation      |
| 6  | Pengguna dapat mengunggah surat atau proposal kegiatan   | Mahasiswa/Ormawa | Connectivity                       | Upload Dokumen                  | Device/File Feature  |
| 7  | Pengguna dapat melihat status pengajuan                  | Mahasiswa/Ormawa | Short usage sessions, Connectivity | Status Pengajuan                | REST API             |
| 8  | Sistem dapat menyimpan dan mengelola data pengajuan      | Admin/Backend SI | Di luar lingkup mobile             | Pengelolaan Data Pengajuan      | Backend SI, Database |
| 9  | Admin dapat menyetujui atau menolak pengajuan            | Admin            | Di luar lingkup mobile             | Approval Pengajuan              | Backend SI, Database |

---

## 4. Arsitektur Sistem

Arsitektur FasKampus menggunakan konsep komunikasi antara aplikasi mobile dengan Backend SI melalui HTTP Request dan HTTP Response.

Alur komunikasi:

**Mobile App → HTTP Request → Backend SI → Database → HTTP Response → Mobile App**

File diagram tersedia pada:

* `diagram.png`
* `diagram.mmd`

### Komponen Sistem

1. **Mobile App FasKampus**
   Digunakan oleh mahasiswa atau organisasi mahasiswa untuk melihat fasilitas dan melakukan pengajuan peminjaman.

2. **Backend SI / API Server**
   Menangani proses autentikasi, pengajuan peminjaman, pengecekan data, serta proses persetujuan.

3. **Database**
   Menyimpan data pengguna, fasilitas, jadwal peminjaman, dan pengajuan.

---

## 5. Lingkungan Pengembangan

Lingkungan yang digunakan untuk membuat aplikasi:

* **Framework:** Flutter
* **Bahasa Pemrograman:** Dart
* **IDE:** Visual Studio Code
* **Target:** Web / Android
* **SDK:** Flutter SDK dan Dart SDK
* **Database:** Digunakan pada sisi Backend SI

Bukti konfigurasi dan hasil pengecekan Flutter tersedia pada folder:

```text
flutter-doctor/
├── sebelum.png
└── sesudah.png
```

Bukti aplikasi Flutter yang berhasil dijalankan:

```text
aplikasi.png
```

---

## 6. Skenario Penggunaan

Contoh skenario penggunaan FasKampus:

Seorang anggota HIMA Sistem Informasi ingin mengadakan seminar di kampus. Pengguna membuka aplikasi FasKampus dan login menggunakan akun yang dimiliki. Setelah itu pengguna memilih fasilitas aula, menentukan tanggal dan waktu kegiatan, mengisi informasi kegiatan, memilih fasilitas pendukung seperti proyektor dan sound system, kemudian mengunggah surat atau proposal kegiatan. Setelah pengajuan dikirim, pengguna dapat melihat status pengajuan melalui aplikasi sampai pengajuan tersebut disetujui atau ditolak oleh pihak kampus.

---

## 7. Refleksi

Fitur perangkat yang paling relevan untuk FasKampus adalah **notifikasi** karena pengguna perlu mengetahui perubahan status pengajuan tanpa harus terus membuka aplikasi. Notifikasi dapat digunakan untuk memberikan informasi ketika pengajuan disetujui, ditolak, atau membutuhkan tindakan dari pengguna. Fitur ini membuat proses peminjaman menjadi lebih praktis karena informasi dapat diterima secara langsung melalui perangkat mobile.

---

## 8. Struktur File Tugas

```text
tugas-1/
└── [NIM]-[Nama]/
    ├── README.md
    ├── diagram.png
    ├── diagram.mmd
    ├── flutter-doctor/
    │   ├── sebelum.png
    │   └── sesudah.png
    └── aplikasi.png
```
