# Tes Konsep UTS — Jajang Komara (230660221102)

## Soal 1 — Konsep Aplikasi Bergerak dalam SI

1. **Karakteristik: Mobilitas dan fleksibilitas.**  
   Contoh penerapan: Mahasiswa dapat mengajukan surat melalui smartphone dari mana saja tanpa harus datang ke loket administrasi.

2. **Karakteristik: Memanfaatkan fitur perangkat mobile.**  
   Contoh penerapan: Mahasiswa dapat mengambil foto atau mengunggah dokumen persyaratan menggunakan kamera dan penyimpanan smartphone.

3. **Karakteristik: Kemudahan akses dan interaksi.**  
   Contoh penerapan: Mahasiswa dapat mengisi formulir dan memeriksa status pengajuan melalui tampilan sederhana yang mendukung interaksi sentuh.

## Soal 2 — Dasar Pemrograman Dart

- `List<String> daftarSurat = []`: Membuat daftar kosong yang dapat menyimpan beberapa data bertipe String.
- Parameter `String jenis`: Menerima masukan berupa nama atau jenis surat.
- `jenis.isEmpty`: Memeriksa apakah input kosong agar data tidak valid dapat dicegah.
- `return`: Menghentikan fungsi ketika input kosong sehingga proses penambahan tidak dilanjutkan.
- `daftarSurat.add(jenis)`: Menambahkan jenis surat ke bagian akhir List.
- Perulangan `for`: Mengakses dan menampilkan setiap data berdasarkan indeksnya.

**Kesalahan umum bila validasi `isEmpty` dihapus:**  
Pengguna dapat memasukkan data kosong sehingga daftar surat berisi informasi yang tidak valid dan dapat membingungkan saat ditampilkan.


## Soal 3 — Struktur Flutter dan Widget

- `MaterialApp`: Mengatur konfigurasi utama aplikasi, seperti tema dan navigasi.
- `Scaffold`: Menyediakan struktur dasar halaman aplikasi.
- `AppBar`: Menampilkan bagian atas halaman, seperti judul.
- `Column`: Menyusun widget secara vertikal.
- `Text`: Menampilkan informasi berbentuk teks.
- `ListView.builder`: Menampilkan daftar data secara dinamis dan efisien.

**Masalah bila `ListView.builder` di dalam `Column` tanpa `Expanded`:**  
ListView dapat mengalami error karena tidak memperoleh batas tinggi yang jelas.

**Penyebab:**  
Column tidak memberikan batas tinggi yang sesuai kepada ListView, padahal ListView membutuhkan ruang untuk menampilkan dan melakukan scrolling.

**Perbaikan:**  
Membungkus `ListView.builder` dengan `Expanded` agar menggunakan sisa ruang yang tersedia.

## Soal 4 — Analisis Kebutuhan dan User Flow

**Klasifikasi dan prioritas:**

| No. | Permintaan | Fungsional/Nonfungsional | Prioritas MoSCoW | Alasan |
|:---:|---|---|:---:|---|
| 1 | Mengajukan surat keterangan aktif kuliah | Fungsional | Must | Fungsi utama aplikasi untuk mengirim pengajuan surat. |
| 2 | Melihat status pengajuan | Fungsional | Must | Mahasiswa perlu mengetahui perkembangan pengajuan. |
| 3 | Menerima notifikasi saat surat siap diambil | Fungsional | Should | Memudahkan pengguna memperoleh informasi, tetapi bukan proses utama pengajuan. |

Ketiga permintaan tersebut termasuk kebutuhan fungsional karena menjelaskan layanan yang harus disediakan aplikasi. Kebutuhan nonfungsional dapat berupa keamanan data, kemudahan penggunaan, dan kecepatan akses.

**User flow untuk kebutuhan Must:**

1. Mahasiswa membuka aplikasi.
2. Memilih menu pengajuan surat.
3. Memilih surat keterangan aktif kuliah.
4. Mengisi formulir pengajuan.
5. Mengirim formulir setelah memeriksa data.
6. Sistem memvalidasi dan menyimpan pengajuan.
7. Mahasiswa melihat status pengajuan.

## Soal 5 — UI/UX Mobile

1. **Prinsip: Desain responsif.**  
   Keputusan desain: Menggunakan daftar vertikal atau kartu yang menampilkan nama surat, status, dan tombol ajukan.  
   Alasan: Tampilan lebih mudah dibaca pada layar smartphone yang terbatas.

2. **Prinsip: Kemudahan interaksi.**  
   Keputusan desain: Menggunakan tombol dengan ukuran dan jarak yang cukup untuk disentuh.  
   Alasan: Mengurangi kesalahan ketika pengguna memilih atau menekan tombol.

3. **Prinsip: Efisiensi dan konsistensi.**  
   Keputusan desain: Menyediakan pencarian serta tampilan item yang seragam.  
   Alasan: Pengguna dapat menemukan jenis surat dengan cepat tanpa memeriksa seluruh daftar satu per satu.

## Soal 6 — Navigasi dan Interaksi

**Metode navigasi dan kapan digunakan:**

- `push`: Membuka halaman baru menggunakan route secara langsung, misalnya dari daftar ke form pengajuan.
- `pushNamed`: Berpindah halaman berdasarkan nama route yang sudah didaftarkan pada `MaterialApp`.
- `pop`: Menutup halaman saat ini dan kembali ke halaman sebelumnya.

**Pengiriman data jenis surat ke halaman form:**  
Data dapat dikirim melalui parameter constructor halaman atau menggunakan `arguments` pada `Navigator.pushNamed()`. Dengan demikian, form dapat menampilkan jenis surat yang dipilih mahasiswa.

**Feedback setelah form dikirim:**  
Sistem menampilkan `SnackBar` berisi pesan seperti "Pengajuan berhasil dikirim". Selanjutnya, mahasiswa dapat diarahkan ke halaman detail status untuk melihat perkembangan pengajuan.

## Soal 7 — Model Data dan State

**Mengapa setiap field bersifat `final`:**  
Agar nilai atribut tidak berubah secara langsung setelah objek dibuat sehingga data lebih konsisten.

**Mengapa `id` wajib ada:**  
ID menjadi identitas unik setiap pengajuan sehingga data dapat ditemukan, diperbarui, atau dihapus dengan tepat.

**Perbedaan StatelessWidget dan StatefulWidget:**

- `StatelessWidget` digunakan untuk tampilan yang tidak memiliki perubahan state internal.
- `StatefulWidget` digunakan untuk tampilan yang datanya dapat berubah selama aplikasi berjalan.

**Halaman daftar menggunakan:** `StatefulWidget`.

**Alasan:**  
Daftar pengajuan dapat berubah ketika pengguna menambahkan, mengubah, atau menghapus data.

**Fungsi `setState`:**  
Memberi tahu Flutter bahwa data berubah sehingga tampilan perlu diperbarui.

**Apa yang terjadi bila data ditambah tanpa `setState`:**  
Data dapat masuk ke List, tetapi perubahan tersebut tidak langsung ditampilkan pada layar karena widget tidak diperintahkan untuk melakukan rebuild.

## Soal 8 — CRUD Lokal

| Operasi | Method List / mekanisme |
|:---|:---|
| Create | `add()` untuk menambahkan data. |
| Read | Mengakses data List dan menampilkannya dengan `ListView.builder`. |
| Update | `indexWhere()` untuk mencari data berdasarkan ID, kemudian memperbarui elemennya. |
| Delete | `removeWhere()` untuk menghapus data berdasarkan ID. |

**Mengapa menggunakan ID untuk update dan delete, bukan index?**

ID merupakan identitas unik suatu data. Sementara itu, index menunjukkan posisi data di dalam list. Ketika data dihapus atau urutannya berubah, index bisa berubah sehingga berisiko menunjuk ke data yang salah.

Contoh sederhana:

class PengajuanSurat {
  final String id;
  String jenisSurat;

  PengajuanSurat({
    required this.id,
    required this.jenisSurat,
  });
}

## Soal 9 — Persistensi Data Lokal

1. In-memory

Data hanya disimpan selama aplikasi berjalan. Contohnya, data pengajuan disimpan dalam sebuah List di memori aplikasi.

Jika aplikasi ditutup atau prosesnya dihentikan, data tersebut dapat hilang.

2. Shared Preferences

shared_preferences merupakan penyimpanan lokal sederhana yang dapat mempertahankan data meskipun aplikasi ditutup. Cocok untuk menyimpan preferensi atau data sederhana, seperti tema aplikasi dan status login tertentu. Bukan pilihan ideal untuk data kompleks atau database besar.

Mengapa menggunakan Future dan async?

Operasi penyimpanan atau pengambilan data dapat membutuhkan waktu. Future merepresentasikan hasil operasi yang tersedia kemudian, sedangkan async dan await membantu mengelola proses tersebut tanpa memblokir alur aplikasi.

Contoh:
final prefs = await SharedPreferences.getInstance();
await prefs.setString('nama', 'Raka');


Jika await diabaikan, proses berikutnya bisa berjalan sebelum operasi penyimpanan selesai. Hal ini berpotensi menyebabkan data belum tersedia ketika dibutuhkan

## Soal 10 — Integrasi Konsep Lintas Pertemuan

1. Arsitektur aplikasi
- Mobile: antarmuka yang digunakan mahasiswa.
- Local storage: menyimpan data sederhana atau data sementara.
- Backend: mengelola data katalog buku, akun mahasiswa, dan transaksi peminjaman.
- Sistem informasi perpustakaan: menjadi bagian pengelolaan layanan perpustakaan.
2. Functional requirements

Contoh kebutuhan yang dapat dipertimbangkan:
- Mahasiswa dapat melihat katalog buku.
- Mahasiswa dapat mengajukan peminjaman buku.
Keduanya merupakan kebutuhan fungsional karena menjelaskan layanan yang harus disediakan sistem.

3. Model Book

Model buku minimal memiliki empat atribut. Misalnya:
Atribut	Tipe data
id	String
judul	String
penulis	String
stok	int

4. State dan CRUD
- Create: mahasiswa membuat pengajuan peminjaman.
- Read: mahasiswa melihat katalog dan riwayat peminjaman.
- Update: status peminjaman diperbarui.
- Delete: data tertentu dihapus sesuai aturan sistem.
State diperlukan agar tampilan dapat diperbarui ketika data berubah. Pada Flutter, salah satu mekanismenya adalah setState() untuk widget StatefulWidget.
