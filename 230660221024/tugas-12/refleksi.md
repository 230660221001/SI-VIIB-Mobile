# Refleksi Tugas 12

1. **Risiko keamanan paling penting pada project ini** adalah pengiriman data absensi melalui jaringan yang tidak aman dan kurangnya validasi input yang dapat menyebabkan *injection* atau data sampah masuk ke database.
2. **Mitigasi yang dipilih** adalah memastikan semua endpoint API menggunakan protokol HTTPS dan menerapkan validator yang ketat di sisi client (form) sebelum data dikirim ke server.
3. **Hal yang masih perlu diperbaiki** adalah implementasi penyimpanan token (seperti `flutter_secure_storage`) dan penghapusan token saat *logout* ketika fitur autentikasi pengguna nanti ditambahkan.

## Deklarasi Penggunaan AI
Deklarasi penggunaan AI: AI coding assistant — membantu menyusun logika validator dan tabel security checklist; seluruh aturan dan kode ditinjau ulang oleh penulis.