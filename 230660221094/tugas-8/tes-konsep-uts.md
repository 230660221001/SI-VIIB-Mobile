# Tes Konsep UTS — Kikania Zahra 230660221094

## Soal 1 — Konsep Aplikasi Bergerak dalam SI
**Jawaban:**
1. **Karakteristik:** Mobilitas dan portabilitas (*mobility and portability*), yaitu aplikasi bergerak dapat diakses melalui perangkat mobile seperti smartphone yang mudah dibawa dan digunakan di berbagai tempat. Karakteristik ini memungkinkan pengguna mengakses layanan tanpa harus berada di lokasi tertentu, sehingga lebih fleksibel dibandingkan aplikasi web desktop yang umumnya digunakan melalui komputer.
**Contoh penerapan:** Mahasiswa dapat mengakses aplikasi pengajuan surat keterangan melalui smartphone dari rumah, kampus, atau tempat lainnya tanpa harus datang ke loket administrasi untuk mengambil formulir.

2. **Karakteristik:** Konektivitas nirkabel (*wireless connectivity*), yaitu aplikasi bergerak dapat memanfaatkan jaringan internet melalui Wi-Fi atau jaringan seluler untuk mengakses dan mengirimkan informasi secara daring. Konektivitas ini memungkinkan pertukaran data antara mahasiswa dan sistem administrasi berlangsung tanpa harus bertatap muka.
**Contoh penerapan:** Mahasiswa dapat mengisi dan mengirimkan formulir pengajuan surat keterangan secara online melalui aplikasi menggunakan koneksi internet. Data pengajuan dapat diterima oleh sistem administrasi kampus sehingga mahasiswa tidak perlu menyerahkan formulir secara manual di loket.

3. **Karakteristik:** Pemanfaatan fitur perangkat mobile (*mobile device capabilities*), yaitu aplikasi bergerak dapat memanfaatkan fitur bawaan smartphone, seperti kamera, GPS, notifikasi, dan penyimpanan lokal, untuk mendukung kemudahan penggunaan dan meningkatkan efisiensi layanan.
   **Contoh penerapan:** Aplikasi dapat memanfaatkan notifikasi untuk memberikan informasi mengenai status pengajuan surat, seperti pengajuan diterima, sedang diproses, atau selesai. Dengan demikian, mahasiswa dapat mengetahui perkembangan pengajuan tanpa harus datang ke loket dan menanyakan langsung kepada petugas administrasi.


## Soal 2 — Dasar Pemrograman Dart (CPMK-1)
**Jawaban:**

1. **`List<String> daftarSurat = [];`**

   `List<String>` merupakan struktur data berupa daftar yang hanya dapat menyimpan elemen bertipe `String` atau teks. Tanda `[]` menunjukkan bahwa daftar tersebut awalnya kosong. Dalam studi kasus, variabel `daftarSurat` digunakan untuk menyimpan berbagai jenis surat yang diajukan mahasiswa.

2. **Parameter `String jenis`**

   Parameter `String jenis` merupakan masukan berupa teks yang diterima oleh fungsi `tambahSurat()`. Parameter ini digunakan untuk menentukan jenis surat yang akan ditambahkan ke dalam daftar, seperti surat keterangan aktif mahasiswa atau surat keterangan lulus.

3. **`jenis.isEmpty`**

   `isEmpty` merupakan properti untuk memeriksa apakah sebuah string kosong. Jika `jenis.isEmpty` bernilai `true`, berarti mahasiswa belum memasukkan jenis surat. Validasi ini diperlukan agar sistem tidak menerima data pengajuan yang kosong.

4. **`return` pada kondisi error**

   `return` digunakan untuk menghentikan eksekusi fungsi ketika kondisi tertentu terpenuhi. Pada kode tersebut, `return` dijalankan setelah pesan kesalahan ditampilkan, sehingga data kosong tidak dilanjutkan ke proses penyimpanan.

5. **`daftarSurat.add(jenis)`**

   `add()` merupakan metode untuk menambahkan elemen baru ke dalam daftar. Pada kode tersebut, jenis surat yang telah melewati validasi dimasukkan ke dalam `daftarSurat`, sehingga dapat disimpan dan ditampilkan kembali.

6. **Perulangan `for`**

   Perulangan `for` digunakan untuk mengakses setiap elemen dalam daftar berdasarkan indeks, mulai dari `0` hingga `daftarSurat.length - 1`. Perulangan ini memungkinkan seluruh jenis surat ditampilkan secara berurutan. Ekspresi `i + 1` digunakan agar nomor yang ditampilkan dimulai dari 1, sedangkan `daftarSurat[i]` mengambil data surat sesuai indeksnya.

**Kesalahan umum bila validasi `isEmpty` dihapus:**

Jika validasi `isEmpty` dihapus, pengguna dapat memasukkan jenis surat berupa teks kosong (`""`) ke dalam daftar. Hal ini menyebabkan data pengajuan tidak lengkap dan dapat mengganggu proses administrasi karena sistem menyimpan informasi yang tidak memiliki jenis surat. Oleh karena itu, validasi diperlukan untuk menjaga kualitas dan kelengkapan data sebelum disimpan.


## Soal 3 — Struktur Flutter dan Widget (CPMK-1)
**Jawaban:**

- **MaterialApp:** Merupakan widget utama yang mengatur konfigurasi dasar aplikasi Flutter dengan desain Material Design. Widget ini mengatur tema, navigasi, dan halaman awal aplikasi. Dalam studi kasus, `MaterialApp` menjadi dasar aplikasi layanan pengajuan surat mahasiswa.
- **Scaffold:** Merupakan widget yang menyediakan struktur dasar tampilan halaman aplikasi, seperti area AppBar, body, dan komponen lainnya. Dalam studi kasus, `Scaffold` digunakan sebagai kerangka halaman daftar surat agar setiap bagian tampilan dapat disusun dengan teratur.
- **AppBar:** Merupakan widget yang menampilkan bilah bagian atas halaman, biasanya berisi judul atau tombol navigasi. Pada aplikasi pengajuan surat, `AppBar` digunakan untuk menampilkan judul halaman "Daftar Surat" sehingga mahasiswa mengetahui halaman yang sedang dibuka.
- **Column:** Merupakan widget layout yang menyusun beberapa widget anak secara vertikal dari atas ke bawah. Dalam studi kasus, `Column` digunakan untuk menyusun teks petunjuk dan daftar jenis surat secara berurutan dalam satu halaman.
- **Text:** Merupakan widget yang digunakan untuk menampilkan informasi atau tulisan pada antarmuka aplikasi. Pada contoh tersebut, `Text('Pilih jenis surat')` berfungsi memberikan petunjuk kepada mahasiswa agar memilih jenis surat yang ingin diajukan.
- **ListView.builder:** Merupakan widget yang digunakan untuk menampilkan daftar data secara dinamis dengan membuat item sesuai kebutuhan ketika ditampilkan. Widget ini lebih efisien untuk daftar yang memiliki banyak data karena tidak harus membangun seluruh item sekaligus. Dalam studi kasus, `ListView.builder` digunakan untuk menampilkan berbagai pilihan jenis surat yang dapat dipilih mahasiswa.

**Masalah bila ListView.builder di dalam Column tanpa Expanded:**
**Penyebab:** `Column` tidak memberikan batas tinggi yang jelas kepada `ListView.builder` dalam kondisi tersebut. Sementara itu, `ListView.builder` membutuhkan batasan ukuran tinggi agar dapat menentukan area untuk menampilkan daftar dan melakukan scrolling. Akibatnya, aplikasi dapat mengalami error seperti *Vertical viewport was given unbounded height*.
**Perbaikan:** Membungkus `ListView.builder` menggunakan widget `Expanded` agar daftar mendapatkan sisa ruang yang tersedia di dalam `Column`. Dengan demikian, tinggi daftar menjadi terbatas sesuai ruang halaman dan fitur scrolling dapat berjalan dengan baik.

Contoh perbaikan kode:
```dart
body: Column(
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
),
```

## Soal 4 — Analisis Kebutuhan dan User Flow (CPMK-2)

**Jawaban:**

### Klasifikasi dan Prioritas Kebutuhan

| No. | Permintaan | Fungsional/Nonfungsional | Prioritas MoSCoW | Alasan |
|:---:|---|---|:---:|---|
| 1 | Mengajukan surat keterangan aktif kuliah. | Fungsional | Must | Fitur pengajuan surat merupakan fungsi utama aplikasi. Tanpa fitur ini, mahasiswa tidak dapat melakukan pengajuan surat secara online sehingga tujuan utama aplikasi tidak tercapai. |
| 2 | Melihat status pengajuan surat. | Fungsional | Must | Mahasiswa perlu mengetahui perkembangan pengajuan, apakah masih menunggu, sedang diproses, atau sudah selesai. Fitur ini penting agar mahasiswa dapat memantau pengajuan tanpa harus datang langsung ke loket administrasi. |
| 3 | Menerima notifikasi saat surat siap diambil. | Fungsional | Should | Notifikasi membantu mahasiswa mengetahui ketika surat telah selesai diproses. Namun, fitur ini bukan fungsi utama pengajuan karena informasi status masih dapat diperiksa secara langsung melalui aplikasi. |
| 4 | Aplikasi harus mudah digunakan dan memiliki navigasi yang jelas. | Nonfungsional | Must | Kemudahan penggunaan diperlukan agar mahasiswa dapat memahami alur pengajuan surat tanpa mengalami kesulitan dalam menggunakan aplikasi. |
| 5 | Sistem harus memberikan respons setelah mahasiswa mengirim pengajuan. | Nonfungsional | Should | Respons sistem diperlukan agar mahasiswa mengetahui apakah pengajuan berhasil dikirim atau mengalami kegagalan. |

### User Flow untuk Kebutuhan Must

Alur berikut menggambarkan proses mahasiswa ketika mengajukan surat keterangan aktif kuliah melalui aplikasi.

1. Mahasiswa membuka aplikasi pengajuan surat melalui smartphone.
2. Mahasiswa melakukan login menggunakan akun mahasiswa.
3. Sistem memvalidasi akun yang dimasukkan.
4. Jika login berhasil, sistem menampilkan halaman utama aplikasi.
5. Mahasiswa memilih menu pengajuan surat.
6. Mahasiswa memilih jenis surat keterangan aktif kuliah.
7. Sistem menampilkan formulir pengajuan beserta persyaratan yang harus dilengkapi.
8. Mahasiswa mengisi formulir dan melengkapi dokumen persyaratan.
9. Mahasiswa menekan tombol kirim pengajuan.
10. Sistem memeriksa kelengkapan dan validitas data yang dimasukkan.
11. Jika data lengkap dan valid, sistem menyimpan pengajuan serta memberikan status awal "Menunggu".
12. Sistem menampilkan notifikasi bahwa pengajuan berhasil dikirim dan mahasiswa dapat melihat status pengajuan melalui aplikasi.

**Percabangan keputusan (Decision):**

- **Keputusan 1 — Apakah login berhasil?**
  - Ya: Sistem menampilkan halaman utama aplikasi.
  - Tidak: Sistem menampilkan pesan kesalahan dan mahasiswa diminta memeriksa kembali akun login.

- **Keputusan 2 — Apakah data pengajuan sudah lengkap dan valid?**
  - Ya: Sistem menyimpan pengajuan dan menampilkan status "Menunggu".
  - Tidak: Sistem menampilkan pesan kesalahan dan mahasiswa diminta melengkapi atau memperbaiki data pengajuan.

Dengan user flow tersebut, proses pengajuan surat dapat digambarkan secara sistematis, mulai dari mahasiswa masuk ke aplikasi hingga pengajuan berhasil disimpan atau harus diperbaiki kembali.


## Soal 5 — UI/UX Mobile (CPMK-2)

**Jawaban:**

1. **Prinsip:** Responsif dan sederhana (*responsive and simple design*).

   **Keputusan desain:** Menggunakan tampilan daftar berbentuk kartu (*Card*) yang disusun secara vertikal menggunakan `ListView.builder`. Setiap kartu menampilkan nama surat, status pengajuan, dan tombol ajukan dengan tata letak yang teratur. Ukuran dan susunan elemen menyesuaikan ukuran layar smartphone.

   **Alasan:** Ukuran layar smartphone lebih terbatas dibandingkan komputer desktop. Penggunaan tampilan kartu secara vertikal membuat informasi lebih mudah dibaca tanpa memenuhi layar dengan terlalu banyak elemen sekaligus. Selain itu, `ListView.builder` memudahkan mahasiswa menggulir daftar 20 jenis surat.

2. **Prinsip:** Kemudahan interaksi sentuh (*touch-friendly interface*).

   **Keputusan desain:** Membuat tombol ajukan dengan ukuran area sentuh yang cukup besar, jarak antar tombol yang memadai, serta menggunakan warna tombol yang kontras agar mudah dikenali dan ditekan. Area sentuh sebaiknya memiliki ukuran minimal sekitar 48 × 48 dp.

   **Alasan:** Pengguna aplikasi mobile berinteraksi menggunakan jari melalui layar sentuh, bukan menggunakan mouse seperti pada komputer. Tombol yang terlalu kecil atau berdekatan dapat menyebabkan kesalahan saat ditekan. Oleh karena itu, ukuran dan jarak tombol perlu diperhatikan agar mahasiswa dapat mengajukan surat dengan mudah.

3. **Prinsip:** Efisiensi dan kemudahan penggunaan (*efficiency and usability*).

   **Keputusan desain:** Menampilkan informasi nama surat, status, dan tombol ajukan secara langsung pada setiap item. Selain itu, menyediakan fitur pencarian agar mahasiswa dapat menemukan jenis surat yang dibutuhkan tanpa harus menggulir seluruh 20 daftar surat.

   **Alasan:** Penggunaan aplikasi mobile umumnya dilakukan dalam waktu singkat dan pengguna menginginkan informasi yang dapat ditemukan dengan cepat. Penyajian informasi secara ringkas serta fitur pencarian dapat mengurangi langkah interaksi, menghemat waktu, dan memudahkan mahasiswa menyelesaikan pengajuan surat.

## Soal 6 — Navigasi dan Interaksi (CPMK-2)
**Jawaban:**

**Metode navigasi dan kapan digunakan:**

- **push:** Metode `Navigator.push()` digunakan untuk berpindah dari satu halaman ke halaman lain dengan menambahkan halaman baru ke dalam tumpukan navigasi (*navigation stack*). Dalam aplikasi pengajuan surat, metode ini digunakan ketika mahasiswa memilih salah satu jenis surat pada halaman daftar untuk membuka halaman form pengajuan.

- **pushNamed:** Metode `Navigator.pushNamed()` digunakan untuk berpindah halaman berdasarkan nama rute (*route name*) yang telah didefinisikan pada `MaterialApp`. Metode ini dapat digunakan ketika mahasiswa ingin membuka halaman detail status pengajuan melalui rute yang telah ditentukan, misalnya `/detail-status`.

- **pop:** Metode `Navigator.pop()` digunakan untuk menutup halaman yang sedang aktif dan kembali ke halaman sebelumnya dalam navigation stack. Dalam aplikasi ini, metode tersebut digunakan ketika mahasiswa menekan tombol kembali dari halaman form pengajuan menuju halaman daftar surat, atau dari halaman detail status menuju halaman sebelumnya.

**Pengiriman data jenis surat ke halaman form:**

Data jenis surat dikirim dari halaman daftar ke halaman form melalui parameter pada konstruktor halaman form. Ketika mahasiswa menekan tombol ajukan pada salah satu jenis surat, sistem mengirimkan nama atau jenis surat yang dipilih sebagai nilai parameter menggunakan `Navigator.push()`. Selanjutnya, halaman form menerima data tersebut dan menampilkannya secara otomatis pada bagian jenis surat sehingga mahasiswa tidak perlu memilih atau mengetik ulang jenis surat yang akan diajukan.

**Feedback setelah form dikirim:**

Setelah mahasiswa mengisi dan menekan tombol kirim, sistem melakukan validasi terhadap data yang dimasukkan. Jika data belum lengkap, aplikasi menampilkan pesan kesalahan agar mahasiswa memperbaikinya. Jika data berhasil dikirim dan disimpan, aplikasi memberikan feedback berupa `SnackBar` atau dialog yang berisi informasi bahwa pengajuan surat berhasil dikirim. Selanjutnya, mahasiswa dapat diarahkan ke halaman detail status untuk melihat perkembangan pengajuan, seperti menunggu, sedang diproses, atau selesai.


## Soal 7 — Model Data dan State (CPMK-3)

**Jawaban:**

**Mengapa setiap field bersifat final:**

Setiap field pada model `PengajuanSurat` menggunakan `final` karena nilainya hanya boleh ditentukan satu kali, yaitu ketika objek dibuat melalui konstruktor. Setelah objek dibuat, nilai tersebut tidak dapat diubah secara langsung. Penggunaan `final` membantu menjaga konsistensi data, mencegah perubahan yang tidak disengaja, serta membuat objek model lebih aman dan mudah dikelola. Dalam studi kasus, data seperti ID, jenis surat, tanggal pengajuan, dan status awal dapat disimpan secara konsisten pada setiap objek pengajuan.

**Mengapa id wajib ada:**

Field `id` wajib ada karena berfungsi sebagai identitas unik untuk membedakan satu pengajuan surat dengan pengajuan lainnya. Meskipun mahasiswa mengajukan jenis surat yang sama, setiap pengajuan harus memiliki ID yang berbeda. ID diperlukan agar sistem dapat menemukan, menampilkan detail, memperbarui status, atau menghapus data pengajuan yang tepat tanpa tertukar dengan data lainnya.

**Perbedaan StatelessWidget dan StatefulWidget:**

`StatelessWidget` merupakan widget yang tampilannya tidak memiliki state internal yang berubah selama widget tersebut digunakan. Widget ini cocok untuk tampilan yang bersifat tetap dan tidak memerlukan pembaruan berdasarkan perubahan data internal.

`StatefulWidget` merupakan widget yang memiliki state atau keadaan yang dapat berubah selama aplikasi berjalan. Widget ini memungkinkan tampilan diperbarui ketika terjadi perubahan data, misalnya ketika pengguna menambahkan atau menghapus pengajuan surat.

**Halaman daftar menggunakan (StatelessWidget/StatefulWidget):**

`StatefulWidget`.

**Alasan:**

Halaman daftar pengajuan menggunakan `StatefulWidget` karena data pengajuan dapat berubah ketika mahasiswa menambahkan pengajuan baru, menghapus data, atau ketika status pengajuan diperbarui. Perubahan tersebut harus ditampilkan secara langsung pada halaman daftar. Dengan menggunakan `StatefulWidget`, aplikasi dapat memperbarui tampilan berdasarkan perubahan data tanpa harus membuka ulang halaman.

**Fungsi setState:**

`setState()` merupakan fungsi pada Flutter yang digunakan untuk memberi tahu framework bahwa terdapat perubahan pada state atau data di dalam `StatefulWidget`. Ketika `setState()` dipanggil, Flutter akan menjalankan kembali proses pembangunan tampilan (*build*) sehingga perubahan data dapat ditampilkan pada layar.

**Apa yang terjadi bila data ditambah tanpa setState:**

Jika data pengajuan ditambahkan ke dalam list tanpa memanggil `setState()`, data tersebut sebenarnya dapat masuk ke dalam list di memori, tetapi tampilan aplikasi belum tentu langsung diperbarui. Hal ini terjadi karena Flutter tidak mendapatkan pemberitahuan bahwa terdapat perubahan state. Akibatnya, pengajuan baru tidak langsung terlihat pada halaman daftar sampai terjadi proses rebuild karena pemicu lain. Oleh karena itu, perubahan data yang memengaruhi tampilan perlu dilakukan menggunakan `setState()`.


## Soal 8 — CRUD Lokal (CPMK-3)
**Jawaban:**

| Operasi | Method List / mekanisme |
|:--------|:------------------------|
| Create  | `add()` digunakan untuk menambahkan data pengajuan surat baru ke dalam List. Contohnya,   ketika mahasiswa mengirimkan pengajuan surat, objek pengajuan baru ditambahkan ke daftar menggunakan `daftarPengajuan.add(dataBaru)`. |
| Read     | `for`, `forEach()`, atau `ListView.builder` digunakan untuk membaca dan menampilkan data yang tersimpan di dalam List. Contohnya, aplikasi menampilkan seluruh daftar pengajuan surat beserta jenis, tanggal, dan statusnya. |
| Update   | `indexWhere()` digunakan untuk mencari posisi data berdasarkan `id`, kemudian data pada posisi tersebut diganti dengan data terbaru menggunakan operator indeks `[]`. Contohnya, status pengajuan diubah dari menunggu menjadi selesai. |
| Delete   | `removeWhere()` digunakan untuk menghapus data dari List berdasarkan kondisi tertentu, misalnya menghapus pengajuan yang memiliki `id` sesuai dengan data yang dipilih mahasiswa. |

**Mengapa id digunakan sebagai kunci update dan delete:**

`id` digunakan sebagai kunci operasi update dan delete karena setiap data pengajuan memiliki identitas unik yang membedakannya dari data lainnya. Dengan menggunakan `id`, sistem dapat menemukan dan mengubah atau menghapus data yang tepat meskipun posisi data dalam daftar berubah. Hal ini membuat pengelolaan data lebih akurat dan mengurangi risiko kesalahan saat melakukan operasi CRUD.

**Konsekuensi bila index digunakan sebagai kunci:**

Jika index digunakan sebagai kunci, pengelolaan data dapat mengalami kesalahan ketika urutan daftar berubah akibat penambahan atau penghapusan data. Hal ini karena index menunjukkan posisi data dalam daftar, bukan identitas tetap dari data tersebut. Sebagai contoh, jika data pada index 0 dihapus, data yang sebelumnya berada pada index 1 akan berpindah ke index 0. Akibatnya, operasi update atau delete menggunakan index lama berisiko mengenai data yang berbeda dari yang dimaksud. Oleh karena itu, penggunaan `id` lebih aman dan konsisten untuk mengidentifikasi data pengajuan.


## Soal 9 — Persistensi Data Lokal (CPMK-3)
**Jawaban:**

**Perbedaan in-memory dan persistensi:**
In-memory adalah penyimpanan data sementara di dalam memori aplikasi menggunakan `List<PengajuanSurat>`. Data akan hilang ketika aplikasi ditutup sepenuhnya. Sementara itu, persistensi menggunakan `shared_preferences` memungkinkan data disimpan secara lokal sehingga tetap tersedia meskipun aplikasi ditutup dan dibuka kembali.

**Mengapa operasi shared_preferences asinkron (Future):**
Karena proses membaca dan menyimpan data membutuhkan waktu untuk mengakses penyimpanan perangkat. `Future` memungkinkan proses tersebut berjalan tanpa menghentikan seluruh aktivitas aplikasi.

**Apa yang terjadi bila await diabaikan:**
Proses penyimpanan tidak ditunggu sampai selesai sehingga instruksi berikutnya dapat berjalan sebelum data benar-benar tersimpan. Akibatnya, data berisiko belum tersimpan ketika aplikasi ditutup.

**Contoh situasi in-memory sudah cukup:**
Ketika mahasiswa melakukan simulasi pengajuan surat untuk pengujian fitur CRUD dan data hanya diperlukan selama aplikasi berjalan.

**Contoh situasi persistensi mutlak diperlukan:**
Ketika mahasiswa ingin menyimpan riwayat pengajuan surat agar data dan status pengajuan tetap dapat dilihat meskipun aplikasi sudah ditutup dan dibuka kembali.


## Soal 10 — Integrasi Konsep Lintas Pertemuan (CPMK-1 s.d. CPMK-3)

**Jawaban:**

### 1. Arsitektur

**Hubungan aplikasi mobile, penyimpanan lokal, dan backend Sistem Informasi:**

Aplikasi mobile digunakan mahasiswa sebagai antarmuka untuk mengakses informasi katalog buku, melihat detail koleksi, dan mengajukan peminjaman buku. Penyimpanan lokal digunakan untuk menyimpan data sederhana atau sementara pada perangkat menggunakan `shared_preferences`, misalnya preferensi pengguna atau informasi tertentu yang perlu dipertahankan ketika aplikasi dibuka kembali. Sementara itu, backend Sistem Informasi bertugas mengelola data buku, informasi ketersediaan, serta transaksi peminjaman secara terpusat melalui basis data.

Aplikasi mobile berkomunikasi dengan backend melalui REST API menggunakan koneksi internet. Dengan pembagian tersebut, aplikasi mobile berfungsi sebagai antarmuka pengguna, penyimpanan lokal mendukung penyimpanan data pada perangkat, sedangkan backend bertanggung jawab terhadap pengelolaan data utama sistem.

### 2. Kebutuhan & Alur

**Dua kebutuhan Must Have:**

1. Mahasiswa dapat melihat katalog buku yang berisi informasi judul, penulis, dan status ketersediaan buku.
2. Mahasiswa dapat mengajukan peminjaman buku dan melihat riwayat pengajuan peminjaman.

**Alur pengguna dari membuka aplikasi hingga tugas selesai:**

1. Mahasiswa membuka aplikasi perpustakaan melalui smartphone.
2. Sistem menampilkan halaman utama beserta katalog buku.
3. Mahasiswa memilih salah satu buku yang ingin dipinjam.
4. Sistem menampilkan detail buku yang dipilih.
5. Mahasiswa menekan tombol pinjam.
6. Sistem menampilkan formulir peminjaman.
7. Mahasiswa mengisi data peminjaman dan mengirimkan pengajuan.
8. Sistem memvalidasi kelengkapan data yang dimasukkan.
9. Jika data valid, sistem menyimpan pengajuan peminjaman dan menampilkan pemberitahuan bahwa pengajuan berhasil.
10. Jika data tidak valid, sistem menampilkan pesan kesalahan agar mahasiswa memperbaiki data.
11. Mahasiswa dapat membuka halaman riwayat untuk melihat status pengajuan peminjaman.

### 3. Struktur Komponen

**Halaman katalog, form peminjaman, serta navigasi antarhalaman:**

Halaman katalog menggunakan `Scaffold` sebagai struktur utama halaman, `AppBar` sebagai bagian atas aplikasi, serta `ListView.builder` untuk menampilkan daftar buku secara dinamis. Setiap data buku dapat ditampilkan menggunakan `Card` dan `ListTile` yang berisi judul, penulis, status ketersediaan, serta tombol untuk mengajukan peminjaman.

Halaman form peminjaman menggunakan `Scaffold` sebagai struktur halaman, `Form` dan `TextFormField` untuk menerima input pengguna, serta `ElevatedButton` untuk mengirimkan data pengajuan. Validasi dilakukan menggunakan `GlobalKey<FormState>` dan `validator` agar data yang dimasukkan memenuhi ketentuan sebelum diproses.

Navigasi antarhalaman menggunakan `Navigator.push()` untuk berpindah dari halaman katalog ke halaman detail atau form peminjaman. Sementara itu, `Navigator.pop()` digunakan untuk kembali ke halaman sebelumnya setelah proses selesai atau ketika pengguna membatalkan tindakan.

### 4. Data & State

**Definisi model data Buku (minimal 4 field):**

```dart
class Buku {
  final String id;
  final String judul;
  final String penulis;
  final String status;

  const Buku({
    required this.id,
    required this.judul,
    required this.penulis,
    required this.status,
  });
}
```

Model `Buku` digunakan untuk merepresentasikan informasi setiap koleksi buku yang tersedia dalam aplikasi. Field `id` berfungsi sebagai identitas unik buku, `judul` menyimpan nama buku, `penulis` menyimpan nama penulis, sedangkan `status` menunjukkan kondisi ketersediaan buku.

**Cara operasi Create (meminjam) dan Read (melihat riwayat) dikelola dalam state:**

Operasi Create dilakukan ketika mahasiswa mengirimkan formulir peminjaman. Data pengajuan yang telah memenuhi validasi dibuat sebagai data peminjaman baru, kemudian ditambahkan ke dalam struktur data `List` menggunakan method `add()`. Setelah data berhasil ditambahkan, `setState()` dipanggil agar perubahan data langsung ditampilkan pada antarmuka aplikasi.

Operasi Read dilakukan dengan membaca data peminjaman yang tersimpan di dalam `List`, kemudian menampilkannya menggunakan `ListView.builder` pada halaman riwayat peminjaman. Dengan demikian, mahasiswa dapat melihat daftar pengajuan peminjaman beserta informasi statusnya.

Pada implementasi yang menggunakan backend, data utama peminjaman selanjutnya dikirim dan dikelola melalui REST API. Sementara itu, `shared_preferences` dapat digunakan untuk menyimpan data sederhana pada perangkat sesuai kebutuhan aplikasi.