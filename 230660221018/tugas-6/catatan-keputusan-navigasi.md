# Catatan Keputusan Navigasi SIPORA

Keputusan disusun berdasarkan kebutuhan pengguna untuk mengajukan surat observasi atau penelitian, mengisi data secara terstruktur, serta memperoleh umpan balik yang jelas ketika berinteraksi dengan aplikasi.

| Keputusan | Pilihan Anda | Alasan (merujuk IA/kebutuhan) |
|---|---|---|
| Nama route | Navigasi dari Beranda ke formulir menggunakan `Navigator.push` dan `MaterialPageRoute` melalui fungsi `_ajukanSurat()`. | Struktur informasi (IA) menempatkan formulir pengajuan sebagai tujuan utama dari tombol **Ajukan Surat** pada Beranda. Navigasi langsung memudahkan pengguna memulai pengajuan. |
| Data antarlayar | Formulir dibuka dari Beranda tanpa mengirim objek data pengajuan melalui `arguments`. Data yang diisi dikelola sementara oleh controller pada layar formulir. | Pada alur pengajuan saat ini, pengguna memulai pengisian dari formulir baru. Data pengajuan belum perlu diteruskan ke layar detail. |
| Validator tiap field | Field nama, NIM/NPM, semester, program studi, tempat, alamat, nomor WhatsApp, tanggal, dan topik divalidasi sesuai kebutuhan. Field mata kuliah divalidasi ketika diperlukan untuk pengajuan observasi. Anggota tambahan pada pengajuan kelompok juga harus diisi. | Validasi membantu memastikan data penting tidak terlewat dan membedakan kebutuhan penelitian skripsi individual dengan observasi yang dapat dilakukan secara berkelompok. |
| Feedback tiap aksi | Kesalahan input ditampilkan melalui pesan validasi pada formulir. Pemilihan tanggal menggunakan pemilih tanggal. Setelah data valid, ringkasan konfirmasi ditampilkan. Pengiriman simulasi menghasilkan `SnackBar` dan tidak diklaim sebagai penyimpanan permanen. | Umpan balik membantu pengguna memahami kesalahan, memeriksa kembali data, dan mengetahui hasil interaksi tanpa menimbulkan kesan bahwa surat telah disetujui atau tersimpan di server. |
| Navigasi kembali | Tombol kembali pada aplikasi atau navigasi kembali perangkat digunakan untuk kembali ke layar sebelumnya. | Pengguna perlu dapat kembali dari formulir ke Beranda tanpa kebingungan ketika ingin meninjau atau membatalkan proses pengajuan. |
| Pengelolaan controller | Controller untuk input teks dibersihkan melalui `dispose()` ketika layar formulir tidak lagi digunakan. | Pengelolaan controller yang tepat menjaga siklus hidup objek input dan mencegah sumber daya tetap digunakan setelah layar selesai. |

**Catatan implementasi:** Aplikasi pada tahap ini merupakan simulasi antarmuka dan interaksi. Data pengajuan belum dinyatakan tersimpan secara permanen, dan status konfirmasi bukan bukti bahwa surat telah disetujui oleh petugas.
