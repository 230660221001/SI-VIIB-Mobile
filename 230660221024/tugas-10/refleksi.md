# Refleksi Tugas 10

1. **Bagian integrasi data yang paling sulit:** Bagian tersulit adalah memastikan tipe data saat menggunakan `Future.wait`. Karena hasilnya berupa list dinamis (`List<Object>`), kita harus melakukan *type casting* manual (seperti `hasil[0] as List<DataAnggota>`) agar tidak terjadi error saat penggabungan data berdasarkan `userId`.
2. **Cara menangani response kosong atau error:** Saya menggunakan blok `try-catch`. Jika terjadi error jaringan, state `_pesanError` akan diisi, lalu UI menampilkan tombol "Coba Lagi". Jika data kosong (length == 0), UI akan menampilkan teks "Belum ada data absensi", sehingga tidak menampilkan pesan error yang membingungkan pengguna.
3. **Alasan pemisahan service dan widget:** Service memisahkan logika jaringan dan manipulasi data (JSON) dari widget UI. Ini membuat kode `main.dart` jauh lebih bersih, fokus pada tampilan, dan memudahkan *debugging* karena jika ada API yang error, kita tahu masalahnya ada di dalam file Service.

## Deklarasi Penggunaan AI
Deklarasi penggunaan AI: AI coding assistant — membantu menyusun logika penggabungan `Future.wait` dan pemetaan data berdasarkan `userId`; seluruh alur, kode, dan dokumentasi ditinjau ulang oleh penulis.