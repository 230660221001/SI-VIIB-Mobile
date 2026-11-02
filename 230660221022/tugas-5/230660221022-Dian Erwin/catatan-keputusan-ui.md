# Catatan Keputusan UI/UX

| Aspek Rancangan | Keputusan yang Diambil | Alasan / Rujukan Kebutuhan |
|---|---|---|
| **Warna Benih (Seed Color)** | `Colors.indigo` (Biru Keunguan) | Warna indigo mencerminkan institusi pendidikan yang profesional (MAS Darussalam) sekaligus memberikan kontras yang baik pada elemen aktif seperti AppBar dan FAB. |
| **Bentuk Status** | Menggunakan widget `Chip` dengan warna background pastel dan teks pekat (*ternary condition*). | Siswa (Dandi) memiliki waktu sempit antar jam pelajaran (kendala persona). Status berwarna (merah=Rusak, hijau=Siap Pakai) mempercepat pemindaian visual tanpa harus membaca teks secara detail. |
| **Posisi Aksi Utama** | `FloatingActionButton.extended` di sudut kanan bawah. | "Lapor Kerusakan" adalah tugas terpenting (F-02). Ukuran tombol diperbesar (*extended*) agar memenuhi prinsip target sentuh yang memadai dan diletakkan di jangkauan alami ibu jari pengguna *mobile*. |
| **Hierarki Teks** | Kode PC dicetak tebal (`bold`) dan besar (menggunakan `titleMedium`), sedangkan spesifikasi menggunakan teks standar redup. | Memudahkan pengguna mencari PC spesifik berdasarkan stiker kode yang tertempel di monitor lab tanpa terganggu oleh detail teknis RAM/CPU. |
| **Keadaan Kosong (Empty State)** | Ikon monitor besar bergaris tepi transparan dengan teks "Belum ada data PC". | Menghindari layar putih (blank) agar pengguna tidak mengira aplikasi mengalami *hang* atau *error* koneksi (Prinsip *Feedback*). |
