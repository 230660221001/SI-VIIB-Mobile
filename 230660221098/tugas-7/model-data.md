## 1. Entitas dan Field

| Entitas | Field       | Tipe Data  | Kebutuhan yang Dipenuhi                            | Sumber Nilai                                                                                                                                         |
| :------ | :---------- | :--------- | :------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------- |
| Laporan | `id`        | `String`   | F-01, F-11, F-12 (kunci unik untuk ubah dan hapus) | Sistem: dibuat otomatis saat laporan dibuat                                                                                                          |
| Laporan | `judul`     | `String`   | F-01, F-02                                         | Form: diisi mahasiswa                                                                                                                                |
| Laporan | `kategori`  | `String`   | F-01, F-02                                         | Form: dipilih mahasiswa dari daftar                                                                                                                  |
| Laporan | `lokasi`    | `String`   | F-01, F-03                                         | Form: diisi mahasiswa                                                                                                                                |
| Laporan | `deskripsi` | `String`   | F-01, F-03                                         | Form: diisi mahasiswa                                                                                                                                |
| Laporan | `tanggal`   | `DateTime` | F-02, F-03                                         | Sistem: waktu laporan dibuat, tidak berubah saat laporan diubah                                                                                      |
| Laporan | `status`    | `String`   | F-02, F-05                                         | Sistem: bernilai `Menunggu` saat dibuat; perubahan menjadi `Diproses` atau `Selesai` dilakukan petugas di backend SI (F-09, di luar aplikasi mobile) |

## 2. Sumber Nilai

Form:`judul`, `kategori`, `lokasi`, `deskripsi` diisi pengguna dan divalidasi (wajib diisi, panjang minimum).
Sistem: `id`, `tanggal`, dan nilai awal `status` ditetapkan aplikasi, bukan diketik pengguna.
Perhitungan: belum ada field hasil perhitungan pada tahap ini.
