# Catatan Keputusan Data

Dokumen ini menjelaskan keputusan perancangan model dan pengelolaan data pada MVP awal aplikasi Lapor Fasilitas FTI.

| **Keputusan** | **Pilihan Anda** | **Alasan (merujuk kebutuhan)** |
|---|---|---|
| Field model | Menggunakan satu entitas `DataLaporan` dengan field `id`, `fasilitas`, `lokasi`, `deskripsi`, `status`, `tanggalLaporan`, `fotoPath`, `videoPath`, `catatan`, dan `fotoBuktiPath`. | Field disesuaikan dengan kebutuhan F-01 sampai F-07 dan F-10. Setiap field mendukung proses pelaporan, pengelolaan, atau pemantauan status laporan. |
| Kunci data (`id`) | Menggunakan `id` bertipe `String` yang dibuat secara unik oleh sistem. | ID digunakan untuk menemukan laporan saat proses Update dan Delete agar perubahan data tidak bergantung pada posisi laporan di dalam daftar. |
| Operasi CRUD per kebutuhan | Pelapor dapat Create dan Read laporan, Update isi laporan selama status masih `Menunggu`, serta Delete laporan sendiri selama status masih `Menunggu`. Petugas dapat Read laporan, Update status dan catatan penanganan, serta Delete laporan duplikat atau tidak valid melalui dialog konfirmasi. | Aturan ini memungkinkan Pelapor memperbaiki atau menghapus laporan yang belum ditangani. Petugas dapat mengelola laporan masuk. Fitur Delete merupakan pengembangan tambahan untuk memenuhi demonstrasi CRUD pada MVP Tugas 7, bukan kebutuhan fungsional wajib pada Tugas 4. |
| Keputusan persistensi | Data disimpan sementara menggunakan `List<DataLaporan>` di dalam `State` aplikasi dan setiap perubahan diperbarui menggunakan `setState()`. | Penyimpanan lokal dalam memori dipilih agar implementasi CRUD sederhana dan dapat diuji di DartPad tanpa package tambahan. Data akan kembali ke kondisi awal ketika aplikasi dijalankan ulang. |
| Pengelolaan lampiran | Menyediakan field nullable `fotoPath`, `videoPath`, dan `fotoBuktiPath`. | Field disiapkan untuk mendukung kebutuhan lampiran pada F-01, F-02, dan F-06. Pada MVP ini, pemilihan dan penyimpanan file sebenarnya belum diimplementasikan. |
| Pemilihan aktor | Menyediakan pilihan peran Pelapor dan Petugas pada halaman awal. Keduanya menggunakan sumber data laporan yang sama. | Tugas 5 dan 6 berfokus pada Pelapor. Pada Tugas 7, tampilan Petugas ditambahkan untuk menguji proses pengelolaan laporan sesuai kebutuhan Tugas 4. Pemilihan peran masih berupa simulasi dan belum menggunakan autentikasi akun. |

 