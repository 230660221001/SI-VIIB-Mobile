# Catatan Keputusan Data — Tugas 7

| Keputusan | Pilihan Anda | Alasan (merujuk kebutuhan) |
|:--|:--|:--|
| **Field model** | id, nama, tanggal, lokasi, status | Field ini diturunkan langsung dari kebutuhan F-01, F-02, F-05, dan F-07 agar informasi kegiatan tersimpan dengan lengkap. |
| **Kunci data (`id`)** | String berbasis *timestamp* | Menggunakan *timestamp* menjamin setiap kegiatan memiliki ID unik, sehingga proses Edit (Update) dan Hapus (Delete) tidak akan salah sasaran meskipun ada nama kegiatan yang sama. |
| **Operasi CRUD per kebutuhan** | Create (Tambah), Read (Lihat Daftar), Update (Ubah Status), Delete (Hapus) | Create memenuhi F-07, Read memenuhi F-01/F-02, Update memenuhi F-05, dan Delete sebagai fitur dasar kebersihan data jika kegiatan batal. |
| **Keputusan persistensi** | In-Memory (menggunakan `List`) | Sesuai batas cakupan Tugas 7, data disimpan di memori (`List`) agar aplikasi berjalan tanpa *package* tambahan dan mudah diuji di DartPad/Chrome. |