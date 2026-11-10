# Model Data — PresentGo

**Nama:** <isi nama>
**NIM:** 230660221004

## Entitas: PengajuanIzin

| Field | Tipe data | Kebutuhan yang dipenuhi | Sumber nilai |
|---|---|---|---|
| `id` | `String` | F-05 (kunci unik untuk Update/Delete pengajuan) | Sistem — dibuat otomatis dari `DateTime.now().millisecondsSinceEpoch.toString()` saat pengajuan dibuat |
| `jenis` | `String` | F-05 (jenis izin yang diajukan karyawan) | Form — diisi pengguna saat Create/Update |
| `tanggal` | `String` | F-05 (tanggal izin berlaku) | Form — diisi pengguna saat Create/Update |
| `alasan` | `String` | F-05 (keterangan pengajuan) | Form — diisi pengguna saat Create/Update |
| `status` | `String` | F-05, F-08 (status pengajuan yang dipantau karyawan dan diproses HRD) | Sistem — diberi nilai awal `"Menunggu"` saat Create; perubahan oleh HRD menjadi materi Pertemuan di luar cakupan Tugas 7 |

Satu entitas dipilih (bukan beberapa) karena F-05 adalah satu-satunya kebutuhan Must have pada domain PresentGo yang melibatkan siklus data penuh (tambah, lihat, ubah sebelum diproses, batalkan) — field lain seperti data kehadiran (F-02/F-03/F-04) bersifat log yang dicatat sistem dan tidak diubah/dihapus pengguna, sehingga tidak cocok dijadikan contoh CRUD penuh pada pertemuan ini.
