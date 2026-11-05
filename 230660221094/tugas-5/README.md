# Tugas 5 — Prototype UI/UX SIPUSKAM

## Identitas

* **Nama:** Kikania Zahra
* **NIM:** 230660221094
* **Mata Kuliah:** Pemrograman Aplikasi Berbasis Mobile
* **Pertemuan:** 5 — UI/UX Mobile
* **Proyek:** SIPUSKAM (Sistem Informasi Perpustakaan Kampus)

---

## 1. Deskripsi Proyek

SIPUSKAM merupakan aplikasi perpustakaan kampus yang dirancang untuk membantu mahasiswa mencari informasi buku dan mengetahui ketersediaan buku dengan lebih mudah.

Pada Tugas 5 ini, fokus pengerjaan adalah membuat **prototype UI/UX** berdasarkan kebutuhan pengguna dan hasil analisis pada Tugas 4. Prototype mencakup rancangan **Information Architecture**, wireframe, implementasi halaman utama menggunakan Flutter, serta dokumentasi keputusan desain UI/UX.

Halaman utama SIPUSKAM menampilkan informasi utama berupa daftar buku, judul buku, penulis, kategori, dan status ketersediaan. Halaman juga menyediakan fitur pencarian buku serta empty state ketika tidak terdapat hasil buku yang ditemukan.

---

## 2. Tujuan Tugas

Tujuan dari pengerjaan Tugas 5 ini adalah:

1. Membuat struktur **Information Architecture** berdasarkan kebutuhan aplikasi.
2. Membuat wireframe low-fidelity untuk halaman utama dan halaman pendukung.
3. Mengimplementasikan halaman utama SIPUSKAM menggunakan Flutter.
4. Menerapkan prinsip dasar UI/UX pada aplikasi mobile.
5. Mendokumentasikan alasan dari keputusan desain yang digunakan.
6. Mengevaluasi tampilan melalui proses implementasi dan pengujian pada perangkat atau browser.

---

## 3. Fitur dan Tampilan

### Halaman Utama / Daftar Buku

Halaman utama merupakan halaman yang digunakan pengguna untuk melihat daftar buku yang tersedia pada perpustakaan kampus.

Komponen utama yang digunakan meliputi:

* AppBar dengan identitas aplikasi SIPUSKAM.
* Sapaan kepada pengguna.
* Kolom pencarian buku.
* Daftar buku dalam bentuk Card.
* Informasi judul, penulis, dan kategori buku.
* Status ketersediaan buku.
* Primary action **Cari Buku**.
* Empty state ketika tidak terdapat buku atau hasil pencarian.

### Detail Buku

Wireframe juga menggambarkan halaman detail buku sebagai halaman pendukung. Halaman tersebut berisi informasi yang lebih lengkap mengenai buku, seperti cover, judul, penulis, kategori, tahun terbit, deskripsi, status ketersediaan, dan aksi peminjaman.

Implementasi Flutter pada Tugas 5 difokuskan pada **halaman utama**, sedangkan navigasi menuju halaman lain belum diterapkan karena routing akan dibahas pada pertemuan berikutnya.

---

## 4. Struktur Folder

Struktur folder pengumpulan Tugas 5 adalah sebagai berikut:

```text
tugas-5/
└── <nim>-<nama>/
    ├── information-architecture.md
    ├── wireframe.png
    ├── halaman-utama.dart
    ├── screenshot-halaman.png
    ├── catatan-keputusan-ui.md
    └── README.md
```

### Keterangan File

| File                          | Keterangan                                                                                           |
| ----------------------------- | ---------------------------------------------------------------------------------------------------- |
| `information-architecture.md` | Berisi inventaris halaman, requirement, dan alur Information Architecture SIPUSKAM.                  |
| `wireframe.png`               | Berisi rancangan wireframe low-fidelity halaman utama dan halaman pendukung.                         |
| `halaman-utama.dart`          | Implementasi halaman utama SIPUSKAM menggunakan Flutter.                                             |
| `screenshot-halaman.png`      | Screenshot hasil implementasi halaman utama.                                                         |
| `catatan-keputusan-ui.md`     | Dokumentasi alasan pemilihan warna, status, primary action, hierarki teks, dan keputusan UI lainnya. |
| `README.md`                   | Dokumentasi keseluruhan pengerjaan Tugas 5.                                                          |

---

## 5. Implementasi Flutter

Implementasi halaman utama dibuat menggunakan Flutter dengan beberapa komponen utama:

* `MaterialApp`
* `ThemeData`
* `ColorScheme.fromSeed`
* `Scaffold`
* `AppBar`
* `TextField`
* `ListView.builder`
* `Card`
* `ListTile`
* `FloatingActionButton.extended`
* Empty state menggunakan `Center`, `Icon`, dan `Text`

Tema aplikasi menggunakan Material 3 agar komponen UI memiliki tampilan yang konsisten dan sesuai dengan standar desain Flutter.

Status ketersediaan buku menggunakan kondisi ternary sehingga tampilan status dapat membedakan buku yang tersedia dan tidak tersedia.

---

## 6. Prinsip UI/UX yang Diterapkan

Beberapa prinsip UI/UX yang diterapkan pada prototype ini adalah:

### Visual Hierarchy

Ukuran dan ketebalan teks dibedakan untuk menunjukkan informasi yang paling penting terlebih dahulu, seperti nama aplikasi, judul buku, dan status ketersediaan.

### Consistency

Setiap buku menggunakan struktur Card yang sama sehingga pengguna dapat memahami pola informasi dengan mudah.

### Feedback

Status **Tersedia** dan **Tidak tersedia** memberikan informasi langsung mengenai kondisi buku kepada pengguna.

### Touch Target

Primary action dibuat dalam bentuk tombol yang cukup besar agar mudah disentuh pada perangkat mobile.

### Readability dan Contrast

Informasi utama menggunakan ukuran dan ketebalan teks yang lebih menonjol agar mudah dibaca pada layar perangkat mobile.

### Empty State

Empty state digunakan ketika tidak terdapat buku yang dapat ditampilkan sehingga pengguna tetap mendapatkan informasi mengenai kondisi halaman dan arahan untuk mencoba pencarian kembali.

---

## 7. Cara Menjalankan

Pastikan Flutter sudah terpasang pada perangkat.

Masuk ke folder project SIPUSKAM, kemudian jalankan:

```bash
flutter pub get
```

Setelah proses selesai, aplikasi dapat dijalankan menggunakan:

```bash
flutter run
```

Untuk menjalankan melalui Chrome, dapat menggunakan:

```bash
flutter run -d chrome
```

File `main.dart` digunakan sebagai entry point aplikasi dan mengarahkan aplikasi untuk menampilkan halaman utama SIPUSKAM.

---

## 8. Batasan Implementasi Tugas 5

Implementasi pada Tugas 5 masih berfokus pada prototype halaman utama sehingga beberapa fungsi belum dibuat secara penuh.

Batasan implementasi pada tugas ini antara lain:

* Data buku masih berupa data contoh.
* Fitur pencarian belum terhubung dengan database.
* Tombol **Cari Buku** belum menjalankan proses pencarian sebenarnya.
* Tombol pada halaman belum menggunakan navigasi antarhalaman.
* Proses peminjaman buku belum diimplementasikan.
* Belum terdapat backend atau database.
* Halaman detail buku masih berupa bagian dari rancangan wireframe.

Batasan tersebut disesuaikan dengan ruang lingkup Pertemuan 5 yang berfokus pada **UI/UX dan prototype halaman utama**.

---

## 9. Hasil yang Diharapkan

Hasil akhir dari Tugas 5 adalah prototype SIPUSKAM yang memiliki struktur informasi yang jelas, wireframe yang sesuai dengan kebutuhan pengguna, serta implementasi halaman utama yang dapat dijalankan menggunakan Flutter.

Prototype ini menjadi dasar untuk pengembangan fitur dan navigasi pada pertemuan berikutnya.

---

## 10. Refleksi

Pada tugas ini saya belajar bahwa pembuatan antarmuka aplikasi tidak hanya berfokus pada tampilan, tetapi juga harus mempertimbangkan kebutuhan pengguna dan alur informasi. Saya memahami bahwa pemilihan warna, penempatan tombol, hierarki teks, status, dan empty state dapat memengaruhi kemudahan pengguna dalam memahami aplikasi. Melalui tugas ini saya juga menjadi lebih memahami hubungan antara hasil analisis kebutuhan, wireframe, keputusan UI/UX, dan implementasi halaman menggunakan Flutter.

---

## 11. Deklarasi Penggunaan AI

Dalam pengerjaan Tugas 5 ini, saya menggunakan **ChatGPT sebagai alat bantu** untuk memahami instruksi tugas, memberikan saran terkait struktur UI/UX, membantu pengecekan dan penyusunan kode Flutter, serta membantu menyusun dokumentasi.

Keputusan akhir mengenai struktur aplikasi, tampilan, penyesuaian kebutuhan proyek, dan hasil implementasi tetap dilakukan dan diperiksa oleh saya sebagai mahasiswa.
