# Security Checklist — Tugas 12

| No. | Risiko atau pemeriksaan | Status | Bukti |
|:---:|:------------------------|:------:|:------|
| 1 | Input wajib divalidasi | Selesai | `main.dart` baris 44-48 (validator nama) |
| 2 | Format input diperiksa | Selesai | `main.dart` baris 51-57 (RegExp nomor HP) |
| 3 | HTTPS digunakan untuk data sensitif | Selesai | Simulasi endpoint HTTPS di `main.dart`, dokumentasi di `README.md` |
| 4 | Token tidak ditulis pada source code | Selesai | Token disimulasikan didapat dari API, bukan *hardcoded* permanen |
| 5 | Token tidak dicetak pada log | Selesai | Tidak ada `print()` yang membocorkan token |
| 6 | Token dihapus saat logout | Sebagian | Rencana alur logout dijelaskan di `refleksi.md` |
| 7 | Permission sesuai fitur | Selesai | Fitur kamera hanya dipanggil jika user menekan tombol lampiran (pada Tugas 11) |
| 8 | Permission ditolak ditangani | Selesai | `try-catch` pada akses penyimpanan aman dan API |
| 9 | Pesan error tidak membocorkan data | Selesai | `main.dart` baris 89 (error disamarkan) |
| 10 | Dependency dan batasan didokumentasikan | Selesai | Terdapat pada `README.md` |