# Tugas 9 — Integrasi REST API

## Identitas
- **Nama:** Ghatan Zalfaa Kautsar
- **NIM:** 230660221001
- **Mata Kuliah:** Pemrograman Aplikasi Bergerak (PAB)
- **Pertemuan:** 9
- **Domain:** Sistem Penjualan Beras di Pabrik BSM

## Deskripsi
Tugas ini mengintegrasikan aplikasi Flutter dengan REST API menggunakan package `http`. Aplikasi dapat mengambil daftar pesanan (GET), mengirim pesanan baru (POST), serta menangani tiga kondisi antarmuka: loading, sukses, dan error.

## Refleksi
Bagian yang paling sulit saya pahami adalah **asynchronous programming**, karena saya harus membiasakan diri dengan konsep `Future`, `async`, dan `await` agar antarmuka tidak membeku saat menunggu respons jaringan. Selain itu, **penanganan error** juga menantang karena saya harus memastikan aplikasi tidak *crash* saat koneksi terputus atau server mengembalikan *status code* yang salah. Setelah praktik langsung, saya memahami pentingnya memisahkan logika jaringan ke dalam *Service Layer* agar kode UI tetap bersih dan mudah diuji.

## Deklarasi Penggunaan AI
```text
Deklarasi penggunaan AI: Claude — membantu menyusun pola Service Layer dan
penanganan error state; kode, pengujian, dan penjelasan diverifikasi oleh penulis.