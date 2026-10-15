# Catatan Keputusan Data

## Identitas
- **Nama:** Ghatan Zalfaa Kautsar
- **NIM:** 230660221001
- **Domain:** Sistem Penjualan Beras di Pabrik BSM

## Tabel Keputusan

| Keputusan | Pilihan | Alasan (merujuk kebutuhan) |
|:----------|:--------|:---------------------------|
| Field model | `id`, `namaPemesan`, `jenisBeras`, `jumlahKg`, `alamat`, `status`, `nomorResi` | Setiap field diturunkan dari kebutuhan: F-02 (jenis beras, jumlah), F-03 (nama pemesan, alamat), F-06 (status), F-08 (nomor resi). `id` untuk kunci unik. |
| Kunci data (`id`) | `DateTime.now().millisecondsSinceEpoch.toString()` | Setiap pesanan harus unik. Timestamp milidetik menjamin keunikan tanpa package tambahan, dan tidak berubah setelah pesanan dibuat (aman untuk operasi update/delete). |
| Operasi CRUD per kebutuhan | Create → F-02/F-03; Read → F-06; Update → F-08; Delete → pembatalan | Create memenuhi pembuatan pesanan dari form. Read menampilkan daftar. Update memungkinkan karyawan mengubah status dan mengisi nomor resi. Delete memungkinkan pembatalan pesanan yang salah. |
| Keputusan persistensi | `shared_preferences` dengan JSON encoding | Data pesanan harus bertahan setelah aplikasi ditutup — konsumen tidak boleh kehilangan pesanan. `shared_preferences` mendukung target web dan tidak memerlukan database relasional (di luar cakupan Pertemuan 7). |
| Metode `salinDengan` | Method pada model, bukan `copyWith` package | Menghindari dependency tambahan. Method ini membuat objek baru dengan field yang diubah — sesuai prinsip `final` field dan penggantian objek pada Update. |
| Sumber `status` | Sistem + karyawan | Default 'menunggu' saat dibuat; diubah karyawan menjadi 'diproses', 'dikirim', atau 'selesai' sesuai alur nyata di Pabrik BSM. |
| Aksi hapus | Konfirmasi `AlertDialog` sebelum `removeWhere` | Mencegah kehilangan data tidak sengaja — konsumen Rani bisa salah menekan tombol hapus pada daftar pesanan. |