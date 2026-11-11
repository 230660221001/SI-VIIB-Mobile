# Tes Konsep UTS — Muhammad Andre Nugraha 230660221113

## Soal 1 — Konsep Aplikasi Bergerak dalam SI

Aplikasi mobile lebih tepat digunakan untuk layanan pengajuan surat keterangan mahasiswa karena memiliki beberapa karakteristik yang mendukung kebutuhan mahasiswa dalam mengakses layanan kampus.

1. **Karakteristik: Mobilitas (Mobility)**

   **Contoh penerapan:** Mahasiswa dapat mengajukan surat keterangan aktif kuliah melalui smartphone dari mana saja, misalnya dari rumah, tempat kerja, atau saat berada di kampus tanpa harus datang langsung ke loket administrasi.

2. **Karakteristik: Kemudahan akses (Accessibility)**

   **Contoh penerapan:** Aplikasi dapat diakses melalui smartphone dengan tampilan yang sederhana. Mahasiswa cukup membuka aplikasi, memilih jenis surat, mengisi formulir, dan mengirim pengajuan tanpa harus menggunakan komputer desktop.

3. **Karakteristik: Pemanfaatan fitur perangkat mobile**

   **Contoh penerapan:** Aplikasi dapat memanfaatkan kamera untuk mengambil foto atau mengunggah dokumen persyaratan. Selain itu, notifikasi pada smartphone dapat digunakan untuk memberi informasi ketika pengajuan surat sudah selesai diproses.

Dengan karakteristik tersebut, aplikasi mobile dapat membuat pelayanan administrasi lebih praktis, mengurangi kebutuhan mahasiswa untuk datang ke loket, dan mempermudah pemantauan pengajuan surat.

## Soal 2 — Dasar Pemrograman Dart

- **`List<String> daftarSurat = []`:**

  `List<String>` digunakan untuk membuat kumpulan data yang berisi beberapa nilai bertipe String. Tanda `[]` menunjukkan bahwa list dibuat dalam keadaan kosong. Dalam kasus ini, list digunakan untuk menyimpan daftar jenis surat yang tersedia.

- **Parameter `String jenis`:**

  Parameter `String jenis` digunakan untuk menerima data berupa teks dari pemanggilan fungsi. Data tersebut berisi nama atau jenis surat yang akan ditambahkan ke dalam daftar.

- **`jenis.isEmpty`:**

  `isEmpty` digunakan untuk memeriksa apakah sebuah String kosong atau tidak. Jika nilainya kosong, berarti pengguna belum memasukkan jenis surat.

- **`return` pada kondisi error:**

  `return` digunakan untuk menghentikan proses fungsi ketika terjadi kondisi yang tidak sesuai. Misalnya, jika jenis surat kosong, fungsi dihentikan agar data yang tidak valid tidak dimasukkan ke dalam list.

- **`daftarSurat.add(jenis)`:**

  Method `add()` digunakan untuk menambahkan data baru ke bagian akhir List. Dalam kasus ini, jenis surat yang sudah melewati validasi akan dimasukkan ke dalam daftar surat.

- **Perulangan `for`:**

  Perulangan `for` digunakan untuk membaca atau memproses setiap elemen yang terdapat dalam list secara berurutan. Dengan demikian, semua jenis surat dapat ditampilkan tanpa harus menuliskan perintah untuk setiap data secara manual.

**Kesalahan umum bila validasi `isEmpty` dihapus:**

Jika validasi `isEmpty` dihapus, pengguna dapat memasukkan data kosong ke dalam daftar. Akibatnya, daftar surat bisa memiliki item yang tidak mempunyai nama atau informasi yang jelas. Hal tersebut dapat membuat tampilan aplikasi membingungkan dan menyebabkan data yang disimpan menjadi tidak valid.

## Soal 3 — Struktur Flutter dan Widget

- **MaterialApp:**

  `MaterialApp` merupakan widget utama yang mengatur konfigurasi aplikasi Flutter dengan desain Material Design. Widget ini mengatur tema, judul aplikasi, dan halaman awal yang akan ditampilkan.

- **Scaffold:**

  `Scaffold` menyediakan struktur dasar sebuah halaman aplikasi, seperti area AppBar, body, floating action button, dan komponen lainnya. Dengan Scaffold, tampilan halaman dapat disusun secara teratur.

- **AppBar:**

  `AppBar` merupakan bagian atas halaman yang biasanya digunakan untuk menampilkan judul halaman dan tombol navigasi. Pada halaman daftar surat, AppBar dapat menampilkan judul "Daftar Surat".

- **Column:**

  `Column` digunakan untuk menyusun beberapa widget secara vertikal atau dari atas ke bawah. Contohnya, menampilkan judul halaman, keterangan, dan daftar surat dalam satu halaman.

- **Text:**

  `Text` digunakan untuk menampilkan tulisan pada aplikasi, seperti judul, keterangan, nama jenis surat, dan informasi lainnya.

- **ListView.builder:**

  `ListView.builder` digunakan untuk menampilkan daftar data secara dinamis. Widget ini membangun item sesuai kebutuhan sehingga cocok untuk menampilkan banyak jenis surat, misalnya 20 jenis surat, tanpa harus membuat setiap item secara manual.

**Masalah bila ListView.builder di dalam Column tanpa Expanded:**

ListView dapat mengalami error karena tidak mendapatkan batas tinggi yang jelas ketika ditempatkan langsung di dalam Column.

**Penyebab:**

Column memberikan ruang vertikal yang tidak terbatas kepada anak widget tertentu. Sementara itu, ListView membutuhkan batas ukuran tinggi agar dapat menentukan area untuk menampilkan dan menggulir daftar.

**Perbaikan:**

Gunakan `Expanded` untuk membungkus ListView.builder agar ListView mendapatkan sisa ruang yang tersedia di dalam Column.

Contoh:

```dart
Column(
  children: [
    const Text('Daftar Surat'),
    Expanded(
      child: ListView.builder(
        itemCount: daftarSurat.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(daftarSurat[index]),
          );
        },
      ),
    ),
  ],
)
```

Dengan menggunakan Expanded, daftar surat dapat ditampilkan dan digulir tanpa menimbulkan masalah batas ukuran.

## Soal 4 — Analisis Kebutuhan dan User Flow

**Klasifikasi dan prioritas:**

| No. | Permintaan | Fungsional/Nonfungsional | Prioritas MoSCoW | Alasan |
|:---:|:-----------|:-------------------------|:----------------:|:-------|
| 1 | Mengajukan surat keterangan aktif kuliah | Fungsional | Must Have | Fitur ini merupakan fungsi utama aplikasi. Tanpa fitur pengajuan, tujuan aplikasi tidak dapat tercapai. |
| 2 | Melihat status pengajuan | Fungsional | Must Have | Mahasiswa perlu mengetahui apakah pengajuan masih diproses, disetujui, atau sudah selesai. |
| 3 | Menerima notifikasi saat surat siap diambil | Fungsional | Should Have | Notifikasi merupakan fitur tambahan yang mempermudah mahasiswa memperoleh informasi. Pengajuan dan pemeriksaan status masih dapat dilakukan tanpa notifikasi otomatis. |

Ketiga permintaan tersebut termasuk kebutuhan fungsional karena semuanya menjelaskan layanan atau tindakan yang harus dapat dilakukan oleh sistem. Kebutuhan nonfungsional lebih berkaitan dengan kualitas sistem, seperti keamanan, kemudahan penggunaan, dan kecepatan respons.

**User flow untuk kebutuhan Must Have:**

1. Mahasiswa membuka aplikasi layanan surat kampus.
2. Mahasiswa melakukan login menggunakan akun mahasiswa.
3. Sistem menampilkan halaman utama dan daftar layanan surat.
4. Mahasiswa memilih layanan surat keterangan aktif kuliah.
5. Sistem menampilkan formulir pengajuan surat.
6. Mahasiswa mengisi data yang diperlukan, kemudian menekan tombol kirim.
7. Sistem memvalidasi data, menyimpan pengajuan, dan menampilkan informasi bahwa pengajuan berhasil dikirim. Mahasiswa dapat membuka halaman status untuk melihat perkembangan pengajuannya.

## Soal 5 — UI/UX Mobile

1. **Prinsip: Kesederhanaan tampilan (Simplicity)**

   **Keputusan desain:** Saya akan membuat halaman daftar 20 jenis surat dengan tampilan yang sederhana, menggunakan judul yang jelas, kategori surat, dan informasi singkat pada setiap item.

   **Alasan:** Ukuran layar smartphone lebih kecil dibandingkan komputer. Tampilan yang sederhana membuat mahasiswa lebih mudah memahami informasi dan menemukan jenis surat yang dibutuhkan tanpa harus membaca terlalu banyak tulisan.

2. **Prinsip: Kemudahan interaksi sentuh (Touch-Friendly)**

   **Keputusan desain:** Setiap pilihan surat dibuat dalam bentuk card atau ListTile dengan area sentuh yang cukup luas. Tombol juga diberi jarak agar tidak terlalu berdekatan.

   **Alasan:** Pengguna smartphone berinteraksi menggunakan jari, bukan mouse. Area sentuh yang cukup besar dapat mengurangi kesalahan saat memilih jenis surat atau menekan tombol.

3. **Prinsip: Navigasi yang mudah dan efisien**

   **Keputusan desain:** Saya akan menyediakan kolom pencarian dan pengelompokan jenis surat berdasarkan kategori. Dengan begitu, pengguna dapat langsung mencari surat yang dibutuhkan.

   **Alasan:** Penggunaan aplikasi mobile biasanya dilakukan dalam waktu singkat. Fitur pencarian dan kategori membantu mahasiswa menemukan informasi dengan lebih cepat tanpa harus menggulir seluruh daftar satu per satu.

## Soal 6 — Navigasi dan Interaksi

**Metode navigasi dan kapan digunakan:**

- **`push`:**

  `Navigator.push()` digunakan untuk berpindah dari satu halaman ke halaman lain dengan membuat halaman baru di atas halaman sebelumnya. Contohnya, ketika mahasiswa memilih jenis surat dari halaman daftar, aplikasi membuka halaman form pengajuan.

- **`pushNamed`:**

  `Navigator.pushNamed()` digunakan untuk berpindah halaman menggunakan nama route yang sudah didaftarkan pada MaterialApp. Cara ini membuat pengaturan navigasi lebih terstruktur, terutama ketika aplikasi memiliki banyak halaman.

- **`pop`:**

  `Navigator.pop()` digunakan untuk menutup halaman yang sedang aktif dan kembali ke halaman sebelumnya. Contohnya, setelah mahasiswa selesai melihat detail status, mahasiswa dapat kembali ke halaman daftar pengajuan.

**Pengiriman data jenis surat ke halaman form:**

Data jenis surat dapat dikirim dari halaman daftar ke halaman form melalui parameter konstruktor saat menggunakan Navigator.push(). Misalnya, ketika mahasiswa memilih "Surat Keterangan Aktif Kuliah", nama surat tersebut dikirim ke halaman form dan diterima melalui parameter `jenisSurat`.

Contoh:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => FormPengajuan(
      jenisSurat: 'Surat Keterangan Aktif Kuliah',
    ),
  ),
);
```

Dengan cara tersebut, halaman form dapat langsung menampilkan jenis surat yang dipilih tanpa meminta mahasiswa memilih ulang.

**Feedback setelah form dikirim:**

Setelah mahasiswa menekan tombol kirim, aplikasi melakukan validasi terhadap data yang dimasukkan. Jika data valid, aplikasi menyimpan pengajuan dan menampilkan feedback menggunakan `SnackBar`, misalnya "Pengajuan surat berhasil dikirim". Jika terdapat data yang belum diisi, aplikasi menampilkan pesan kesalahan agar mahasiswa dapat memperbaikinya.

## Soal 7 — Model Data dan State

**Mengapa setiap field bersifat final:**

Field pada model dibuat menggunakan `final` agar nilai setiap properti tidak dapat diubah setelah objek dibuat. Hal ini membantu menjaga konsistensi data dan mengurangi risiko perubahan nilai yang tidak disengaja. Jika terdapat perubahan data, aplikasi dapat membuat objek baru dengan nilai yang sudah diperbarui.

**Mengapa id wajib ada:**

`id` digunakan sebagai identitas unik untuk membedakan satu data pengajuan dengan data lainnya. Dalam aplikasi pengajuan surat, setiap pengajuan harus mempunyai id agar sistem dapat mengetahui data yang tepat ketika melakukan operasi update dan delete. Nama surat saja tidak cukup karena mahasiswa dapat mengajukan jenis surat yang sama lebih dari satu kali.

**Perbedaan StatelessWidget dan StatefulWidget:**

`StatelessWidget` digunakan untuk widget yang tampilannya tidak bergantung pada perubahan state internal. Data atau tampilan widget tidak dikelola melalui setState.

`StatefulWidget` digunakan untuk widget yang memiliki state dan dapat berubah selama aplikasi berjalan. Perubahan state dapat menyebabkan Flutter membangun ulang tampilan widget.

**Halaman daftar menggunakan: StatefulWidget**

**Alasan:**

Halaman daftar pengajuan lebih tepat menggunakan StatefulWidget karena data pengajuan dapat berubah ketika pengguna menambahkan, mengubah, atau menghapus data. Dengan StatefulWidget, perubahan data dapat ditampilkan kembali pada halaman menggunakan setState.

**Fungsi setState:**

`setState()` digunakan untuk memberi tahu Flutter bahwa terdapat perubahan pada state. Setelah setState dipanggil, Flutter akan menjalankan kembali proses build agar tampilan mencerminkan data terbaru.

**Apa yang terjadi bila data ditambah tanpa setState:**

Data mungkin sudah bertambah di dalam List, tetapi tampilan aplikasi belum tentu langsung diperbarui. Hal ini terjadi karena Flutter tidak mendapatkan pemberitahuan bahwa state telah berubah. Akibatnya, pengguna bisa melihat daftar yang masih menampilkan data lama sampai terjadi pembangunan ulang widget karena sebab lain.

## Soal 8 — CRUD Lokal

CRUD merupakan empat operasi dasar untuk mengelola data, yaitu Create, Read, Update, dan Delete.

| Operasi | Method List / mekanisme |
|:--------|:------------------------|
| Create | `add()` untuk menambahkan data baru ke dalam List. |
| Read | Membaca data menggunakan perulangan `for`, `forEach()`, atau menampilkan data melalui ListView.builder. |
| Update | Mencari data berdasarkan id, kemudian mengganti objek pada posisi yang ditemukan menggunakan `list[index] = dataBaru`. |
| Delete | `removeWhere()` untuk menghapus data yang memiliki id sesuai dengan data yang dipilih. |

**Mengapa id digunakan sebagai kunci update dan delete:**

Id digunakan karena setiap data mempunyai identitas yang unik dan tetap. Dengan menggunakan id, aplikasi dapat menemukan data yang benar meskipun posisi data di dalam daftar berubah. Misalnya, pengajuan dengan id 101 tetap dapat ditemukan walaupun sebelumnya berada di urutan pertama dan kemudian berpindah ke urutan ketiga.

**Konsekuensi bila index digunakan sebagai kunci:**

Index menunjukkan posisi data dalam List, bukan identitas tetap dari data tersebut. Ketika ada data yang dihapus atau urutan daftar berubah, index data lainnya juga dapat berubah. Jika index lama tetap digunakan, aplikasi berisiko mengubah atau menghapus data yang salah. Oleh karena itu, penggunaan id lebih aman untuk operasi update dan delete.

## Soal 9 — Persistensi Data Lokal

**Perbedaan in-memory dan persistensi:**

In-memory merupakan penyimpanan data sementara di dalam memori selama aplikasi berjalan. Contohnya adalah menyimpan data pengajuan dalam sebuah `List<DataPengajuan>`. Kelemahannya, data dapat hilang ketika aplikasi ditutup atau proses aplikasi dihentikan.

Sementara itu, persistensi menggunakan package `shared_preferences` memungkinkan data sederhana disimpan pada penyimpanan lokal perangkat sehingga masih dapat dibaca ketika aplikasi dibuka kembali. Data yang disimpan dapat berupa String, int, double, bool, dan List<String>. Untuk menyimpan objek yang lebih kompleks, data dapat diubah terlebih dahulu menjadi format JSON.

**Mengapa operasi shared_preferences asinkron (Future):**

Operasi penyimpanan melibatkan proses membaca atau menulis ke penyimpanan perangkat. Proses tersebut tidak selalu selesai secara langsung. Oleh karena itu, operasi dijalankan secara asinkron menggunakan Future agar tidak menghambat jalannya aplikasi dan membuat antarmuka tetap responsif.

**Apa yang terjadi bila await diabaikan:**

Jika `await` diabaikan, proses penyimpanan dapat berjalan tanpa menunggu hasilnya selesai. Akibatnya, aplikasi bisa melanjutkan proses berikutnya sebelum data benar-benar selesai disimpan. Misalnya, aplikasi langsung menampilkan pesan berhasil atau berpindah halaman padahal proses penyimpanan belum selesai. Hal tersebut dapat menyebabkan data belum tersimpan ketika aplikasi ditutup terlalu cepat.

**Contoh situasi in-memory sudah cukup:**

In-memory sudah cukup untuk menyimpan data sementara pada halaman formulir, seperti teks yang sedang diketik pengguna sebelum tombol simpan ditekan. Data sementara tersebut tidak harus tetap ada setelah aplikasi ditutup.

**Contoh situasi persistensi mutlak diperlukan:**

Persistensi diperlukan untuk menyimpan data pengajuan surat yang sudah dikirim oleh mahasiswa. Data tersebut harus tetap tersedia ketika aplikasi ditutup dan dibuka kembali agar mahasiswa tidak kehilangan informasi pengajuan dan dapat melihat riwayatnya.

## Soal 10 — Integrasi Konsep Lintas Pertemuan

Saya merancang aplikasi mobile perpustakaan kampus yang digunakan untuk mencari buku, melakukan peminjaman, dan melihat riwayat peminjaman. Aplikasi dibuat menggunakan Flutter dan Dart dengan tampilan yang sederhana agar mudah digunakan oleh mahasiswa.

**1. Arsitektur**

Hubungan aplikasi mobile, penyimpanan lokal, dan backend Sistem Informasi:

Aplikasi mobile Flutter berfungsi sebagai antarmuka yang digunakan mahasiswa untuk melihat katalog dan melakukan peminjaman buku. Penyimpanan lokal digunakan untuk menyimpan data sementara atau cache agar beberapa informasi masih dapat diakses ketika koneksi internet terganggu.

Backend Sistem Informasi perpustakaan berfungsi untuk mengelola data utama, seperti katalog buku, akun mahasiswa, ketersediaan buku, dan transaksi peminjaman. Aplikasi mobile berkomunikasi dengan backend melalui REST API. Data peminjaman yang dikirim dari aplikasi akan diproses oleh backend, kemudian hasilnya dikirim kembali ke aplikasi untuk ditampilkan.

Dengan arsitektur tersebut, backend menjadi sumber data utama sehingga informasi peminjaman dapat dikelola secara terpusat.

**2. Kebutuhan & Alur**

**Dua kebutuhan Must Have:**

1. Mahasiswa dapat melihat dan mencari katalog buku berdasarkan judul atau kategori agar dapat menemukan buku yang ingin dipinjam.
2. Mahasiswa dapat mengajukan peminjaman buku dan melihat status serta riwayat peminjamannya.

**Alur pengguna dari membuka aplikasi hingga tugas selesai:**

1. Mahasiswa membuka aplikasi perpustakaan kampus.
2. Mahasiswa melakukan login menggunakan akun mahasiswa.
3. Sistem menampilkan halaman katalog buku.
4. Mahasiswa mencari atau memilih buku yang ingin dipinjam.
5. Sistem menampilkan detail buku, termasuk informasi ketersediaannya.
6. Mahasiswa menekan tombol pinjam dan mengisi informasi peminjaman yang diperlukan.
7. Sistem memvalidasi permintaan dan menyimpan transaksi peminjaman.
8. Sistem menampilkan informasi bahwa pengajuan peminjaman berhasil atau perlu diperiksa kembali.
9. Mahasiswa membuka halaman riwayat untuk melihat status peminjaman.

**3. Struktur Komponen**

Halaman katalog digunakan untuk menampilkan daftar buku menggunakan ListView.builder. Setiap item dapat menampilkan judul buku, nama penulis, kategori, dan informasi ketersediaan.

Halaman form peminjaman digunakan untuk menampilkan informasi buku yang dipilih serta formulir peminjaman. Form dapat menggunakan TextField, DropdownButtonFormField, dan tombol untuk mengirim permintaan peminjaman.

Navigasi antarhalaman menggunakan Navigator. Ketika mahasiswa memilih buku, aplikasi menggunakan `Navigator.push()` untuk membuka halaman detail atau form peminjaman sambil mengirimkan data buku yang dipilih. Setelah proses selesai, `Navigator.pop()` dapat digunakan untuk kembali ke halaman sebelumnya.

**4. Data & State**

**Definisi model data Buku (minimal 4 field):**

Model `Buku` dapat memiliki beberapa field berikut:

```dart
class Buku {
  final String id;
  final String judul;
  final String penulis;
  final String kategori;
  final int stok;

  const Buku({
    required this.id,
    required this.judul,
    required this.penulis,
    required this.kategori,
    required this.stok,
  });
}
```

Field `id` digunakan sebagai identitas unik buku. `judul` digunakan untuk menyimpan nama buku, `penulis` untuk menyimpan nama pengarang, `kategori` untuk mengelompokkan buku, dan `stok` untuk menunjukkan jumlah buku yang tersedia.

**Cara operasi Create (meminjam) dan Read (melihat riwayat) dikelola dalam state:**

Untuk operasi Create, ketika mahasiswa mengajukan peminjaman, aplikasi membuat objek data peminjaman baru yang memiliki id unik, id buku, identitas mahasiswa, tanggal peminjaman, dan status. Objek tersebut kemudian ditambahkan ke dalam List menggunakan `add()`. Perubahan state dilakukan menggunakan `setState()` agar tampilan aplikasi diperbarui.

Untuk operasi Read, aplikasi membaca data peminjaman yang tersimpan dalam List dan menampilkannya pada halaman riwayat menggunakan ListView.builder. Jika aplikasi sudah terhubung dengan backend, data riwayat dapat diambil melalui REST API. Hasilnya kemudian disimpan dalam state dan ditampilkan kepada mahasiswa.

Dengan menggabungkan model data, pengelolaan state, navigasi, dan penyimpanan data, aplikasi perpustakaan dapat membantu mahasiswa melakukan peminjaman buku dengan lebih mudah dan terstruktur.