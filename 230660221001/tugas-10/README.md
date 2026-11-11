# Tugas 10 — Integrasi Data dan Proses Bisnis

## Identitas
- **Nama:** Ghatan Zalfaa Kautsar
- **NIM:** 230660221001
- **Mata Kuliah:** Pemrograman Aplikasi Bergerak (PAB)
- **Domain:** Sistem Penjualan Beras di Pabrik BSM

## Endpoint yang Digunakan
| Metode | Endpoint | Fungsi |
|:---|:---|:---|
| GET | `https://jsonplaceholder.typicode.com/users` | Mengambil data pengguna (dimapping sebagai nama pemesan) |
| GET | `https://jsonplaceholder.typicode.com/posts` | Mengambil data pesanan (dimapping sebagai jenis beras dan status) |

## Tabel Pemetaan Field JSON
| Field API | Model Dart | Keterangan |
|:---|:---|:---|
| `id` | `id` | ID unik |
| `name` (dari /users) | `nama` | Nama pemesan |
| `userId` (dari /posts) | `userId` | Identifier untuk menggabungkan dengan data pengguna |
| `title` (dari /posts) | `jenisBeras` | Digunakan sebagai deskripsi pesanan |

## Cara Menjalankan
1. `flutter pub get`
2. `flutter run -d chrome`

## Batasan API Simulasi
API jsonplaceholder adalah API tiruan. Data nama pengguna dan judul postingan bukanlah data asli penjualan beras. Penggabungan (join) dilakukan menggunakan `userId` sebagai Foreign Key.