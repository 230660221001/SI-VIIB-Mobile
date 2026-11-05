catatan-keputusan-data
# Catatan Keputusan Data — Tugas 7

## 1. Keputusan Model Data

Model data yang digunakan dalam aplikasi SIPUSKAM pada Tugas 7 adalah `DataBuku`. Model ini merepresentasikan data buku yang ditampilkan dan dikelola melalui fitur CRUD lokal. Setiap objek buku memiliki atribut `id`, `judul`, `penulis`, `kategori`, dan `status`.

Atribut tersebut dipilih untuk mengelompokkan informasi buku agar dapat ditampilkan dan dikelola secara terstruktur. Field menggunakan tipe data `String` karena seluruh atribut pada implementasi awal ini berupa teks.

## 2. Keputusan Penggunaan ID

Field `id` digunakan sebagai identitas unik untuk setiap data buku. ID dibuat ketika data baru ditambahkan dengan memanfaatkan nilai `DateTime.now().microsecondsSinceEpoch.toString()`.

ID digunakan sebagai acuan untuk menemukan data yang akan diperbarui atau dihapus. Pendekatan ini membantu memastikan operasi CRUD mengacu pada objek yang tepat, bukan hanya pada posisi data dalam daftar.

## 3. Keputusan Operasi CRUD

| Operasi | Implementasi | Alasan |
|---|---|---|
| Create | Formulir penambahan buku | Memungkinkan pengguna memasukkan data baru. |
| Read | `ListView.builder` | Menampilkan daftar buku secara dinamis. |
| Update | `indexWhere` dan penggantian objek | Menemukan data berdasarkan ID dan memperbarui objek terkait. |
| Delete | `removeWhere` berdasarkan ID | Menghapus data yang sesuai dengan identitasnya. |
| Konfirmasi hapus | `AlertDialog` | Memberi kesempatan kepada pengguna untuk memastikan tindakan sebelum data dihapus. |

Perubahan data dilakukan menggunakan `setState` agar tampilan diperbarui setelah operasi CRUD berlangsung.

## 4. Keputusan Penyimpanan Data

Pada implementasi awal ini, data disimpan sementara di dalam memori aplikasi melalui sebuah daftar pada state widget. Penyimpanan persisten belum diterapkan karena fokus pengerjaan adalah memahami dan mengimplementasikan operasi CRUD lokal sesuai kebutuhan tugas.

Konsekuensinya, data yang ditambahkan atau diubah dapat hilang ketika aplikasi dimulai ulang. Penyimpanan persisten dapat dipertimbangkan pada pengembangan berikutnya apabila aplikasi membutuhkan data yang tetap tersedia setelah aplikasi ditutup.

## 5. Kesimpulan

Model `DataBuku` dan operasi CRUD lokal digunakan untuk menerapkan pengelolaan data secara terstruktur. Penggunaan ID unik, pembaruan state, serta dialog konfirmasi penghapusan mendukung pengelolaan data yang lebih terarah. Implementasi ini menjadi tahap awal sebelum mempertimbangkan kebutuhan penyimpanan data secara persisten.