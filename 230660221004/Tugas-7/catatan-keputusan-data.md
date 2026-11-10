# Catatan Keputusan Data — PresentGo

**Nama:** <isi nama>
**NIM:** 230660221004

| Keputusan | Pilihan Anda | Alasan |
|---|---|---|
| Field model | `id`, `jenis`, `tanggal`, `alasan`, `status` pada `PengajuanIzin` | Field minimal yang dibutuhkan form pengajuan izin pada Tugas 4/6, tanpa field tambahan yang tidak pernah ditampilkan atau diproses pada layar manapun. |
| Kunci data (id) | `String` dari `DateTime.now().millisecondsSinceEpoch.toString()`, dibuat sekali saat Create dan tidak pernah diubah | Cukup unik untuk operasi lokal yang dibuat berurutan oleh satu pengguna, dan tidak membutuhkan package tambahan (`uuid`) di luar batas cakupan Pertemuan 7. |
| Operasi CRUD per kebutuhan | Create menambah dari dialog form (F-05); Read menampilkan seluruh pengajuan lewat `ListView.builder` termasuk status (F-05, F-08); Update mengubah jenis/tanggal/alasan lewat dialog yang sama dengan Create; Delete membatalkan pengajuan lewat `AlertDialog` konfirmasi sebelum `removeWhere` dijalankan | Karyawan Lapangan perlu dapat memperbaiki pengajuan yang salah ketik atau membatalkannya sebelum diproses HRD, sesuai kendala persona yang mengurus administrasi di sela waktu kerja. |
| Keputusan persistensi | Data hanya disimpan di memori (`List<PengajuanIzin>` pada `State`), belum ditulis ke penyimpanan permanen di perangkat | Sesuai batas cakupan Pertemuan 7: penyimpanan lokal permanen (mis. `shared_preferences` atau file) menjadi materi lanjutan di luar cakupan tugas ini; struktur data saat ini (List + id unik) sudah disiapkan agar mudah dihubungkan ke penyimpanan permanen nantinya. |
