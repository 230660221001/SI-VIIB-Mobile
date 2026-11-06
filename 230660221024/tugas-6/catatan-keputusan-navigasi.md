# Catatan Keputusan Navigasi — Tugas 6

| Keputusan | Pilihan Anda | Alasan (merujuk IA/kebutuhan) |
|:--|:--|:--|
| **Nama route** | `/`, `/detail`, `/check-in` | Menggunakan nama yang deskriptif dan *case-sensitive* agar mudah dilacak dari diagram ke kode (F-01, F-03). |
| **Data antarlayar** | Mengirim objek `DataKegiatan` via `arguments` | Halaman detail dan form butuh tahu *kegiatan mana* yang dipilih. Data ini dibaca sebagai *read-only* dengan validasi `is DataKegiatan` untuk mencegah error null. |
| **Validator tiap field** | `Nama` dan `NIM` wajib diisi (tidak boleh kosong/spasi) | Mencegah data absensi masuk dengan nama atau NIM kosong (kebutuhan F-03). |
| **Feedback tiap aksi** | `SnackBar` muncul setelah check-in berhasil | Memberikan konfirmasi visual kepada pengguna bahwa kehadirannya sudah tercatat di sistem sebelum layar ditutup (`pop`). |