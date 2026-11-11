# Catatan Keputusan Data — RadiAct (UNSAP Radio)

Dokumen ini mencatat keputusan perancangan model data, penentuan kunci data, operasi CRUD, dan keputusan persistensi pada aplikasi RadiAct sesuai kebutuhan internal UNSAP Radio.

## Tabel Keputusan Data

| Keputusan | Pilihan Anda | Alasan (merujuk kebutuhan) |
| :--- | :--- | :--- |
| **Field model** | Menyusun `DataJadwal` dengan *field*: `id`, `judul`, `divisi`, `tanggal`, `status`, dan `catatan`. | Semua *field* diturunkan langsung dari kebutuhan F-01 dan F-03 agar informasi jadwal siaran radio tercatat lengkap, mulai dari nama program hingga kendala siaran. |
| **Kunci data (`id`)** | Menggunakan `DateTime.now().millisecondsSinceEpoch.toString()` sebagai nilai `id` unik berbasis waktu. | Mencegah terjadinya kesalahan data berbentrokan saat melakukan ubah status (*update*) atau hapus data (*delete*), karena penggunaan *index* daftar berisiko salah sasaran jika ada data yang dihapus. |
| **Operasi CRUD per kebutuhan** | **Create** (tambah dari form untuk F-01), **Read** (tampil daftar untuk F-03), **Update** (ubah status untuk F-02), dan **Delete** (hapus jadwal salah). | Memastikan seluruh alur kebutuhan utama (*Must have*) aplikasi RadiAct dapat dikelola secara mandiri oleh tim radio melalui antarmuka aplikasi. |
| **Keputusan persistensi** | Menggunakan penyimpanan dalam memori (*in-memory*) berbasis `List` dan `StatefulWidget` (`setState`). | Memenuhi batas cakupan Tugas agar kode program tetap dapat dijalankan langsung dengan cepat di DartPad maupun browser tanpa bergantung pada *package* tambahan. |