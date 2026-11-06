# Catatan Integrasi API — Tugas 9

## 1. Endpoint yang Digunakan

| Operasi | Metode HTTP | URL Endpoint | Payload Request |
|:--------|:-----------|:-------------|:----------------|
| Ambil daftar kegiatan | GET | `https://jsonplaceholder.typicode.com/posts?_limit=10` | — |
| Kirim kegiatan baru | POST | `https://jsonplaceholder.typicode.com/posts` | `{"title": "Nama", "body": "Tanggal", "status": "Dibuka", "userId": 1}` |

## 2. Struktur Model Data

| Field | Tipe Dart | Key JSON | Sumber Nilai |
|:------|:----------|:---------|:-------------|
| id | int | "id" | Server (Otomatis) |
| nama | String | "title" | Input Form (POST) / Server (GET) |
| tanggal | String | "body" | Input Form (POST) / Server (GET) |
| status | String | "status" | Sistem (Default: "Dibuka") |

## 3. Penanganan Error
Kami menggunakan blok `try-catch` dikombinasikan dengan `timeout(Duration(seconds: 10))`. Jika server lambat merespons, `TimeoutException` akan ditangkap dan ditampilkan pesan "Koneksi time out". Jika status code bukan 200/201, pesan error HTTP akan ditangkap. Pengguna dapat menekan tombol "Coba Lagi" untuk memicu ulang request.