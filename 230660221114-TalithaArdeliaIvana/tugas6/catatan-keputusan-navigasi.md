# Catatan Keputusan Navigasi
## Aplikasi Akademik PKBM Al Qosimmiyah

| **Keputusan** | **Pilihan Anda** | **Alasan (merujuk IA/kebutuhan)** |
|---|---|---|
| Nama route | Menggunakan named routes `/`, `/nilai`, `/jadwal`, `/ujian`, dan `/detail-nilai` dengan `/` sebagai initial route. | Beranda menjadi halaman utama aplikasi. Route Nilai, Jadwal, dan Ujian disediakan untuk mengakses layanan akademik, sedangkan `/detail-nilai` digunakan untuk menampilkan informasi nilai secara lebih lengkap. |
| Navigasi halaman | Menggunakan `NavigationBar` dan `IndexedStack` untuk berpindah antara Beranda, Nilai, Pelajaran, dan Ujian. | Empat menu utama memudahkan siswa atau warga belajar mengakses informasi akademik. `IndexedStack` membantu mempertahankan halaman ketika pengguna berpindah menu. |
| Data antarlayar | Menggunakan objek `DetailNilaiArgs` melalui `Navigator.pushNamed()` dengan parameter `arguments` dari halaman Nilai Akademik menuju Detail Nilai. | Kebutuhan F-02 mengharuskan pengguna dapat melihat informasi nilai akademik secara lebih lengkap, termasuk nama mata pelajaran, kode pelajaran, dan nilai. |
| Validator tiap field | Nama mata pelajaran wajib diisi dan tidak boleh hanya berisi spasi. | Form pencarian nilai membutuhkan nama mata pelajaran sebagai input. Validasi membantu memastikan pengguna memasukkan data sebelum pencarian dilakukan. |
| Feedback tiap aksi | Input kosong menampilkan pesan validator. Mata pelajaran ditemukan akan membuka halaman Detail Nilai. Mata pelajaran tidak ditemukan menampilkan `SnackBar`. | Feedback membantu pengguna mengetahui kesalahan input dan hasil pencarian. Hal ini mendukung kemudahan penggunaan aplikasi akademik. |
| Navigasi kembali | Menggunakan `Navigator.pop(context)` pada tombol kembali di halaman Detail Nilai. | Memudahkan pengguna kembali ke halaman Nilai Akademik setelah melihat informasi detail tanpa harus memulai kembali aplikasi. |