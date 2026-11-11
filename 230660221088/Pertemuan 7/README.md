# Tugas 7 — MVP Awal dengan Data Lokal

**Aplikasi:** Pendataan Bencana BPBD Kabupaten Sumedang  
**Mata Kuliah:** Pengembangan Aplikasi Bergerak (PAB)  
**NIM:** 230660221088  
**Nama:** Muhammad Panji Adhitya  
**Kelas:** SI-VIIB  

## Deskripsi

Tugas 7 mengembangkan dashboard BPBD dari `Dashboard.dart` yang telah digunakan pada Tugas 6. Pengembangan berfokus pada model `KejadianBencana` dan pengelolaan data lokal melalui operasi Create, Read, Update, dan Delete. Data kejadian dikelola dalam daftar in-memory; data contoh laporan masyarakat pada dashboard tetap statis dan terpisah dari CRUD utama.

## Daftar Berkas

- `model-data.md` — entitas, field, tipe data, sumber nilai, dan pemetaan ke kebutuhan Tugas 4.
- `crud-lokal.dart` — kode Flutter berbasis Dashboard.dart dengan model data dan CRUD lokal.
- `screenshot-daftar-bencana.png` — ganti placeholder dengan screenshot aplikasi yang berjalan dan menampilkan data hasil tambah.
- `screenshot-hapus-data.png` — ganti placeholder dengan screenshot dialog konfirmasi penghapusan dari aplikasi yang berjalan.
- `catatan-keputusan-data.md` — alasan pemilihan model, ID, operasi CRUD, dan penyimpanan.

## Cara Menjalankan

1. Buat proyek Flutter baru atau gunakan proyek Flutter yang sudah tersedia.
2. Salin isi `crud-lokal.dart` ke `lib/main.dart`.
3. Jalankan dari root proyek:

   ```bash
   flutter run -d chrome
   ```

4. Login pada halaman demo menggunakan email berformat email dan kata sandi minimal enam karakter.
5. Tekan **Catat Kejadian**, isi empat kolom wajib, lalu kirim. Pastikan kejadian baru muncul pada bagian **Kejadian Dicatat Petugas**.
6. Gunakan menu tiga titik pada kartu kejadian untuk memilih **Ubah** atau **Hapus**.
7. Pilih **Ubah** untuk mengganti informasi atau status (`Pemantauan`, `Penanganan`, `Selesai`); pilih **Hapus** untuk menguji dialog konfirmasi.
8. Ambil screenshot asli untuk `screenshot-daftar.png` dan `screenshot-hapus.png`, lalu ganti gambar placeholder.

## Refleksi

Bagian paling sulit adalah menjaga field model tetap sesuai dengan informasi yang benar-benar dikumpulkan oleh form pencatatan petugas. Tantangan berikutnya adalah memastikan Update dan Delete menggunakan ID unik, bukan index daftar, agar perubahan tidak mengenai kejadian yang salah. Konsistensi tersebut penting karena F-04 membutuhkan pencatatan kejadian, sedangkan F-06 membutuhkan pembaruan status penanganan pada data kejadian yang sama.

## Deklarasi Penggunaan AI

Deklarasi penggunaan AI: ChatGPT — membantu meninjau file Dashboard.dart, menjelaskan kebutuhan model dan CRUD, serta memeriksa konsistensi field, ID, dan operasi data; implementasi disesuaikan dengan struktur proyek BPBD.

## Batasan Prototype

CRUD utama menggunakan penyimpanan in-memory tanpa package tambahan. Data tetap tersedia selama aplikasi berjalan dan saat logout/login, tetapi akan hilang setelah aplikasi di-restart.
