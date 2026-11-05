# Tes Konsep UTS — Marsya Anastasya — 230660221100

## Soal 1 — Konsep Aplikasi Bergerak dalam SI

Tiga karakteristik aplikasi bergerak yang menjadikan solusi mobile lebih tepat untuk layanan pengajuan surat keterangan mahasiswa adalah:

**1. Mobilitas dan kemudahan akses**

Aplikasi mobile dapat digunakan melalui smartphone sehingga pengguna tidak harus berada di depan komputer atau datang langsung ke loket administrasi. Mahasiswa dapat mengakses layanan dari berbagai tempat selama memiliki perangkat dan koneksi yang dibutuhkan.

Contoh penerapan: Mahasiswa dapat membuka aplikasi dari rumah atau lingkungan kampus, memilih jenis surat keterangan aktif kuliah, dan mengisi formulir pengajuan tanpa harus datang mengambil formulir secara langsung.

**2. Memanfaatkan fitur perangkat mobile**

Aplikasi mobile dapat memanfaatkan fitur bawaan smartphone seperti kamera, lokasi, penyimpanan, dan notifikasi. Hal ini memungkinkan aplikasi memberikan layanan yang lebih terintegrasi dengan perangkat pengguna.

Contoh penerapan: Aplikasi dapat menggunakan notifikasi untuk memberi tahu mahasiswa ketika pengajuan surat sudah diproses atau surat sudah siap diambil.

**3. Antarmuka yang mendukung interaksi sentuh**

Aplikasi mobile dirancang untuk digunakan melalui layar sentuh dengan tampilan yang menyesuaikan ukuran layar smartphone. Tombol, formulir, dan menu dapat dibuat agar mudah dijangkau dan digunakan.

Contoh penerapan: Mahasiswa dapat memilih jenis surat melalui tombol atau daftar pilihan, mengisi formulir menggunakan keyboard smartphone, kemudian menekan tombol kirim untuk mengajukan surat.

Dengan ketiga karakteristik tersebut, layanan pengajuan surat dapat menjadi lebih praktis, mudah diakses, dan mengurangi kebutuhan mahasiswa untuk datang langsung ke loket administrasi.

## Soal 2 — Dasar Pemrograman Dart

Berikut fungsi setiap bagian kode Dart:

**1. `List<String> daftarSurat = [];`**

`List<String>` merupakan struktur data yang digunakan untuk menyimpan kumpulan nilai bertipe String atau teks. Variabel `daftarSurat` dibuat sebagai List kosong yang nantinya dapat menampung berbagai jenis surat.

**2. Parameter `String jenis`**

Parameter tersebut digunakan untuk menerima masukan berupa teks ketika fungsi `tambahSurat()` dipanggil. Nilai yang diterima akan menjadi jenis surat yang ingin ditambahkan ke dalam daftar.

**3. `jenis.isEmpty`**

`isEmpty` merupakan properti untuk memeriksa apakah suatu String kosong. Jika nilainya kosong, kondisi tersebut akan bernilai `true` sehingga sistem dapat mengetahui bahwa pengguna belum mengisi jenis surat.

**4. `return` pada kondisi error**

`return` digunakan untuk menghentikan jalannya fungsi ketika terjadi kondisi yang tidak sesuai. Dalam kode tersebut, fungsi dihentikan jika jenis surat kosong sehingga data tidak dilanjutkan ke proses penyimpanan.

**5. `daftarSurat.add(jenis)`**

Method `add()` digunakan untuk menambahkan nilai baru ke bagian akhir List. Pada kode tersebut, jenis surat yang sudah lolos validasi akan dimasukkan ke dalam `daftarSurat`.

**6. Perulangan `for`**

Perulangan `for` digunakan untuk menjalankan instruksi secara berulang berdasarkan jumlah data dalam List. Pada fungsi `tampilkanSurat()`, perulangan digunakan untuk membaca setiap jenis surat dan menampilkannya dengan nomor urut.

**Kesalahan umum bila validasi `isEmpty` dihapus:**

Jika validasi dihapus, pengguna dapat memasukkan data kosong ke dalam daftar surat. Akibatnya, daftar dapat berisi data yang tidak memiliki informasi jenis surat sehingga membingungkan pengguna dan dapat mengganggu proses pengajuan berikutnya.

## Soal 3 — Struktur Flutter dan Widget

Fungsi setiap widget pada struktur halaman daftar surat adalah:

**1. `MaterialApp`**

Merupakan widget utama untuk aplikasi Flutter yang menggunakan Material Design. Widget ini mengatur konfigurasi aplikasi, seperti tema, halaman awal, dan navigasi.

**2. `Scaffold`**

Menyediakan struktur dasar sebuah halaman aplikasi, seperti bagian AppBar, body, dan FloatingActionButton. Pada contoh tersebut, Scaffold menjadi kerangka halaman daftar surat.

**3. `AppBar`**

Merupakan bagian atas halaman yang digunakan untuk menampilkan judul atau tombol navigasi. Pada kode tersebut, AppBar menampilkan judul "Daftar Surat".

**4. `Column`**

Digunakan untuk menyusun beberapa widget secara vertikal dari atas ke bawah. Pada contoh, Column menempatkan teks petunjuk dan daftar surat dalam satu susunan vertikal.

**5. `Text`**

Digunakan untuk menampilkan tulisan pada antarmuka aplikasi. Contohnya, teks "Pilih jenis surat" digunakan sebagai petunjuk bagi pengguna.

**6. `ListView.builder`**

Digunakan untuk menampilkan daftar data secara dinamis. Widget ini membangun item sesuai kebutuhan sehingga cocok digunakan untuk daftar yang memiliki banyak data.

**Masalah bila `ListView.builder` ditempatkan di dalam `Column` tanpa `Expanded`:**

Masalah yang dapat terjadi adalah `RenderFlex overflow` atau error karena ListView mendapatkan tinggi yang tidak terbatas. Hal ini terjadi karena Column tidak otomatis memberikan batas tinggi tertentu kepada ListView yang berada di dalamnya.

**Penyebab:**

ListView membutuhkan batas ukuran agar dapat menentukan area gulirnya, sedangkan Column dapat memberikan ruang vertikal yang tidak terbatas kepada anak widget tertentu.

**Perbaikan:**

Gunakan `Expanded` atau `Flexible` agar ListView mendapatkan batas ruang yang tersedia. Contohnya:

```dart
Column(
  children: [
    Text('Pilih jenis surat'),
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

Dengan menggunakan Expanded, ListView akan mengisi sisa ruang yang tersedia dan dapat melakukan scrolling dengan baik.

## Soal 4 — Analisis Kebutuhan dan User Flow

Kebutuhan fungsional merupakan kebutuhan yang menjelaskan fitur atau layanan yang harus dapat dilakukan oleh sistem. Sementara itu, kebutuhan nonfungsional menjelaskan kualitas atau batasan sistem, seperti kinerja, keamanan, dan kemudahan penggunaan.

Ketiga permintaan mahasiswa termasuk kebutuhan fungsional karena semuanya menjelaskan layanan yang harus disediakan aplikasi.

**Klasifikasi dan prioritas:**

| No. | Permintaan | Fungsional/Nonfungsional | Prioritas MoSCoW | Alasan |
|:---:|:-----------|:-------------------------|:----------------:|:-------|
| 1 | Mengajukan surat keterangan aktif kuliah | Fungsional | Must | Merupakan fungsi utama aplikasi. Tanpa fitur ini, mahasiswa tidak dapat melakukan pengajuan surat melalui aplikasi. |
| 2 | Melihat status pengajuan | Fungsional | Must | Mahasiswa perlu mengetahui perkembangan pengajuan agar tidak harus datang langsung ke loket hanya untuk menanyakan statusnya. |
| 3 | Menerima notifikasi saat surat siap diambil | Fungsional | Should | Notifikasi membantu memberikan informasi secara otomatis, tetapi pada tahap awal mahasiswa masih dapat memeriksa status melalui aplikasi. |

**User flow untuk kebutuhan Must:**

1. Mahasiswa membuka aplikasi pengajuan surat.
2. Mahasiswa memilih menu pengajuan surat.
3. Mahasiswa memilih jenis surat keterangan aktif kuliah.
4. Mahasiswa mengisi formulir pengajuan sesuai informasi yang diminta.
5. Mahasiswa menekan tombol kirim.
6. Sistem memvalidasi dan menyimpan data pengajuan.
7. Mahasiswa membuka daftar pengajuan untuk melihat status surat yang telah dikirim.

**Gambaran User flow:**

flowchart TD
    A([Mulai]) --> B[Pengguna membuka aplikasi]
    B --> C[Memilih jenis surat]
    C --> D[Mengisi formulir pengajuan]
    D --> E{Data sudah lengkap?}
    E -- Tidak --> D
    E -- Ya --> F[Mengirim pengajuan]
    F --> G[Sistem menyimpan pengajuan]
    G --> H[Menampilkan konfirmasi]
    H --> I[Pengguna melihat status pengajuan]
    I --> J([Selesai])

## Soal 5 — UI/UX Mobile

Tiga prinsip UI/UX mobile yang perlu diperhatikan pada halaman daftar 20 jenis surat adalah:

**1. Kesederhanaan dan keterbacaan**

Prinsip ini bertujuan agar informasi mudah dipahami dan tidak membuat pengguna bingung ketika menggunakan aplikasi.

Keputusan desain: Setiap item daftar menampilkan nama surat, status pengajuan, dan tombol ajukan dengan susunan yang sederhana. Daftar ditampilkan secara vertikal menggunakan ListView.

Alasan: Ukuran layar smartphone terbatas sehingga informasi perlu disusun secara ringkas. Pengguna dapat melihat informasi penting tanpa harus membuka terlalu banyak halaman.

**2. Kemudahan interaksi sentuh**

Prinsip ini memperhatikan kenyamanan pengguna ketika menekan tombol atau memilih menu melalui layar sentuh.

Keputusan desain: Tombol ajukan dibuat dengan ukuran yang cukup besar, memiliki jarak antarelemen, dan ditempatkan pada posisi yang mudah dijangkau.

Alasan: Tombol yang terlalu kecil atau berdekatan dapat menyebabkan pengguna salah menekan. Ukuran dan jarak yang sesuai membuat interaksi menjadi lebih nyaman.

**3. Efisiensi dan konsistensi**

Prinsip ini bertujuan agar pengguna dapat menyelesaikan tugas dengan cepat melalui tampilan dan pola interaksi yang mudah dipahami.

Keputusan desain: Setiap jenis surat menggunakan pola tampilan yang sama, dilengkapi fitur pencarian agar pengguna dapat menemukan salah satu dari 20 jenis surat dengan lebih cepat.

Alasan: Pengguna biasanya menggunakan aplikasi untuk menyelesaikan kebutuhan tertentu dalam waktu singkat. Tampilan yang konsisten dan fitur pencarian dapat mengurangi waktu yang dibutuhkan untuk menemukan surat.

## Soal 6 — Navigasi dan Interaksi

Navigasi pada aplikasi pengajuan surat terdiri dari tiga halaman, yaitu halaman daftar surat, halaman form pengajuan, dan halaman detail status.

**Metode navigasi dan kapan digunakan:**

- **`Navigator.push()`**

  Digunakan untuk membuka halaman baru di atas halaman yang sedang ditampilkan. Contohnya, ketika mahasiswa memilih jenis surat dari halaman daftar, aplikasi membuka halaman form pengajuan.

- **`Navigator.pushNamed()`**

  Digunakan untuk berpindah halaman berdasarkan nama route yang sudah ditentukan pada konfigurasi aplikasi. Contohnya, aplikasi dapat membuka halaman detail status menggunakan route bernama `/detail`.

- **`Navigator.pop()`**

  Digunakan untuk menutup halaman yang sedang terbuka dan kembali ke halaman sebelumnya. Contohnya, setelah melihat detail status, mahasiswa dapat kembali ke daftar pengajuan.

Ketiga metode tersebut dapat digunakan sesuai kebutuhan navigasi. `push()` dan `pushNamed()` merupakan dua cara alternatif untuk membuka halaman baru, sedangkan `pop()` digunakan untuk kembali.

**Pengiriman data jenis surat ke halaman form:**

Data jenis surat dapat dikirim melalui parameter constructor halaman tujuan. Ketika mahasiswa memilih salah satu jenis surat, nilai tersebut dikirim ke halaman form agar jenis surat yang dipilih dapat langsung ditampilkan.

Contoh:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => FormSurat(
      jenisSurat: 'Surat Aktif Kuliah',
    ),
  ),
);
```

Pada halaman `FormSurat`, nilai tersebut diterima melalui constructor dan digunakan untuk menampilkan jenis surat yang dipilih.

**Feedback setelah form dikirim:**

Setelah mahasiswa menekan tombol kirim dan data berhasil divalidasi serta disimpan, aplikasi dapat menampilkan `SnackBar` atau `AlertDialog` sebagai pemberitahuan bahwa pengajuan berhasil dikirim. Setelah itu, aplikasi dapat mengarahkan mahasiswa ke halaman detail status agar mahasiswa dapat melihat informasi pengajuannya.

**Gambaran Navigation Flow:**

flowchart TD
    A[Halaman Daftar Surat] -->|Pilih jenis surat| B[Halaman Form Pengajuan]
    B -->|Kirim berhasil| C[Halaman Detail/Status]
    B -->|Kembali| A
    C -->|Kembali| A

## Soal 7 — Model Data dan State

**Mengapa setiap field bersifat `final`:**

Field pada model `PengajuanSurat` dibuat menggunakan `final` agar nilai setiap field tidak dapat diubah secara langsung setelah objek dibuat. Hal ini membantu menjaga konsistensi data dan mengurangi perubahan yang tidak disengaja.

Jika terdapat perubahan data, aplikasi dapat membuat objek baru dengan nilai yang sudah diperbarui, kemudian mengganti objek lama di dalam List.

**Mengapa `id` wajib ada:**

`id` berfungsi sebagai identitas unik untuk setiap pengajuan surat. Dengan adanya ID, aplikasi dapat membedakan satu pengajuan dengan pengajuan lainnya, meskipun jenis surat atau statusnya sama. ID juga mempermudah proses pencarian, update, dan delete data.

**Perbedaan StatelessWidget dan StatefulWidget:**

- `StatelessWidget` digunakan untuk widget yang tidak mengelola perubahan state internal. Tampilan dibangun berdasarkan data yang diterima.
- `StatefulWidget` digunakan untuk widget yang memiliki state yang dapat berubah selama aplikasi berjalan.

**Halaman daftar menggunakan: StatefulWidget.**

Alasan: Halaman daftar pengajuan membutuhkan perubahan tampilan ketika pengguna menambahkan, memperbarui, atau menghapus data pengajuan. Dengan StatefulWidget, perubahan tersebut dapat dikelola melalui state.

**Fungsi `setState`:**

`setState()` digunakan untuk memberi tahu Flutter bahwa terdapat perubahan pada state sehingga widget perlu dibangun ulang untuk menampilkan data terbaru.

**Apa yang terjadi bila data ditambah tanpa setState:**

Data pada List mungkin sudah berubah di dalam memori, tetapi Flutter tidak mendapatkan pemberitahuan untuk membangun ulang tampilan. Akibatnya, data baru belum tentu langsung terlihat pada halaman daftar sampai terjadi proses rebuild karena perubahan lain.

## Soal 8 — CRUD Lokal

CRUD merupakan empat operasi utama untuk mengelola data, yaitu Create, Read, Update, dan Delete.

| Operasi | Method List / mekanisme |
|:--------|:------------------------|
| Create | `add()` untuk menambahkan objek baru ke dalam List. |
| Read | `ListView.builder` untuk menampilkan data dari List, atau perulangan `for` untuk membaca setiap data. |
| Update | `indexWhere()` untuk mencari data berdasarkan ID, kemudian mengganti objek pada posisi yang ditemukan. |
| Delete | `removeWhere()` untuk menghapus data berdasarkan ID tertentu. |

Setiap operasi yang mengubah data pada state perlu dilakukan menggunakan `setState()` agar tampilan aplikasi diperbarui.

**Mengapa ID digunakan sebagai kunci update dan delete:**

ID digunakan karena setiap data memiliki identitas unik yang tetap meskipun posisi data di dalam List berubah. Dengan demikian, aplikasi dapat menemukan data yang benar berdasarkan identitasnya, bukan berdasarkan urutan tampilannya.

**Konsekuensi bila index digunakan sebagai kunci:**

Index menunjukkan posisi data di dalam List, bukan identitas tetap dari data tersebut. Jika ada data yang ditambahkan, dihapus, atau diurutkan ulang, posisi data dapat berubah. Akibatnya, operasi update atau delete berisiko mengenai data yang salah jika aplikasi masih menggunakan index lama.

## Soal 9 — Persistensi Data Lokal

**Perbedaan in-memory dan persistensi:**

Penyimpanan in-memory merupakan penyimpanan data sementara di dalam memori aplikasi, misalnya menggunakan `List<PengajuanSurat>` pada state. Data dapat digunakan selama aplikasi berjalan, tetapi dapat hilang ketika aplikasi dihentikan atau dimulai ulang.

Sementara itu, persistensi menggunakan `shared_preferences` memungkinkan data sederhana disimpan secara lokal sehingga masih dapat dibaca kembali setelah aplikasi ditutup dan dibuka lagi. Data pada List perlu dikonversi ke format yang dapat disimpan, misalnya JSON dalam bentuk String, karena `shared_preferences` tidak secara langsung menyimpan objek Dart kompleks.

**Mengapa operasi shared_preferences asinkron (Future):**

Operasi `shared_preferences` bersifat asynchronous karena proses membaca dan menulis data melibatkan akses penyimpanan di luar alur eksekusi utama aplikasi. Dengan proses asynchronous, aplikasi tidak perlu menunggu operasi penyimpanan secara blocking sehingga antarmuka tetap dapat berjalan dengan responsif.

`Future` menunjukkan bahwa hasil operasi akan tersedia setelah proses selesai. Kata kunci `await` digunakan untuk menunggu operasi asynchronous tersebut selesai sebelum menjalankan instruksi berikutnya.

**Apa yang terjadi bila await diabaikan:**

Jika `await` tidak digunakan ketika hasil penyimpanan perlu dipastikan selesai, instruksi berikutnya dapat berjalan sebelum proses penyimpanan selesai. Hal ini dapat menyebabkan data belum tersedia ketika langsung dibaca kembali atau proses lain dijalankan. Karena itu, operasi penyimpanan yang perlu dipastikan selesai sebaiknya ditunggu menggunakan `await`.

**Contoh situasi in-memory sudah cukup:**

In-memory sudah cukup untuk aplikasi demo atau prototype yang hanya digunakan untuk menguji alur Create, Read, Update, dan Delete selama aplikasi berjalan. Data tidak harus tetap tersedia setelah aplikasi ditutup.

**Contoh situasi persistensi diperlukan:**

Persistensi diperlukan ketika mahasiswa menggunakan aplikasi pengajuan surat dan mengharapkan data pengajuan serta statusnya tetap tersedia meskipun aplikasi ditutup atau smartphone dimulai ulang. Untuk aplikasi yang digunakan banyak mahasiswa dan petugas, penyimpanan backend juga diperlukan agar data dapat disinkronkan antarperangkat dan pengguna.

## Soal 10 — Integrasi Konsep Lintas Pertemuan

**1. Arsitektur**

Aplikasi perpustakaan kampus dapat menggunakan Flutter sebagai antarmuka mobile, penyimpanan lokal untuk menyimpan data sementara atau data yang diperlukan secara lokal, serta backend Sistem Informasi untuk mengelola data utama perpustakaan.

Hubungan komponennya:

flowchart TD
    A[Pengguna] --> B[Aplikasi Mobile]
    B --> C[UI dan Navigasi]
    C --> D[Pengelolaan State]
    D --> E[Data Lokal]
    D --> F[REST API]
    F --> G[Backend Server]
    G --> H[(Database)]

Aplikasi mobile digunakan oleh mahasiswa untuk melihat katalog dan mengajukan peminjaman. Penyimpanan lokal dapat membantu menyimpan data sementara atau cache, sedangkan backend mengelola data utama seperti informasi buku, ketersediaan, dan transaksi peminjaman. Aplikasi berkomunikasi dengan backend melalui REST API agar data dapat diperbarui dan digunakan oleh pengguna yang berbeda.

**2. Kebutuhan & Alur**

Dua kebutuhan Must Have:

1. Pengguna dapat melihat katalog buku beserta informasi dan ketersediaan buku.
2. Pengguna dapat mengajukan peminjaman buku dan melihat riwayat peminjamannya.

Alur pengguna:

1. Pengguna membuka aplikasi perpustakaan.
2. Aplikasi menampilkan halaman katalog buku.
3. Pengguna memilih buku yang ingin dipinjam.
4. Aplikasi menampilkan detail buku dan informasi ketersediaannya.
5. Pengguna memilih tombol pinjam.
6. Aplikasi menampilkan formulir peminjaman.
7. Pengguna mengisi dan mengirim formulir.
8. Sistem memvalidasi data dan menyimpan pengajuan peminjaman.
9. Aplikasi menampilkan pemberitahuan bahwa pengajuan berhasil dikirim.
10. Pengguna membuka halaman riwayat untuk melihat pengajuan peminjaman.

**3. Struktur Komponen**

Struktur widget utama yang dapat digunakan:

- `MaterialApp`: mengatur konfigurasi utama aplikasi dan navigasi.
- `Scaffold`: menyediakan struktur dasar setiap halaman.
- `AppBar`: menampilkan judul halaman.
- `Column`: menyusun komponen halaman secara vertikal.
- `ListView.builder`: menampilkan daftar buku pada halaman katalog.
- `ListTile` atau `Card`: menampilkan informasi setiap buku.
- `TextField` atau `TextFormField`: menerima input pada halaman form peminjaman.
- `ElevatedButton`: digunakan untuk menjalankan tindakan seperti mengirim pengajuan.

Halaman yang diperlukan:

- **Halaman Katalog:** Menampilkan daftar buku beserta informasi ketersediaannya.
- **Halaman Detail Buku:** Menampilkan informasi lebih lengkap mengenai buku yang dipilih.
- **Halaman Form Peminjaman:** Menampilkan formulir untuk mengajukan peminjaman.
- **Halaman Riwayat:** Menampilkan daftar pengajuan peminjaman pengguna.

Navigasi dilakukan menggunakan `Navigator.push()` untuk membuka halaman detail atau formulir dari halaman katalog. Data buku yang dipilih dapat dikirim melalui parameter constructor. Setelah pengguna selesai mengisi formulir, aplikasi dapat menyimpan data dan menampilkan feedback. `Navigator.pop()` dapat digunakan untuk kembali ke halaman sebelumnya.

**4. Data & State**

Contoh model data `Buku` dengan enam field:

```dart
class Buku {
  final String id;
  final String judul;
  final String penulis;
  final String penerbit;
  final int tahunTerbit;
  final bool tersedia;

  const Buku({
    required this.id,
    required this.judul,
    required this.penulis,
    required this.penerbit,
    required this.tahunTerbit,
    required this.tersedia,
  });
}
```

Model tersebut digunakan untuk menyimpan identitas buku, informasi judul, penulis, penerbit, tahun terbit, dan status ketersediaannya. Field `id` berfungsi sebagai identitas unik setiap buku.

Pada tahap awal, daftar buku dan riwayat peminjaman dapat dikelola menggunakan List di dalam state aplikasi.

- **Create (meminjam):** Ketika pengguna mengirim formulir peminjaman dan data dinyatakan valid, aplikasi membuat objek peminjaman baru lalu menambahkannya ke List menggunakan `add()` di dalam `setState()`.
- **Read (melihat riwayat):** Data riwayat peminjaman dibaca dari List dan ditampilkan menggunakan `ListView.builder`. Ketika ada pengajuan baru, tampilan diperbarui melalui `setState()`.

Dengan pengelolaan state tersebut, diharapkan data peminjaman dapat langsung ditampilkan pada halaman riwayat selama aplikasi masih menggunakan penyimpanan lokal. Pada pengembangan selanjutnya, data dapat dihubungkan dengan backend agar riwayat tetap tersedia dan tersinkronisasi antarperangkat.