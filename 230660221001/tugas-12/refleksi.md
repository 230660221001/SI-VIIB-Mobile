# Refleksi Tugas 12

1. Risiko keamanan paling penting pada project adalah kebocoran token akses pengguna dan injeksi data melalui form input yang tidak divalidasi.
2. Mitigasi yang dipilih adalah dengan menerapkan validasi berlapis (client-side menggunakan `Form` dan regex, serta rencana validasi server-side), menyamarkan pesan error sistem, dan menggunakan `flutter_secure_storage` untuk menyimpan token.
3. Hal yang masih perlu diperbaiki adalah implementasi alur *refresh token* (jika menggunakan JWT) dan penambahan pengujian otomatis (unit test) untuk setiap validator.