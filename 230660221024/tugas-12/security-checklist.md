# Security Checklist — Aplikasi Absensi Organisasi Mahasiswa

| No. | Risiko atau pemeriksaan | Status | Bukti |
|:---:|:------------------------|:------:|:------|
| 1 | Input wajib divalidasi | Selesai | File `lib/main.dart` baris 45 (validator form nama, NIM, kegiatan) |
| 2 | Format input diperiksa | Selesai | Validasi NIM hanya angka (length 12) di `lib/main.dart` |
| 3 | HTTPS digunakan untuk data sensitif | Selesai | Endpoint `_baseUrl` menggunakan `https://` |
| 4 | Token tidak ditulis pada source code | Selesai | Tidak ada token hardcoded; API menggunakan data publik tiruan |
| 5 | Token tidak dicetak pada log | Selesai | Tidak ada `print()` atau `debugPrint()` yang mencetak token |
| 6 | Token dihapus saat logout | Belum | *(Fitur login/logout belum diimplementasikan pada MVP ini)* |
| 7 | Permission sesuai fitur | Selesai | `image_picker` hanya dipanggil saat tombol foto diklik (Tugas 11) |
| 8 | Permission ditolak ditangani | Selesai | Blok `try-catch` menangani pembatalan `XFile?` pada Tugas 11 |
| 9 | Pesan error tidak membocorkan data | Selesai | Error yang ditampilkan hanya pesan umum ("Gagal memuat data") |
| 10 | Dependency dan batasan didokumentasikan | Selesai | Terdapat pada file `README.md` |