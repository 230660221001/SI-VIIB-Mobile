# Catatan Keputusan Data — Pendataan Bencana BPBD

**NIM:** 230660221088  
**Nama:** Muhammad Panji Adhitya  
**Kelas:** SI-VIIB  

## Tabel Keputusan

| Keputusan | Pilihan implementasi | Alasan yang merujuk kebutuhan |
|---|---|---|
| Entitas utama CRUD | `KejadianBencana` dengan field `id`, `jenis`, `lokasi`, `tanggal`, `deskripsi`, `kontak`, dan `statusPenanganan`. | Field berasal dari form pencatatan petugas pada F-04; status penanganan diperlukan untuk F-06. |
| Field opsional | `kontak` bertipe `String?`; boleh kosong. | Kontak sumber informasi bersifat pendukung dan tidak selalu tersedia saat petugas menerima laporan (F-04). |
| ID data | `DateTime.now().microsecondsSinceEpoch.toString()` saat Create; ID lama dipertahankan saat Update. | ID unik membuat Update dan Delete mengarah ke kejadian yang benar meskipun urutan daftar berubah (F-04, F-06). |
| Create | Form valid membuat objek `KejadianBencana`; hasil dikirim ke dashboard dan dimasukkan di awal daftar dengan `insert(0, data)` di dalam `setState`. | Petugas dapat mencatat kejadian dari jalur selain aplikasi masyarakat (F-04). |
| Read | `ListView.builder` membaca `List<KejadianBencana>` yang dikelola oleh state dashboard. | Daftar menampilkan kejadian yang baru dicatat serta status penanganannya (F-04, F-06). |
| Update | `indexWhere` mencari objek berdasarkan `id`; objek lama diganti objek baru dengan ID yang sama di dalam `setState`. Form edit memuat nilai lama dan menyediakan pilihan status. | Petugas dapat memperbarui informasi/status penanganan tanpa membuat kejadian duplikat (F-06). |
| Delete | `AlertDialog` meminta konfirmasi; setelah disetujui, `removeWhere` menghapus data dengan `id` yang dipilih di dalam `setState`. | Menghindari penghapusan tidak sengaja dan memastikan data yang dihapus tepat (pengelolaan data lokal). |
| Penyimpanan | In-memory `List` melalui `PenyimpananSementara`; tidak memakai package tambahan. Bertahan saat logout/login, tetapi tidak setelah aplikasi di-restart. | Sesuai batas CRUD lokal Pertemuan 7 yang dapat dijalankan tanpa package tambahan; persistensi `shared_preferences` adalah tahap terpisah. |

