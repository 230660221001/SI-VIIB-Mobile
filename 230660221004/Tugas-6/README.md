# Tugas 6 — Navigation Flow dan Interaksi (PresentGo)

**Nama:** Rian R
**NIM:** 230660221004

## Deskripsi Tugas

Dokumen ini menghubungkan layar-layar PresentGo yang dirancang pada Tugas 5 menjadi alur yang dapat dijalankan, melanjutkan domain absensi organisasi PT Kencana Makmur Lestari. Isinya mencakup navigation flow (daftar route dan diagram Mermaid), implementasi Navigator dengan route bernama pada `form-interaksi.dart` (pengiriman data antarlayar, form pengajuan izin dengan validasi, dan feedback `SnackBar`), dua tangkapan layar bukti alur berjalan, serta catatan keputusan navigasi yang merujuk pada kebutuhan Tugas 4.

## Refleksi

Bagian yang paling sulit dipertahankan konsistensinya adalah antara navigation flow dan kode, khususnya pada penentuan layar mana yang berhak menampilkan tombol kembali: Beranda sebagai `initialRoute` tidak boleh memiliki tombol itu karena `Navigator.pop` pada layar pertama akan menutup aplikasi, sementara Detail Riwayat Absensi dan Form Pengajuan Izin wajib memilikinya karena keduanya dibuka melalui `push`. Keputusan ini harus ditulis ulang pada catatan-keputusan-navigasi.md agar penjelasannya tidak sekadar "ada tombol kembali", melainkan merujuk pada bagaimana stack Navigator bekerja. Proses menyamakan nama route antara diagram Mermaid dan peta `routes` pada kode juga memakan waktu karena satu kesalahan ketik saja membuat `pushNamed` gagal menemukan layar tujuan.

## Deklarasi Penggunaan AI

Deklarasi penggunaan AI: Claude (Anthropic) — membantu menyusun draf navigation flow, implementasi Navigator (route bernama, arguments, form validasi, SnackBar), dan catatan keputusan navigasi berdasarkan domain dan dokumen kebutuhan PresentGo yang sudah ditentukan penulis; keputusan akhir dan implementasi dirumuskan ulang oleh penulis.
