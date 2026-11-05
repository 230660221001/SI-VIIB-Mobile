# Model Data — SIPUSKAM

## 1. Deskripsi

SIPUSKAM merupakan aplikasi perpustakaan kampus yang membantu pengguna melihat informasi buku dan mengelola data buku secara lokal. Pada Tugas 7, data buku dikelola menggunakan model data dan operasi CRUD (Create, Read, Update, Delete).

## 2. Entitas Data

Entitas utama yang digunakan adalah **Buku**, yaitu representasi satu data buku yang tersedia dalam aplikasi SIPUSKAM.

| No. | Field | Tipe Data | Keterangan | Sumber Nilai |
|---|---|---|---|---|
| 1 | `id` | `String` | Identitas unik setiap buku untuk operasi update dan delete. | Sistem |
| 2 | `judul` | `String` | Judul buku yang ditampilkan pada daftar dan detail. | Form input |
| 3 | `penulis` | `String` | Nama penulis buku. | Form input |
| 4 | `kategori` | `String` | Kategori atau bidang buku. | Form input |
| 5 | `status` | `String` | Status ketersediaan buku, misalnya tersedia atau dipinjam. | Form atau sistem, sesuai aturan aplikasi |

## 3. Hubungan Field dengan Pengelolaan Data

| Operasi | Field yang Digunakan | Tujuan |
|---|---|---|
| Create | `id`, `judul`, `penulis`, `kategori`, `status` | Membuat dan menambahkan data buku baru. |
| Read | Seluruh field | Menampilkan informasi buku pada daftar. |
| Update | `id` dan field yang diperbarui | Menemukan buku berdasarkan ID dan memperbarui informasinya. |
| Delete | `id` | Menghapus buku yang dipilih secara tepat. |

## 4. Alasan Pemilihan Model

Model Buku digunakan agar setiap data memiliki struktur yang konsisten. Field `id` berfungsi sebagai identitas unik sehingga operasi pembaruan dan penghapusan tidak bergantung pada posisi buku dalam daftar. Field judul, penulis, kategori, dan status digunakan untuk merepresentasikan informasi buku yang dikelola oleh aplikasi.

## 5. Catatan Keterkaitan dengan Kebutuhan

Model ini merupakan rancangan awal berdasarkan fitur SIPUSKAM yang telah dibuat. Setiap field perlu dicocokkan kembali dengan dokumen kebutuhan Tugas 4 untuk memastikan bahwa seluruh field memiliki dasar kebutuhan yang jelas dan tidak ada field yang tidak diperlukan.