# 1.4 Catatan Keputusan Navigasi

| **Keputusan** | **Pilihan Anda** | **Alasan (merujuk IA/kebutuhan)** |
|---|---|---|
| Nama route | Menggunakan named routes `/`, `/form`, dan `/detail` dengan `/` sebagai initial route. | Beranda menjadi pusat aktivitas pelapor. Pemisahan route form dan detail membuat struktur navigasi lebih terorganisasi dan sesuai dengan Information Architecture (IA) aplikasi. |
| Data antarlayar | Menggunakan objek `DataLaporan` melalui `Navigator.pop(context, laporanBaru)` dari Form ke Beranda dan `arguments` dari Beranda ke Detail. | Kebutuhan F-01 mengharuskan data laporan dikirim setelah pelapor membuat laporan. Kebutuhan F-07 mengharuskan pelapor dapat melihat informasi dan status laporan. |
| Validator tiap field | Jenis fasilitas wajib dipilih, lokasi wajib dipilih, dan deskripsi wajib diisi dengan maksimal 200 karakter. Foto dan video bersifat opsional. | Kebutuhan F-01 mencakup informasi fasilitas, lokasi, deskripsi, dan foto sebagai lampiran opsional. Validasi membantu memastikan informasi utama laporan tersedia sebelum dikirim. |
| Feedback tiap aksi | Form kosong menampilkan pesan validasi. Pengiriman laporan berhasil menampilkan SnackBar di Beranda. Tombol lampiran menampilkan informasi bahwa fitur belum diintegrasikan. | Feedback membantu pengguna mengetahui kesalahan pengisian, memperoleh konfirmasi pengiriman, dan memahami kondisi fitur yang tersedia. Hal ini mendukung kemudahan penggunaan sesuai kebutuhan NF-02. |

