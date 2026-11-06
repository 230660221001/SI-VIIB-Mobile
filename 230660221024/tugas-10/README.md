# Tugas 10 — Integrasi Data dan Proses Bisnis

- **Nama:** Ridho Akmal Aulia
- **NIM:** 230660221024
- **Kelas:** SI-VIIB
- **Domain Sistem:** Aplikasi Absensi Organisasi Mahasiswa

## 1. Endpoint dan Metode HTTP
| Operasi | Metode | URL Endpoint | Payload |
|:--|:--|:--|:--|
| Ambil Anggota | GET | `https://jsonplaceholder.typicode.com/users` | — |
| Ambil Absensi | GET | `https://jsonplaceholder.typicode.com/posts?_limit=10` | — |

## 2. Tabel Pemetaan Field JSON ke Model Dart
| Model | Field Dart | Key JSON | Sumber |
|:--|:--|:--|:--|
| `DataAnggota` | `id` (int) | `id` | `/users` |
| | `nama` (String) | `name` | `/users` |
| `DataAbsensi` | `id` (int) | `id` | `/posts` |
| | `userId` (int) | `userId` | `/posts` |
| | `namaKegiatan` (String) | `title` | `/posts` |
| | `status` (String) | `status` | Simulasi (id genap = Hadir, id ganjil = Izin) |

## 3. Identifier Penggabungan
Data digabungkan menggunakan **`userId`**. Service mengambil data absensi, mencari pemilik `userId` di dalam list data anggota, lalu menggabungkannya menjadi model `DataAbsensiRingkas`.

## 4. Cara Menjalankan
1. Jalankan `flutter pub get` untuk memastikan package `http` terpasang.
2. Salin kode dari `lib/main.dart` (pada folder ini) ke project Flutter Anda.
3. Jalankan `flutter run -d chrome`.

## 5. Batasan API Simulasi
API `jsonplaceholder` tidak memiliki field status absensi asli atau relasi ruang, sehingga `status` disimulasikan berdasarkan `id` (ganjil/genap). Nama kegiatan diambil dari field `title`.