# Refleksi Tugas 10

Bagian yang paling sulit dari integrasi data ini adalah memastikan bahwa `Future.wait` menangani kedua request secara bersamaan tanpa membuat aplikasi *freeze*, serta melakukan *join* data di memori (menggunakan `Map` berdasarkan `userId`) agar UI tidak kebingungan mencari nama pemesan. Saya juga belajar bahwa data kosong (`isEmpty`) dan error (`catch`) adalah dua hal yang berbeda; data kosong berarti server sukses merespons namun tidak ada datanya, sedangkan error berarti koneksi gagal. Pemisahan logika jaringan ke dalam `IntegrasiService` membuat kode UI di `main.dart` menjadi sangat bersih dan hanya fokus pada tampilan.

---
Deklarasi penggunaan AI: Claude — membantu menyusun pola penggabungan data `Future.wait` dan struktur service layer; kode, pengujian, dan penjelasan diverifikasi oleh penulis.