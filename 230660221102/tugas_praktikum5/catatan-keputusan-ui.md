# Catatan Keputusan UI/UX — Mantra Attendance

| Keputusan | Pilihan Anda | Alasan (merujuk kebutuhan/persona/prinsip) |
|---|---|---|
| Warna benih | `Colors.indigo` via `ColorScheme.fromSeed` | Kesan profesional untuk aplikasi kantor PT Mantra Group. Palet dihasilkan dari satu warna sehingga komponen konsisten (prinsip konsistensi) dan kontras teks terjaga (prinsip keterbacaan). |
| Bentuk status | `Chip` berwarna: Hadir = primaryContainer, Terlambat = tertiaryContainer, Alpa = errorContainer; warna dari `colorScheme` | Raka perlu tahu status kehadirannya tanpa membaca detail (F-02, F-05, F-06). Label berwarna dipakai konsisten di semua baris riwayat. |
| Posisi aksi utama | `FloatingActionButton.extended` di kanan bawah, label berganti Check-in / Check-out | Persona Raka tidak ingin banyak langkah (NF-01) dan memakai satu tangan. Posisi bawah mudah dijangkau jempol dan ukurannya memenuhi target sentuh 48 dp. Satu aksi utama per layar. |
| Hierarki teks | Salam `headlineSmall` tebal, status hari ini `titleLarge`, tanggal dan keterangan `bodyMedium` redup (`onSurfaceVariant`), semua dari `textTheme` | Informasi terpenting (status hari ini) paling menonjol, keterangan sekunder lebih kecil dan redup (prinsip hierarki visual). |
| Feedback aksi | `SnackBar` setelah check-in/check-out, kartu status berubah | Pengguna harus yakin kehadirannya tercatat (prinsip feedback, F-02). |
| Keadaan kosong | Ikon + teks penjelasan di tengah layar | Karyawan baru belum punya riwayat; layar tidak boleh putih tanpa penjelasan. |
