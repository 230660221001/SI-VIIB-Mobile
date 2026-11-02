# Catatan Keputusan Navigasi & Interaksi

| Keputusan | Pilihan | Alasan (Merujuk Kebutuhan/IA) |
|---|---|---|
| **Route `/` (Awal)** | Halaman Daftar PC | Memenuhi F-01; pengguna butuh langsung melihat status seluruh perangkat saat aplikasi dibuka (Must have). |
| **Data ke `/detail`** | Objek `DataPC` (Read-only) | Memenuhi F-01; pada alur ini, pengguna hanya perlu meninjau informasi spesifik perangkat tanpa mengubahnya. |
| **Validator Form** | Tolak kosong/spasi pada field `ID PC` dan `Kendala` | Memenuhi F-02; laporan kerusakan tidak valid dan tidak bisa diproses jika tidak ada identitas PC atau deskripsi masalahnya. |
| **Feedback Aksi** | `SnackBar` + kembali ke daftar (`pop`) | Mengonfirmasi kepada pengguna bahwa laporan berhasil dicatat (simulasi) sehingga pengguna tidak menekan tombol berulang kali. |
