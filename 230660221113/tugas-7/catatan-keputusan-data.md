# Catatan Keputusan Data — FasKampus

## 1. Tujuan

Dokumen ini menjelaskan keputusan pengelolaan data pada aplikasi FasKampus. Aplikasi ini dirancang untuk membantu mahasiswa atau organisasi kampus mengajukan peminjaman fasilitas kampus, seperti aula, ruang kelas, laboratorium, proyektor, dan perlengkapan kegiatan lainnya.

## 2. Model Data Pengajuan

Data pengajuan direpresentasikan menggunakan class `DataPengajuan` pada file `data_pengajuan.dart`.

Atribut yang digunakan adalah:

| Atribut | Tipe Data | Keterangan |
|---|---|---|
| `id` | `String` | Identitas unik setiap pengajuan |
| `namaFasilitas` | `String` | Nama fasilitas yang diajukan |
| `tanggal` | `String` | Tanggal penggunaan fasilitas |
| `jamMulai` | `String` | Waktu mulai penggunaan |
| `jamSelesai` | `String` | Waktu selesai penggunaan |
| `tujuan` | `String` | Tujuan atau keperluan peminjaman |
| `status` | `String` | Status pengajuan |

Model ini digunakan agar data pengajuan memiliki struktur yang konsisten ketika dibuat, ditampilkan, diubah, atau dihapus.

## 3. Keputusan Penyimpanan Data

Pada tahap pengembangan ini, FasKampus menggunakan penyimpanan data sementara di dalam memori aplikasi.

Daftar pengajuan disimpan menggunakan:

`List<DataPengajuan>`

Daftar tersebut berada pada halaman CRUD lokal, yaitu `crud_lokal.dart`.

Keputusan ini diambil karena implementasi masih berfokus pada pemahaman pengelolaan data dan penerapan operasi CRUD menggunakan Flutter.

Penyimpanan ini belum menggunakan database lokal maupun server backend.

## 4. Operasi CRUD

Pengelolaan data pengajuan mencakup empat operasi utama.

### 4.1 Create (Tambah)

Pengguna mengisi formulir pada `form-interaksi.dart`. Setelah data dinyatakan valid, aplikasi membentuk objek `DataPengajuan` dan menambahkannya ke daftar pengajuan.

### 4.2 Read (Tampilkan)

Data pengajuan ditampilkan pada halaman `crud_lokal.dart`. Informasi yang ditampilkan mencakup fasilitas, tanggal, waktu penggunaan, tujuan, dan status pengajuan.

### 4.3 Update (Ubah)

Pengguna dapat mengubah informasi pengajuan melalui menu ubah. Status pengajuan juga dapat diperbarui menjadi `Menunggu`, `Disetujui`, atau `Ditolak`.

### 4.4 Delete (Hapus)

Pengguna dapat menghapus pengajuan melalui menu hapus. Aplikasi menampilkan dialog konfirmasi sebelum data dihapus dari daftar.

## 5. Keputusan Penggunaan ID

Setiap pengajuan memiliki atribut `id` untuk membedakan satu data dari data lainnya.

Operasi ubah dan hapus menggunakan ID tersebut untuk menemukan pengajuan yang akan diproses. Dengan demikian, perubahan tidak hanya bergantung pada posisi data di dalam daftar.

ID perlu dibuat secara unik agar setiap pengajuan dapat diidentifikasi dengan benar.

## 6. Keputusan Pengelolaan Status

Status pengajuan digunakan untuk menunjukkan perkembangan permintaan peminjaman fasilitas.

Status yang digunakan pada implementasi saat ini adalah:

- `Menunggu`: pengajuan belum memperoleh keputusan.
- `Disetujui`: pengajuan telah disetujui.
- `Ditolak`: pengajuan tidak disetujui.

Pada tahap ini, perubahan status dilakukan melalui fitur ubah data. Status belum terhubung dengan proses persetujuan otomatis oleh petugas kampus.

## 7. Batasan Implementasi

Beberapa batasan pengelolaan data pada tahap ini adalah:

1. Data disimpan sementara di memori aplikasi.
2. Data dapat hilang ketika aplikasi dihentikan sepenuhnya atau dimulai ulang.
3. Data belum tersinkronisasi dengan perangkat lain.
4. Belum ada autentikasi pengguna dan pembatasan akses berdasarkan peran.
5. Belum ada validasi bentrok jadwal antarpengajuan melalui database.
6. Data fasilitas masih menggunakan daftar contoh yang ditentukan di dalam kode.

Selain itu, daftar pengajuan pada halaman utama dan halaman CRUD belum otomatis berbagi data jika masing-masing mengelola datanya sendiri.

## 8. Rencana Pengembangan Selanjutnya

Pengembangan berikutnya dapat mencakup:

- Menggunakan penyimpanan lokal agar data tetap tersedia setelah aplikasi dibuka kembali.
- Menghubungkan daftar pengajuan pada halaman utama dengan halaman CRUD.
- Menambahkan validasi bentrok tanggal dan waktu peminjaman.
- Menambahkan autentikasi serta hak akses pengguna dan petugas.
- Menghubungkan aplikasi dengan backend agar data dapat digunakan bersama oleh beberapa pengguna.

## 9. Kesimpulan

Keputusan menggunakan `List<DataPengajuan>` sebagai penyimpanan sementara sesuai untuk tahap awal pengembangan FasKampus karena membantu penerapan operasi CRUD dengan struktur data yang jelas.

Namun, pendekatan ini belum cukup untuk penggunaan nyata karena data belum tersimpan secara permanen dan belum dapat digunakan bersama oleh banyak pengguna. Oleh karena itu, penyimpanan lokal atau database backend dapat dipertimbangkan pada tahap pengembangan selanjutnya.