# Catatan Keputusan Data — SIPORA

Dokumen ini menjelaskan keputusan perancangan model data dan pengelolaan data lokal SIPORA pada Tugas 7, berdasarkan kebutuhan pengajuan surat observasi dan penelitian akademik.

| Keputusan | Pilihan | Alasan |
|---|---|---|
| Field model | `PengajuanSurat` menyimpan jenis pengajuan, pelaksanaan, anggota, identitas akademik, kontak, lokasi, periode, topik, dan status. `AnggotaPengajuan` menyimpan nama serta NIM/NPM. | Field tersebut diperlukan untuk merepresentasikan informasi pengajuan yang diisi mahasiswa melalui formulir. |
| Sumber nilai | Data pengajuan berasal dari formulir, ID dibuat oleh sistem, dan status awal ditetapkan menjadi `Diproses`. | Pemisahan sumber nilai membantu menjaga konsistensi data dan mengurangi pengisian atribut sistem secara manual. |
| Kunci data (`id`) | ID dibuat menggunakan `DateTime.now().microsecondsSinceEpoch.toString()`. | ID digunakan untuk mengenali pengajuan ketika diperbarui atau dihapus tanpa bergantung pada posisi data dalam daftar. |
| Operasi CRUD | Create menambahkan data, Read menampilkan daftar dan detail, Update mengganti objek berdasarkan `indexWhere`, dan Delete menghapus berdasarkan ID melalui `removeWhere` setelah konfirmasi. | Keempat operasi mendukung kebutuhan mahasiswa untuk mengelola pengajuan melalui antarmuka aplikasi. |
| Pengelolaan state | Data disimpan dalam list pada `State` dan perubahan dilakukan menggunakan `setState`. | Perubahan data dapat langsung tercermin pada tampilan tanpa memerlukan penyimpanan eksternal. |
| Keputusan persistensi | Data disimpan sementara di memori aplikasi tanpa database atau package tambahan. | Keputusan ini sesuai dengan cakupan Tugas 7 yang berfokus pada pemahaman CRUD lokal, sedangkan persistensi permanen belum diterapkan. |

## Kesimpulan

Perancangan model dan CRUD lokal SIPORA disesuaikan dengan kebutuhan pengelolaan pengajuan surat oleh mahasiswa. Penggunaan ID sebagai kunci operasi serta `setState` untuk memperbarui tampilan membantu menjaga keteraturan pengelolaan data selama aplikasi berjalan.