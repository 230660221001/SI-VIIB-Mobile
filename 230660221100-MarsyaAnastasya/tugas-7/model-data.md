# Model Data — Lapor Fasilitas FTI

## 1. Daftar Entitas

Aplikasi Lapor Fasilitas FTI menggunakan satu entitas utama, yaitu `DataLaporan`. Entitas ini digunakan untuk menyimpan informasi laporan kerusakan fasilitas yang dibuat oleh Pelapor dan dikelola oleh Petugas.

| Entitas | Field | Tipe Data | Kebutuhan yang Dipenuhi |
|---|---|---|---|
| DataLaporan | `id` | String | Pendukung pengelolaan dan identifikasi laporan |
| DataLaporan | `fasilitas` | String | F-01, F-04 |
| DataLaporan | `lokasi` | String | F-01, F-04 |
| DataLaporan | `deskripsi` | String | F-01, F-04 |
| DataLaporan | `status` | String | F-05, F-06, F-07 |
| DataLaporan | `tanggalLaporan` | DateTime | Pendukung F-10 |
| DataLaporan | `fotoPath` | String? | F-01 |
| DataLaporan | `videoPath` | String? | F-02 |
| DataLaporan | `catatan` | String? | F-04, F-05, F-06 |
| DataLaporan | `fotoBuktiPath` | String? | F-06 |

Keterangan:
- `String` digunakan untuk menyimpan data berbentuk teks.
- `DateTime` digunakan untuk menyimpan tanggal dan waktu laporan dibuat.
- `String?` menunjukkan bahwa field bersifat opsional dan dapat bernilai `null`.
- `id` digunakan sebagai identitas unik setiap laporan untuk proses pengubahan dan penghapusan data.

## 2. Sumber Nilai Data

Setiap field pada entitas `DataLaporan` memiliki sumber nilai yang berbeda, yaitu dari form Pelapor, sistem, atau Petugas.

| Field | Sumber Nilai | Keterangan |
|---|---|---|
| `id` | Sistem | Dibuat secara otomatis ketika laporan baru ditambahkan dan digunakan sebagai identitas unik laporan. |
| `fasilitas` | Form Pelapor | Diisi oleh Pelapor sesuai jenis fasilitas yang mengalami kerusakan. |
| `lokasi` | Form Pelapor | Diisi oleh Pelapor sesuai lokasi fasilitas yang dilaporkan. |
| `deskripsi` | Form Pelapor | Diisi oleh Pelapor untuk menjelaskan kondisi kerusakan fasilitas. |
| `status` | Sistem dan Petugas | Diberikan secara otomatis dengan status awal Menunggu, kemudian diperbarui oleh Petugas menjadi Dikerjakan atau Selesai. |
| `tanggalLaporan` | Sistem | Diisi secara otomatis berdasarkan waktu ketika laporan dibuat. |
| `fotoPath` | Form Pelapor | Bersifat opsional dan digunakan untuk menyimpan referensi foto kerusakan. |
| `videoPath` | Form Pelapor | Bersifat opsional dan digunakan untuk menyimpan referensi video kerusakan. |
| `catatan` | Petugas | Diisi oleh Petugas sebagai catatan tambahan terkait penanganan laporan. |
| `fotoBuktiPath` | Petugas | Bersifat opsional dan digunakan untuk menyimpan referensi foto bukti perbaikan. |

 