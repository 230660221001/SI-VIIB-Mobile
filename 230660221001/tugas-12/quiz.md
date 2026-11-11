# Quiz Pertemuan 12

**Soal 1:** Validasi client bertujuan untuk memberikan umpan balik cepat kepada pengguna dan mencegah request yang jelas salah. Namun, validasi client tidak cukup karena client dapat dimodifikasi (misalnya menggunakan Postman atau inspect element). Server tetap harus memvalidasi ulang untuk melindungi aturan bisnis dan basis data.

**Soal 2:** Mengirim token melalui `http://` sangat berisiko karena data dikirim dalam bentuk teks mentah (plaintext) dan bisa disadap oleh pihak ketiga (*Man-in-the-Middle attack*). Perbaikannya adalah dengan menggunakan protokol `https://` yang mengenkripsi data menggunakan TLS.

**Soal 3:** Token sebaiknya disimpan menggunakan `flutter_secure_storage` karena data dienkripsi oleh sistem operasi. Menyimpannya di source code atau log sangat berbahaya karena siapa pun yang memiliki akses ke repositori atau log dapat mencuri token tersebut. Saat pengguna logout, token wajib dihapus dari secure storage menggunakan fungsi `delete()`.

**Soal 4:** Meminta permission kamera saat aplikasi pertama kali dibuka melanggar prinsip *least privilege* dan dapat membuat pengguna curiga. Alur yang tepat adalah meminta permission hanya pada saat pengguna menekan tombol "Ambil Foto" di dalam form, dan menangani jika pengguna menolak izin tersebut.

**Soal 5:** 
1. Input divalidasi (Bukti: kode validator di `main.dart`).
2. HTTPS digunakan (Bukti: dokumentasi endpoint di `README.md`).
3. Token tidak ditulis di log (Bukti: tidak ada `print()` token).
4. Permission sesuai fitur (Bukti: `image_picker` hanya dipanggil saat form).
5. Pesan error tidak membocorkan data (Bukti: pesan error generik di `main.dart`).