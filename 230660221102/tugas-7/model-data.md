# Model Data — Mantra Attendance

## 1. Entitas Data

### Entitas: `DataKehadiran` (satu catatan absensi satu hari)

| Field | Tipe | Kebutuhan yang dipenuhi | Sumber nilai | Alasan diperlukan |
|---|---|---|---|---|
| `id` | String | F-04, F-05, F-08 | Sistem (`millisecondsSinceEpoch` saat check-in) | Kunci unik untuk menemukan catatan saat check-out (update) dan hapus (delete). Index daftar tidak dipakai karena berubah setelah data dihapus. |
| `tanggal` | String | F-02, F-05, F-07 | Sistem (tanggal hari berjalan saat check-in) | Menentukan apakah karyawan sudah punya catatan hari ini (syarat F-03 dan F-04), dan mendukung penelusuran berdasarkan tanggal (kebutuhan Dina). |
| `lokasi` | String | F-03 | Form check-in | Menunjukkan tempat kerja saat absen, supaya catatan kehadiran bermakna bagi karyawan maupun admin. |
| `jamMasuk` | String (`HH:mm`) | F-03, F-06 | Form check-in (terisi otomatis dari jam sekarang, dapat diubah) | Bukti waktu kehadiran masuk dan dasar penentuan status. |
| `jamKeluar` | String (`HH:mm` atau `-`) | F-04 | Sistem saat check-out; bernilai `-` sebelum check-out | Melengkapi catatan harian. Nilai `-` menandakan belum check-out. |
| `status` | String (`Hadir` / `Terlambat` / `Alpa`) | F-06 | Perhitungan: `jamMasuk` dibandingkan batas 08:00 | Hasil absensi yang ditampilkan sebagai label berwarna (F-02, F-06). Status `Alpa` hanya muncul pada data contoh. |

## 2. Aturan Bisnis pada Data

| Aturan | Sumber | Implementasi |
|---|---|---|
| Check-in hanya bila belum ada catatan hari ini | F-03 | Tombol aksi berlabel "Check-in" hanya bila tidak ada catatan dengan `tanggal` hari ini |
| Check-out hanya bila sudah check-in dan `jamKeluar` masih `-` | F-04 | Tombol aksi berlabel "Check-out" hanya bila ada catatan hari ini yang belum keluar |
| Setelah check-out, tombol aksi nonaktif | F-04 | Tombol berlabel "Selesai" dan `onPressed` bernilai `null` |
| `jamMasuk` lebih dari 08:00 berarti `Terlambat` | F-06 (batas 08:00 adalah asumsi prototype) | Perbandingan teks `HH:mm` |

## 3. Peta CRUD ke Kebutuhan

| Operasi | Aksi pada aplikasi | Kebutuhan |
|---|---|---|
| Create | Kirim form Check-in membuat `DataKehadiran` baru | F-03 |
| Read | Dashboard menampilkan status hari ini dan daftar riwayat; layar Detail menampilkan satu catatan | F-02, F-05, F-06 |
| Update | Check-out mengganti objek catatan hari ini dengan `jamKeluar` terisi | F-04 |
| Delete | Hapus catatan dengan konfirmasi `AlertDialog` (menyerupai koreksi data) | F-08 |

## 4. Kebutuhan yang Tidak Dapat Dipenuhi CRUD Lokal (kandidat backend)

| Kebutuhan | Alasan |
|---|---|
| F-01 Login | Autentikasi akun membutuhkan data akun dan verifikasi di server |
| F-07 Admin memantau data kehadiran karyawan | Admin harus melihat data banyak karyawan, sedangkan data lokal hanya ada di satu perangkat |
| F-08 Koreksi oleh admin | Pada aplikasi nyata hanya admin yang boleh mengoreksi data milik karyawan lain. Pada prototype, hapus tersedia dari daftar sebagai simulasi. |
