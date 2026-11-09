# Tugas 7 — MVP Awal dengan Data Lokal

### Deskripsi 

Tugas 7 merupakan tahap implementasi awal aplikasi Akademik PKBM Al Qosimmiyah dalam bentuk Minimum Viable Product (MVP) menggunakan Flutter dan pengelolaan data lokal. Aplikasi ini dirancang untuk membantu siswa atau Warga Belajar mengakses informasi akademik, seperti nilai, jadwal pelajaran, dan jadwal ujian, serta mengelola catatan belajar pribadi.

Pada tugas ini, implementasi pengelolaan data difokuskan pada fitur Catatan Belajar Saya menggunakan operasi CRUD (Create, Read, Update, Delete). Data catatan dikelola menggunakan model CatatanBelajar dan List<CatatanBelajar> yang disimpan di dalam State aplikasi. Setiap perubahan data menggunakan setState() agar tampilan aplikasi diperbarui sesuai kondisi data terbaru.

Selain operasi CRUD, fitur Catatan Belajar juga dilengkapi dengan fitur Pin (Sematkan Catatan). Fitur ini memungkinkan Warga Belajar menyematkan catatan penting agar selalu ditampilkan di bagian atas daftar, sehingga lebih mudah ditemukan ketika jumlah catatan semakin banyak.

Penyimpanan data pada tahap MVP ini masih menggunakan memori lokal aplikasi dan belum menggunakan database maupun backend. Oleh karena itu, data akan kembali ke kondisi awal ketika aplikasi dijalankan ulang.

# Refleksi

Kendala yang saya alami pada proses penyimpanan dan pengelolaan formulir catatan. Setelah dilakukan perbaikan, fitur dapat berjalan dengan baik. Pengembangan ini membantu saya memahami pengelolaan data lokal pada aplikasi mobile.