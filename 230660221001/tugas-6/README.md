# Tugas 6 — Navigation Flow dan Interaksi

## Identitas
- **Nama:** Ghatan Zalfaa Kautsar
- **NIM:** 230660221001
- **Mata Kuliah:** Pemrograman Aplikasi Bergerak (PAB)
- **Pertemuan:** 6
- **Domain:** Sistem Penjualan Beras di Pabrik BSM

## Deskripsi Tugas
Tugas ini menghubungkan layar-layar prototype dari Tugas 5 menjadi alur bernavigasi dengan route bernama (`/`, `/detail`, `/form`), pengiriman data via `arguments`, form pesanan dengan validasi tiap field, dan feedback `SnackBar` setelah aksi kirim. Alur utama: katalog beras → detail beras (read-only) dan katalog → form pesanan.

## Berkas
- `navigation-flow.md` — Daftar route dan diagram alur
- `form-interaksi.dart` — Kode Flutter alur bernavigasi
- `screenshot-alur.png` — Screenshot layar detail terbuka dari daftar
- `screenshot-feedback.png` — Screenshot SnackBar setelah kirim form
- `catatan-keputusan-navigasi.md` — Keputusan navigasi beserta alasan
- `README.md` — Berkas ini

## Refleksi
Bagian yang paling sulit saya pertahankan konsistensinya adalah **kesesuaian antara nama route pada navigation flow, peta `routes` di `MaterialApp`, dan pemanggilan `Navigator.pushNamed`**, karena ketiganya harus sama persis (case-sensitive) agar navigasi berjalan — sebuah typo kecil seperti `/Detail` alih-alih `/detail` membuat aplikasi menampilkan error tanpa jejak yang jelas. Saya juga sempat lupa menambahkan `dispose` pada controller, padahal `FormPesanan` adalah `StatefulWidget` yang membuka sumber daya saat dibuat. Setelah menyelesaikannya, saya memahami bahwa catatan keputusan navigasi berfungsi sebagai jembatan yang menjaga konsistensi antara IA Tugas 5, navigation flow, dan implementasi kode.