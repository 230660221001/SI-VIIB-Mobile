# Dokumen Fitur Perangkat — Tugas 11

| Aspek | Keterangan |
|:--|:--|
| **Fitur yang dipilih** | Kamera & Galeri (menggunakan `image_picker`) |
| **Aktor** | Anggota Organisasi Mahasiswa |
| **Tujuan** | Melampirkan foto bukti kehadiran (misal: selfie di lokasi acara) sebagai validasi tambahan saat melakukan check-in kegiatan. |
| **Data Keluaran** | Objek `XFile` (berisi path/bytes gambar). |
| **Permission** | Akses Kamera (jika ambil foto langsung) dan Akses Penyimpanan/Galeri. |
| **Target Platform** | Web (Chrome) — menggunakan file picker bawaan browser. |
| **Konsekuensi Penolakan** | Jika pengguna membatalkan pemilihan foto, state sebelumnya (belum ada foto) dipertahankan dan tidak dianggap sebagai error. Jika terjadi error package, tampilkan pesan kegagalan. |