# Skenario Pengujian Fitur Kamera/Galeri

| Skenario | Expected result | Actual result |
|:---|:---|:---|
| Fitur berhasil digunakan | File picker terbuka, gambar yang dipilih muncul di preview. | Sesuai. Gambar dari galeri muncul di layar dengan `Image.memory`. |
| Pengguna membatalkan aksi | File picker tertutup tanpa memilih. State loading berhenti. Tidak ada error. | Sesuai. Layar tetap menampilkan state kosong atau gambar sebelumnya. |
| Permission ditolak | Aplikasi menampilkan pesan error terkait permission. | (Tidak dapat diuji di web, diuji secara logika). |
| Package/Perangkat error | Aplikasi menangkap exception dan menampilkan pesan error. | (Diuji dengan simulasi blok try-catch). |