# Skenario Pengujian Fitur Perangkat

| Skenario | Expected Result | Actual Result |
|:---------|:----------------|:--------------|
| **Fitur berhasil digunakan** | Pengguna memilih foto dari galeri, gambar berhasil ditampilkan pada layar aplikasi. | (Tulis hasil asli Anda saat mencoba, misal: "Berhasil, gambar muncul.") |
| **Pengguna membatalkan aksi** | Pengguna menutup jendela pemilihan file tanpa memilih foto. Aplikasi tetap menampilkan tulisan "Belum ada foto dipilih" tanpa pesan error. | (Tulis hasil asli Anda) |
| **Permission ditolak** | *(Karena kita menggunakan target Web, tidak ada pop-up permission di aplikasi. Jika di Android, aplikasi akan menampilkan pesan error permission)*. | (Tulis hasil asli Anda) |
| **Package/Perangkat error** | Jika `image_picker` gagal memuat, muncul teks merah "Foto tidak dapat dipilih: [pesan error]". | (Tulis hasil asli Anda) |