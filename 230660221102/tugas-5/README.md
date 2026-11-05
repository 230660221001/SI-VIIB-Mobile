# Tugas 5 — Prototype UI/UX: Mantra Attendance

Domain: Sistem Informasi Absensi Karyawan PT Mantra Group.
Berkas: `information-architecture.md`, `wireframe.png`, `halaman-utama.dart`, `screenshot-halaman.png`, `catatan-keputusan-ui.md`.

## Refleksi
Bagian yang paling sulit dijaga konsistensinya adalah tata letak kartu status dan label status antara wireframe dan kode, karena di wireframe kartu status digambar selebar layar tetapi saat dijalankan di Flutter kartunya menyempit mengikuti isi teks sehingga tidak sejajar dengan kartu riwayat. Hal ini terjadi karena wireframe hanya menggambar posisi dan ukuran secara visual, sedangkan di kode ukuran widget dipengaruhi aturan layout Flutter yang baru terlihat setelah aplikasi dijalankan. Selain itu, setiap perubahan di kode, seperti warna status atau label tombol aksi, harus saya perbarui juga di catatan keputusan agar alasannya tetap sesuai dengan hasil akhirnya.

## Deklarasi penggunaan AI
Deklarasi penggunaan AI: Claude — membantu menyusun draf awal IA, wireframe, dan kode layar utama sebagai kerangka, serta merapikan draf refleksi; hasilnya dirumuskan ulang oleh penulis.