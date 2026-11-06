# Bug Report

| Bagian | Isi |
|:-------|:----|
| **ID bug** | BUG-01 |
| **Skenario reproduksi** | 1. Buka aplikasi.<br>2. Isi semua form dengan data valid.<br>3. Klik tombol "Simpan Absensi" dua kali berturut-turut dengan sangat cepat. |
| **Expected result** | Data absensi hanya tersimpan satu kali. |
| **Actual result** | Data absensi tersimpan dua kali (ganda) karena tombol masih bisa ditekan saat proses penyimpanan berjalan. |
| **Dugaan penyebab** | Tombol (`FilledButton`) tidak dinonaktifkan saat proses *async* sedang berjalan, sehingga pengguna bisa memicu fungsi `_simpan` berulang kali. |
| **Perbaikan** | Menambahkan variabel state `_sedangMenyimpan`. Jika nilainya `true`, maka `onPressed` pada tombol diubah menjadi `null` (nonaktif) dan teks berubah menjadi "Menyimpan...". |
| **Test regresi** | TC-06 (Menekan tombol 2x dengan cepat). |