# Catatan Integrasi API — Tugas 9

## 1. Endpoint yang Digunakan
| Operasi | Metode HTTP | URL Endpoint | Payload Request |
|:---|:---|:---|:---|
| Ambil daftar pesanan | GET | https://jsonplaceholder.typicode.com/posts?_limit=10 | — |
| Kirim pesanan baru | POST | https://jsonplaceholder.typicode.com/posts | `{"title": "Nama", "body": "Alamat", "userId": 1}` |

## 2. Struktur Model Data
| Field | Tipe Dart | Key JSON | Sumber Nilai |
|:---|:---|:---|:---|
| id | int | "id" | Server |
| namaPemesan | String | "title" | Server (dipetakan dari input form) |
| alamat | String | "body" | Server (dipetakan dari input form) |
| status | String | - | Default 'menunggu' dari aplikasi |

## 3. Penanganan Error
Strategi yang digunakan adalah `try-catch` dengan batas waktu `timeout` 10 detik. Jika gagal, antarmuka akan menangkap error dan menampilkan pesan yang ramah pengguna (misal "Waktu tunggu habis") beserta tombol "Coba Lagi".