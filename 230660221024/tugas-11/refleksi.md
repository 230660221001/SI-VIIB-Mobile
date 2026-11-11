# Refleksi Tugas 11

1. **Alasan teknis pemilihan fitur:** Fitur kamera/galeri dipilih karena absensi tidak hanya sekadar menekan tombol, tetapi membutuhkan bukti visual bahwa anggota benar-benar hadir di lokasi. Ini menutup celah kecurangan absensi (titip absen).
2. **Kesulitan konfigurasi:** Tantangan terbesar adalah membedakan antara pengguna yang membatalkan pemilihan foto (mengembalikan nilai `null`) dengan package yang mengalami error (melempar *Exception*). Jika `null` dianggap error, aplikasi akan menampilkan pesan error yang salah. 
3. **Pemisahan Service:** Saya memisahkan `FotoService` dari UI agar widget tidak perlu tahu bagaimana cara memanggil kamera. Widget hanya meminta foto, dan service yang mengurus proses pengambilannya.

## Deklarasi Penggunaan AI
Deklarasi penggunaan AI: AI coding assistant — membantu menyusun logika penanganan `XFile` dan preview `Image.memory` untuk target Web; seluruh alur dan kode ditinjau ulang oleh penulis.