# Catatan Keputusan Navigasi — Mantra Attendance

| Keputusan | Pilihan Anda | Alasan (merujuk IA/kebutuhan) |
|---|---|---|
| Nama route | `/` (Dashboard), `/checkin`, `/detail`, disimpan sebagai konstanta di kelas `Rute` | Satu sumber nama mencegah salah ketik dan perbedaan huruf besar-kecil antara peta `routes` dan `pushNamed`. Setiap route berasal dari satu layar IA Tugas 5. |
| initialRoute | `/` = Dashboard | Dashboard adalah layar utama Tugas 5 dan memenuhi F-02 (Must). Alur check-in dimulai dari sini. |
| Data antarlayar | Objek `DataKehadiran` dikirim lewat `arguments` ke `/detail`, dibaca dengan pemeriksaan `is` dan cabang null | Detail hanya menampilkan hasil absensi (F-06), jadi data cukup satu arah dan read-only. Bila data tidak ada, layar menampilkan teks pengganti. |
| Validator Lokasi kerja | Wajib diisi; minimal 3 karakter setelah `trim()` | Absensi tanpa lokasi tidak bermakna bagi Raka maupun admin yang menelusuri data (F-07). `trim()` mencegah spasi lolos. |
| Validator Jam masuk | Wajib diisi; format `HH:mm` (00:00-23:59), terisi otomatis dari jam sekarang | Mengurangi pengetikan sesuai persona Raka yang ingin proses sederhana (NF-01). Validator menjaga data tetap valid bila jam diubah. |
| Feedback kirim | `SnackBar` "Check-in ... dicatat (simulasi)", lalu `pop` ke Dashboard | Karyawan perlu yakin kehadirannya tercatat (F-02). Kata "simulasi" jujur karena data belum disimpan (Pertemuan 7). |
| Feedback validasi | Pesan validator di bawah field | Pengguna tahu field mana yang salah dan cara memperbaikinya, tanpa menebak. |
| Jalan kembali | `OutlinedButton` "Batal" di form dan `FilledButton` "Kembali" di detail, keduanya memakai `pop` | Layar dalam selalu punya jalan kembali. Layar utama tidak memiliki tombol kembali supaya aplikasi tidak tertutup. |
