# Tugas 7 — MVP Awal dengan Data Lokal

## Identitas
- **Nama:** Ghatan Zalfaa Kautsar
- **NIM:** 230660221001
- **Mata Kuliah:** Pemrograman Aplikasi Bergerak (PAB)
- **Pertemuan:** 7
- **Domain:** Sistem Penjualan Beras di Pabrik BSM

## Deskripsi Tugas
Tugas ini mengimplementasikan MVP awal aplikasi Sistem Penjualan Beras BSM dengan model data `DataPesanan` dan operasi CRUD lokal. Data pesanan dibuat dari form (Create), ditampilkan pada daftar (Read), dapat diubah statusnya dan diberi nomor resi (Update), serta dapat dihapus dengan konfirmasi (Delete). Persistensi menggunakan `shared_preferences` agar data bertahan setelah aplikasi ditutup.

## Berkas
- `model-data.md` — Daftar entitas, field, tipe, sumber nilai, kebutuhan
- `crud-lokal.dart` — Implementasi CRUD lokal Flutter
- `screenshot-daftar.png` — Screenshot daftar pesanan dengan data hasil tambah
- `screenshot-hapus.png` — Screenshot dialog konfirmasi hapus
- `catatan-keputusan-data.md` — Keputusan data beserta alasan
- `README.md` — Berkas ini

## Refleksi
Bagian yang paling sulit saya pertahankan konsistensinya adalah **keselarasan antara field model data, kebutuhan Tugas 4, dan sumber nilai setiap field**, karena satu field yang tidak memiliki kebutuhan jelas akan membuat seluruh entitas tampak dibuat tanpa alasan. Saya juga sempat bingung antara menyimpan `nomorResi` sebagai field `String` biasa atau `String?` (nullable) — keputusan nullable dipilih karena nomor resi baru ada setelah karyawan mengirim pesanan, bukan saat pesanan dibuat. Setelah menyelesaikannya, saya memahami bahwa model data berfungsi sebagai kontrak yang menghubungkan kebutuhan (Tugas 4), alur navigasi (Tugas 6), dan implementasi CRUD (Tugas 7).