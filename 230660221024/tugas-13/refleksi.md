# Refleksi Tugas 13

1. **Pentingnya testing:** Proses testing mengajarkan saya bahwa aplikasi yang "tampak berjalan" belum tentu bebas dari bug. Tanpa skenario pengujian yang tepat (seperti klik ganda), bug yang merusak data pengguna bisa lolos ke produksi.
2. **Proses debugging:** Saat menemukan bug data ganda, saya belajar menelusuri alur eksekusi fungsi dan menyadari bahwa status *loading* (`_sedangMenyimpan`) sangat krusial untuk mencegah *race condition* pada UI.
3. **Manfaat otomatisasi:** Menulis *widget test* membuat saya lebih percaya diri dalam mengubah kode (refactoring), karena saya tahu jika ada fitur lama yang rusak, test akan langsung gagal dan memberitahu saya.

## Deklarasi Penggunaan AI
Deklarasi penggunaan AI: AI coding assistant — membantu menyusun skenario test case dan logika *widget test*; seluruh alur, kode, dan hasil pengujian diverifikasi oleh penulis.