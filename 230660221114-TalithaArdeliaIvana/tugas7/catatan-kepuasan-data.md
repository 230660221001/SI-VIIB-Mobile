# Catatan Keputusan Data

Dokumen ini menjelaskan keputusan perancangan model dan pengelolaan data pada MVP awal aplikasi **Akademik PKBM Al Qosimmiyah**, khususnya pada fitur Catatan Belajar yang ditujukan untuk siswa atau warga belajar.

| **Keputusan** | **Pilihan Anda** | **Alasan (Merujuk Kebutuhan)** |
|---|---|---|
| Field model | Menggunakan satu entitas `CatatanBelajar` dengan field `id`, `judul`, `isi`, `diperbarui`, dan `disematkan`. | Field disesuaikan dengan kebutuhan warga belajar untuk membuat, melihat, mengubah, menghapus, dan menyematkan catatan materi atau informasi belajar. |
| Kunci data (`id`) | Menggunakan `id` bertipe `int` yang dibuat secara berurutan oleh sistem. | ID digunakan untuk menemukan catatan saat proses Update dan Delete agar perubahan data tidak bergantung pada posisi catatan di dalam daftar. |
| Operasi CRUD | Warga belajar dapat Create catatan baru, Read daftar catatan, Update judul dan isi catatan, serta Delete catatan melalui dialog konfirmasi. | Operasi CRUD memungkinkan warga belajar mengelola catatan belajar secara mandiri. Penghapusan dilengkapi konfirmasi untuk menghindari penghapusan yang tidak disengaja. |
| Fitur sematkan (Pin) | Menambahkan field `disematkan` bertipe `bool` untuk menentukan apakah catatan disematkan atau tidak. | Fitur ini membantu warga belajar memprioritaskan catatan penting agar tetap berada di bagian atas daftar meskipun jumlah catatan semakin banyak. |
| Pengurutan catatan | Catatan dengan nilai `disematkan = true` ditampilkan lebih dahulu, kemudian diikuti catatan yang tidak disematkan. | Pengurutan memudahkan warga belajar menemukan catatan penting tanpa harus mencari satu per satu di antara banyak catatan. |
| Keputusan persistensi | Data disimpan sementara menggunakan `List<CatatanBelajar>` di dalam `State` aplikasi dan setiap perubahan diperbarui menggunakan `setState()`. | Penyimpanan lokal dalam memori dipilih agar implementasi CRUD sederhana dan dapat diuji tanpa package tambahan. Data akan kembali ke kondisi awal ketika aplikasi dijalankan ulang. |
| Pengelolaan tanggal | Menggunakan field `diperbarui` bertipe `DateTime`. | Tanggal digunakan untuk menampilkan informasi kapan catatan terakhir dibuat atau diperbarui sehingga warga belajar dapat mengetahui catatan yang paling baru. |
| Pemilihan aktor | Fitur Catatan Belajar ditujukan kepada siswa atau warga belajar sebagai pengguna aplikasi. | Aplikasi Akademik PKBM Al Qosimmiyah dirancang untuk membantu warga belajar mengakses informasi akademik dan mengelola catatan belajar pribadi, bukan untuk pengelolaan oleh admin. |

## Kesimpulan

Model `CatatanBelajar` dan penyimpanan `List<CatatanBelajar>` secara lokal dipilih untuk memenuhi kebutuhan MVP awal. Model ini mendukung operasi CRUD serta fitur sematkan (Pin) agar warga belajar dapat mengelola dan memprioritaskan catatan penting. Catatan yang disematkan akan ditampilkan di bagian atas daftar. Implementasi menggunakan penyimpanan dalam memori sehingga dapat diuji tanpa memerlukan backend atau database tambahan. Data akan kembali ke kondisi awal ketika aplikasi dijalankan ulang.