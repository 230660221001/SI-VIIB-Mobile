# Model Data — Aplikasi Absensi Organisasi Mahasiswa

## 1. Daftar Entitas

| Nama Entitas | Field | Tipe Data | Kebutuhan yang Dipenuhi |
|:--|:--|:--|:--|
| `DataKegiatan` | `id` | `String` | Sistem (Kunci unik untuk Update & Delete) |
| | `nama` | `String` | F-07 (Panitia membuat kegiatan baru) |
| | `tanggal` | `String` | F-01, F-02 (Informasi jadwal kegiatan) |
| | `lokasi` | `String` | F-02 (Informasi lokasi kegiatan) |
| | `status` | `String` | F-05 (Panitia membuka/menutup sesi absensi) |

## 2. Sumber Nilai Field
- **`id`**: Dihasilkan oleh sistem menggunakan *timestamp* (waktu saat data dibuat) agar unik.
- **`nama`, `tanggal`, `lokasi`**: Diisi oleh pengguna (panitia) melalui form input.
- **`status`**: Diberi nilai awal "Belum Dibuka" oleh sistem, lalu dapat diubah oleh panitia melalui aksi *Update* (menjadi "Dibuka" atau "Ditutup").