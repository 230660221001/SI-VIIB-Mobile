# Tugas 6 — Navigation Flow dan Interaksi

**Aplikasi:** SI Pendataan Bencana BPBD Kabupaten Sumedang  
**Mata Kuliah:** Pengembangan Aplikasi Bergerak (PAB)  
**NIM:** 230660221088  
**Nama:** Muhammad Panji Adhitya  
**Kelas:** SI-VIIB    


## Deskripsi

Tugas ini menghubungkan layar SI Pendataan Bencana BPBD dari Tugas 5 menggunakan named route Flutter. Implementasi mencakup login petugas demo, daftar laporan masuk, detail laporan yang menerima objek melalui `arguments`, serta form pencatatan kejadian dengan validasi. Setelah form valid dikirim, objek `KejadianBencana` dikembalikan ke dashboard melalui `Navigator.pop`; dashboard memeriksa tipe hasil, menambahkan kejadian ke daftar menggunakan `setState()`, dan menampilkan `SnackBar` konfirmasi. Data pencatatan manual tersedia selama sesi aplikasi berjalan dan belum disimpan secara permanen.

## Daftar Berkas

- `navigation-flow.md` — daftar sembilan route, initial route, diagram Mermaid, pengiriman dan pengembalian data, serta batasan prototype.
- `form-interaksi.dart` — aplikasi Flutter dengan named route, pemeriksaan arguments, form, validator, pengembalian objek kejadian, pembaruan dashboard, dan SnackBar.
- `screenshot-alur.png` — bukti layar detail laporan yang terbuka dari daftar; **file yang disertakan masih preview dan harus diganti dengan screenshot dari aplikasi yang benar-benar dijalankan**.
- `screenshot-feedback.png` — bukti feedback setelah pengiriman form; **file yang disertakan masih preview dan harus diganti dengan screenshot SnackBar dari aplikasi yang benar-benar dijalankan**.
- `catatan-keputusan-navigasi.md` — alasan route, pengiriman dan pengembalian data, perbaikan tipe route, validator, pembaruan dashboard, serta feedback.

## Cara Menjalankan

1. Buat proyek Flutter atau gunakan proyek Flutter yang sudah tersedia.
2. Salin isi `form-interaksi.dart` ke `lib/main.dart`.
3. Jalankan dari root proyek:

   ```bash
   flutter run -d chrome
   ```

4. Pada halaman login demo, masukkan email dengan format yang memuat `@` dan kata sandi minimal 6 karakter. Login ini hanya validasi lokal, bukan autentikasi ke server.
5. Pada dashboard, ketuk kartu laporan untuk membuka detail. Gunakan tombol kembali untuk kembali ke daftar.
6. Tekan **Catat Kejadian**. Coba kirim form kosong untuk menguji validator.
7. Isi jenis bencana, lokasi, tanggal/waktu, dan deskripsi. Deskripsi minimal 15 karakter. Kontak bersifat opsional; jika diisi, minimal 8 karakter.
8. Tekan **Kirim Pencatatan**. Setelah berhasil, aplikasi kembali ke dashboard, menambahkan data pada bagian **Kejadian Dicatat Petugas**, dan menampilkan `SnackBar` konfirmasi.
9. Ketuk kartu kejadian baru untuk membuka halaman Detail Kejadian Bencana.
10. Ambil screenshot asli untuk layar detail dan SnackBar, lalu ganti file preview yang disertakan.

## Perbaikan Selama Pengembangan

Pada pengujian awal, tombol Catat Kejadian gagal membuka form karena pemanggilan `pushNamed<KejadianBencana>` tidak cocok dengan tipe route yang dibuat melalui `MaterialApp.routes`. Pemanggilan tersebut diperbaiki menjadi `pushNamed<dynamic>`, kemudian hasil navigasi diperiksa dengan `hasil is KejadianBencana`. Setelah perbaikan, objek hasil form dapat dikembalikan melalui `Navigator.pop(context, kejadianBaru)`, diterima oleh dashboard, dan ditambahkan ke daftar dengan `setState()`.

## Batasan Prototype

Login hanya melakukan validasi lokal dan belum mengautentikasi pengguna terhadap server. Daftar laporan awal masih berupa data demonstrasi statis. Kejadian yang dicatat petugas ditambahkan ke list dalam memori aplikasi, sehingga data terlihat selama aplikasi berjalan tetapi hilang ketika aplikasi ditutup atau di-restart. Data pencatatan manual ditampilkan terpisah dari daftar laporan masyarakat. Detail laporan dan kejadian masih read-only; perubahan status verifikasi dan status penanganan belum diaktifkan. Route masyarakat ikut didaftarkan agar konsisten dengan Information Architecture, tetapi form laporan masyarakat dan cek status masih berupa kerangka navigasi.

## Refleksi

Bagian paling sulit adalah menjaga konsistensi nama route dan tipe data ketika informasi berpindah antarlayar. Pada pengujian, pemanggilan `pushNamed<KejadianBencana>` menimbulkan TypeError karena route dari `MaterialApp.routes` bertipe `Route<dynamic>`, sehingga hasil navigasi perlu diambil sebagai `dynamic` lalu diperiksa tipenya. Setelah diperbaiki, objek kejadian dapat dikembalikan ke dashboard dan ditampilkan dengan `setState()`, sehingga alur pencatatan lebih sesuai dengan kebutuhan petugas.

## Deklarasi Penggunaan AI

Deklarasi penggunaan AI: ChatGPT — membantu menyusun pemetaan route, membuat dan meninjau kode Flutter, menganalisis TypeError pada named route dan menyusun validator.
