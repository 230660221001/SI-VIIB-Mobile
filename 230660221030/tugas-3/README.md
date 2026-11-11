# Tugas 3 — Halaman Aplikasi Sederhana

## Identitas

| Keterangan | Data |
|---|---|
| **Nama** | Syifa Nur Insani |
| **NIM** | 230660221030 |
| **Kelas** | SI-VIIB |
| **Mata Kuliah** | Pemrograman Aplikasi Bergerak (PAB) |
| **Domain** | Aplikasi Perpustakaan Kampus — PustakaKu |

---

## 1. Deskripsi Aplikasi

PustakaKu merupakan aplikasi perpustakaan kampus yang digunakan untuk membantu mahasiswa melihat katalog buku yang tersedia di perpustakaan.

Pada Tugas 3 ini, dibuat halaman utama sederhana yang menampilkan nama aplikasi, informasi jumlah buku, jumlah buku yang tersedia, serta daftar katalog buku. Data buku masih menggunakan data statis yang ditulis langsung di dalam kode Dart.

Halaman aplikasi dibangun menggunakan Flutter dengan menerapkan beberapa widget dan layout dasar seperti `MaterialApp`, `Scaffold`, `AppBar`, `Column`, `Row`, `Padding`, `Card`, dan `ListView.builder`.

---

## 2. Fitur Halaman

Halaman utama PustakaKu memiliki beberapa bagian:

1. **AppBar**
   - Menampilkan ikon buku dan nama aplikasi "PustakaKu".
   - Memiliki tombol notifikasi.

2. **Sapaan pengguna**
   - Menampilkan teks "Selamat Datang di PustakaKu".
   - Menampilkan deskripsi singkat mengenai fungsi aplikasi.

3. **Informasi jumlah buku**
   - Menampilkan jumlah total buku.
   - Menampilkan jumlah buku yang sedang tersedia.

4. **Katalog Buku**
   - Menampilkan daftar buku menggunakan `ListView.builder`.
   - Setiap buku menampilkan judul, penulis, jumlah stok, dan status ketersediaan.

5. **Tombol Tambah**
   - Menggunakan `FloatingActionButton.extended`.
   - Digunakan sebagai tombol aksi untuk menambahkan buku pada pengembangan selanjutnya.

---

## 3. Data Buku

Data buku yang digunakan pada halaman aplikasi terdiri dari 4 entri:

| No. | Judul | Penulis | Stok | Status |
|---|---|---|---:|---|
| 1 | Pemrograman Dart | Olivia Rodrigo | 3 | Tersedia |
| 2 | Dasar Flutter | Kikania Zahra | 2 | Tersedia |
| 3 | Sistem Informasi | Intan Kartika | 0 | Habis |
| 4 | Basis Data | Syifa Nur Insani | 5 | Tersedia |

Data tersebut disimpan dalam variabel `daftarBuku` dengan tipe `List<Map<String, dynamic>>`.

---

## 4. Struktur Widget

Struktur utama widget pada halaman PustakaKu adalah:

```text
runApp()
└── MaterialApp
    └── HalamanKatalog
        └── Scaffold
            ├── AppBar
            │   ├── Row
            │   │   ├── Icon
            │   │   └── Text
            │   └── IconButton
            │
            ├── body
            │   └── Padding
            │       └── Column
            │           ├── Text
            │           ├── Row
            │           │   ├── Card
            │           │   └── Card
            │           ├── Text
            │           └── Expanded
            │               └── ListView.builder
            │                   └── Card
            │                       └── ListTile
            │
            └── FloatingActionButton.extended