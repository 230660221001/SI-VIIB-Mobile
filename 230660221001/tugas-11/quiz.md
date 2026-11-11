# Quiz Pertemuan 11 — Fitur Perangkat Sesuai Kebutuhan

## Soal 1 — Pemilihan Fitur
Saya memilih fitur **Kamera dan Galeri (`image_picker`)**. Fitur ini dipilih berdasarkan tujuan pengguna, yaitu Konsumen (Rani) yang perlu mengunggah foto bukti transfer pembayaran beras. Pada proses bisnis sebelumnya, pengguna harus memotret bukti transfer, lalu mengirimkannya secara manual melalui WhatsApp ke admin, yang rawan tertukar. Dengan fitur ini, aplikasi dapat mengakses kamera langsung atau galeri ponsel, dan menghasilkan data keluaran berupa file gambar (`XFile`), yang kemudian dapat dikirim ke backend untuk diverifikasi.

## Soal 2 — Permission
Fitur perangkat memerlukan permission (izin) untuk melindungi privasi dan keamanan pengguna, karena fitur seperti kamera dan galeri mengakses data sensitif pada perangkat.
Kondisi yang harus ditangani aplikasi:
1. **Diminta:** Aplikasi memunculkan dialog izin standar OS. Pengguna memilih "Izinkan".
2. **Ditolak:** Pengguna menekan "Tolak". Aplikasi tidak boleh *crash*, melainkan menampilkan pesan yang informatif dan mengarahkan pengguna ke halaman Pengaturan (Settings) jika ingin mengizinkan secara manual.
3. **Tidak tersedia:** Perangkat tidak memiliki kamera (misal dijalankan di web/Chrome). Aplikasi harus menyediakan alternatif fallback (misalnya hanya menampilkan tombol "Pilih dari Galeri").

## Soal 3 — Pembatalan Pemilihan
Nilai `XFile?` yang bernilai `null` berarti pengguna **membatalkan aksi** (menekan tombol "Cancel" atau "Batal") pada dialog kamera atau galeri, bukan berarti terjadi error.
Aplikasi harus merespons dengan:
1. Mematikan indikator loading (`setState` mengubah status loading menjadi `false`).
2. Mempertahankan state gambar sebelumnya (jika ada).
3. **Tidak** menampilkan pesan error berwarna merah, karena ini adalah aksi yang disengaja oleh pengguna.

## Soal 4 — Service Layer
Tanggung jawab service layer adalah menangani inisialisasi package perangkat, memanggil fungsi fitur perangkat (seperti `pickImage`), dan menangkap (*catch*) error atau exception yang mungkin terjadi.
Pemanggilan package dan pengelolaan permission tidak boleh ditulis langsung di dalam widget karena:
1. **Separation of Concerns (Pemisahan Tanggung Jawab):** Widget seharusnya hanya fokus pada tampilan UI, bukan logika perangkat yang kompleks.
2. **Reusability (Dapat Digunakan Ulang):** Jika di halaman lain butuh mengambil gambar, kita tinggal memanggil service tanpa menulis ulang kode kamera.
3. **Testability (Mudah Diuji):** Logika perangkat terisolasi sehingga lebih mudah di-unit test.

## Soal 5 — State Fitur Perangkat
State minimal yang perlu ditangani saat menggunakan fitur perangkat:
1. `Loading` (indikator proses).
2. `Success` (data berhasil didapatkan).
3. `Error` (terjadi kegagalan sistem/package).

Perbedaan perlakuan untuk kondisi tersebut:
*   **Berhasil:** Menampilkan preview gambar atau nama file.
*   **Dibatalkan:** Mematikan loading dan membiarkan tampilan UI tetap seperti sebelumnya (tidak memunculkan error).
*   **Permission Ditolak:** Menampilkan pesan peringatan khusus yang menjelaskan bahwa aplikasi butuh izin untuk mengakses kamera/galeri, beserta instruksi cara mengaktifkannya di pengaturan perangkat.