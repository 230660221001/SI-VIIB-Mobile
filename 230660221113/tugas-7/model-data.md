# Model Data FasKampus

## 1. Tujuan

Dokumen ini menjelaskan model data yang digunakan pada aplikasi FasKampus. Model data dibuat untuk menyimpan informasi pengajuan peminjaman fasilitas kampus oleh organisasi mahasiswa, seperti BEM, HIMA, dan UKM.

Pada Tugas 7, data masih disimpan secara lokal di dalam aplikasi menggunakan `List`. Penyimpanan ini digunakan untuk menerapkan operasi tambah, tampil, ubah, dan hapus data sebelum menggunakan backend.

## 2. Entitas Utama

Entitas utama yang digunakan adalah **DataPengajuan**, yaitu data yang mewakili satu pengajuan peminjaman fasilitas kampus.

| Field | Tipe data | Kebutuhan yang dipenuhi | Sumber nilai |
|---|---|---|---|
| `id` | `String` | Identifikasi setiap pengajuan | Dibuat oleh sistem |
| `namaOrganisasi` | `String` | Mencatat organisasi yang mengajukan peminjaman | Diisi melalui form |
| `namaKegiatan` | `String` | Mencatat kegiatan yang akan dilaksanakan | Diisi melalui form |
| `namaFasilitas` | `String` | Menentukan fasilitas yang dipinjam | Dipilih melalui form |
| `tanggal` | `String` | Mencatat tanggal penggunaan fasilitas | Diisi melalui form |
| `jam` | `String` | Mencatat waktu penggunaan fasilitas | Diisi melalui form |
| `status` | `String` | Menampilkan status pengajuan | Diberikan oleh sistem saat data dibuat atau diubah |

> **Catatan:** Kolom kebutuhan yang dipenuhi harus menggunakan ID kebutuhan fungsional dari Tugas 4. Cocokkan setiap field dengan dokumenmu; jangan mempertahankan ID contoh yang ternyata berbeda.

## 3. Alasan Pemilihan Field

1. `id` digunakan sebagai identitas unik agar data dapat diubah atau dihapus dengan tepat tanpa bergantung pada posisi data di dalam daftar.
2. `namaOrganisasi` digunakan untuk mengetahui organisasi mahasiswa yang mengajukan peminjaman.
3. `namaKegiatan` digunakan untuk mengetahui tujuan peminjaman fasilitas.
4. `namaFasilitas` digunakan untuk mengetahui fasilitas yang ingin dipinjam.
5. `tanggal` digunakan untuk mencatat tanggal penggunaan fasilitas.
6. `jam` digunakan untuk mencatat waktu penggunaan fasilitas.
7. `status` digunakan untuk memberikan informasi perkembangan pengajuan kepada pengguna.

## 4. Sumber dan Pengelolaan Data

Data `namaOrganisasi`, `namaKegiatan`, `namaFasilitas`, `tanggal`, dan `jam` berasal dari form yang diisi pengguna. Field `id` dibuat oleh sistem agar setiap data mempunyai identitas unik. Field `status` ditentukan oleh sistem, misalnya dengan nilai awal `Menunggu`.

Pada tahap ini, data disimpan di dalam `List<DataPengajuan>` pada state halaman aplikasi. Setiap penambahan, perubahan, atau penghapusan data dilakukan menggunakan `setState()` agar tampilan diperbarui.

## 5. Batasan Implementasi

Data pada Tugas 7 masih bersifat lokal dan belum terhubung dengan database atau backend. Karena itu, data dapat hilang ketika aplikasi dimulai ulang. Penyimpanan permanen menggunakan `shared_preferences` bersifat opsional sesuai panduan tugas.

## 6. Kesimpulan

Model `DataPengajuan` menjadi dasar implementasi CRUD lokal pada FasKampus. Field yang digunakan dipilih untuk mendukung pencatatan pengajuan peminjaman fasilitas dan harus tetap sesuai dengan kebutuhan fungsional pada Tugas 4.