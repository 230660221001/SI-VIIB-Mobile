# Catatan Keputusan Data — Mantra Attendance

| Keputusan | Pilihan Anda | Alasan (merujuk kebutuhan) |
|---|---|---|
| Field model | `id`, `tanggal`, `lokasi`, `jamMasuk`, `jamKeluar`, `status` | Setiap field berasal dari F-03 sampai F-06 (rinci di `model-data.md`). Field tanpa kebutuhan tidak dibuat. |
| Kunci data (id) | `id` dari `DateTime.now().millisecondsSinceEpoch`, dipakai pada `indexWhere` (update) dan `removeWhere` (delete) | Index daftar berubah setelah penghapusan, jadi operasi bisa mengenai catatan yang salah. `id` tidak berubah dan unik. |
| Operasi CRUD per kebutuhan | Create = F-03, Read = F-02/F-05/F-06, Update = F-04 (check-out), Delete = F-08 (koreksi, simulasi) | Setiap kebutuhan Must have yang melibatkan data (F-02 sampai F-05) dipenuhi oleh minimal satu operasi. |
| Kondisi tombol aksi | Label berganti Check-in, Check-out, atau Selesai sesuai catatan hari ini | F-03 mensyaratkan belum ada check-in hari ini, dan F-04 mensyaratkan sudah ada. Kondisi di UI mencegah aksi yang tidak valid. |
| Status "Terlambat" | Dihitung dari `jamMasuk` dengan batas 08:00 | Karyawan perlu hasil absensi yang jelas (F-06). Batas 08:00 adalah asumsi prototype dan perlu dikonfirmasi pada aturan kantor. |
| Hasil form ke daftar | Form mengirim objek lewat `Navigator.pop(context, data)`. Dashboard menerimanya, memanggil `setState`, lalu menampilkan SnackBar. | State daftar hanya dimiliki Dashboard, jadi data harus dikembalikan ke pemiliknya. |
| Konfirmasi hapus | `AlertDialog` sebelum `removeWhere` | Data absensi penting untuk admin (F-07), dan penghapusan tidak boleh terjadi karena salah sentuh. |
| Keputusan persistensi | Ditunda. Data disimpan in-memory pada `List` di State. | Persistensi bersifat opsional pada Tugas 7, dan kode dengan `shared_preferences` tidak berjalan di DartPad. Konsekuensinya, data contoh kembali ke kondisi awal saat aplikasi ditutup. |
| Data yang perlu backend | F-01 Login dan F-07 pemantauan oleh admin | Kedua kebutuhan membutuhkan data bersama antar pengguna, yang tidak mungkin dengan penyimpanan lokal satu perangkat. |
