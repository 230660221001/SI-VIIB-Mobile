# Tes Konsep UTS — Yelly Ambarwaty (230660221033)

## Soal 1 — Konsep Aplikasi Bergerak dalam SI
Tiga karakteristik aplikasi bergerak yang menjadikannya lebih tepat untuk kasus layanan pengajuan surat:
1. **Karakteristik:** Aksesibilitas Kapan Saja dan Mobilitas Tinggi (Location Independence).
   **Contoh penerapan:** Mahasiswa tidak perlu berjalan ke loket administrasi kampus saat jam istirahat; mereka bisa mengajukan surat keterangan mahasiswa langsung dari aplikasi di ponsel pintar mereka saat sedang berada di kos, perpustakaan, atau kantin.
2. **Karakteristik:** Pemberitahuan Waktu Nyata (Push Notifications).
   **Contoh penerapan:** Ketika petugas administrasi selesai mencetak dan melegalisasi surat, mahasiswa langsung menerima notifikasi pop-up di layar ponsel bahwa surat sudah bisa diambil di loket, mengeliminasi waktu tunggu yang tidak pasti.
3. **Karakteristik:** Personalisasi dan Penyimpanan Sesi Otomatis.
   **Contoh penerapan:** Aplikasi mobile umumnya menjaga sesi login (tersimpan di perangkat). Saat mahasiswa membuka aplikasi, data diri seperti NIM dan Nama sudah terisi otomatis (auto-fill) di form pengajuan, sehingga mempercepat proses tanpa perlu mengetik ulang setiap kali butuh surat.

## Soal 2 — Dasar Pemrograman Dart
- **`List<String> daftarSurat = []`:** Menginisialisasi sebuah variabel array/koleksi bertipe data List yang khusus menampung elemen berupa teks (String) dan nilai awalnya adalah list kosong.
- **Parameter `String jenis`:** Sebuah variabel input pada fungsi `tambahSurat` yang mewajibkan pengirim (caller) memberikan nilai teks saat memanggil fungsi tersebut.
- **`jenis.isEmpty`:** Sebuah validasi boolean untuk mengecek apakah string `jenis` yang diinputkan tidak mengandung karakter sama sekali (kosong).
- **`return` pada kondisi error:** Berfungsi sebagai *early exit*, yaitu menghentikan paksa eksekusi fungsi lebih awal agar baris kode di bawahnya (penambahan data) tidak dijalankan jika data tidak lolos validasi.
- **`daftarSurat.add(jenis)`:** Menambahkan data string baru ke posisi urutan paling akhir di dalam koleksi list `daftarSurat`.
- **Perulangan `for`:** Melakukan iterasi atau perulangan bertahap mulai dari indeks 0 hingga indeks terakhir di dalam list untuk menampilkan seluruh isi data ke layar/konsol.

**Kesalahan umum bila validasi isEmpty dihapus:** Pengguna atau sistem bisa saja tidak sengaja memasukkan string kosong (""). Tanpa validasi ini, list akan terisi dengan data "sampah" (blank space), yang jika dirender ke UI akan menghasilkan baris-baris kosong yang membingungkan, merusak tata letak, dan membuang memori.

## Soal 3 — Struktur Flutter dan Widget
- **`MaterialApp`:** Widget pondasi (root) yang mengatur konfigurasi utama aplikasi seperti rute navigasi (routes), tema global, dan lokalisasi.
- **`Scaffold`:** Widget kerangka utama yang menyediakan struktur tata letak dasar Material Design, memberi ruang untuk AppBar, body, FAB, atau BottomNavigationBar.
- **`AppBar`:** Komponen bilah bagian atas yang berfungsi sebagai header layar, umumnya berisi judul halaman dan tombol aksi/kembali.
- **`Column`:** Widget layout yang menyusun anak-anak (children) widgetnya secara vertikal (berbaris dari atas ke bawah).
- **`Text`:** Widget dasar untuk merender sebaris teks dengan format bergaya tertentu (style).
- **`ListView.builder`:** Widget daftar gulir yang merender anak-anaknya secara efisien (lazy loading); widget hanya dibuat saat akan muncul di layar.

**Masalah bila `ListView.builder` di dalam `Column` tanpa `Expanded`:**
Akan terjadi *error visual* berupa layar merah bertuliskan **RenderFlex overflow / Unbounded height**.
- **Penyebab:** `Column` tidak membatasi seberapa tinggi anak-anaknya boleh melar (unconstrained), sementara `ListView.builder` membutuhkan batasan tinggi yang pasti karena ia didesain untuk bisa digulir hingga panjang tak terhingga.
- **Perbaikan:** Bungkus `ListView.builder` menggunakan widget `Expanded()`, sehingga ia akan dipaksa mengambil (dan dibatasi pada) sisa ruang vertikal yang tersisa di dalam `Column`.

## Soal 4 — Analisis Kebutuhan dan User Flow
Klasifikasi dan prioritas:

| No. | Permintaan | Fungsional/Nonfungsional | Prioritas MoSCoW | Alasan |
|:---:|:-----------|:-------------------------|:----------------:|:-------|
| 1   | Mengajukan surat aktif kuliah | Fungsional | Must | Merupakan fitur bisnis inti dari aplikasi. Tanpa ini, tujuan utama aplikasi tidak tercapai. |
| 2   | Melihat status pengajuan | Fungsional | Must | Memenuhi kebutuhan transparansi dan melacak proses; wajib agar mhs tidak perlu lagi datang untuk bertanya. |
| 3   | Menerima notifikasi saat surat siap | Fungsional | Should | Sangat meningkatkan kenyamanan (*nice to have*), tetapi sistem dasar tetap bisa berjalan meskipun mahasiswa mengecek statusnya secara manual di dalam aplikasi. |

**User flow untuk kebutuhan Must (Pengajuan Surat):**
1. Mahasiswa membuka aplikasi dan masuk ke Halaman Beranda (Daftar Layanan).
2. Mahasiswa menekan menu "Surat Keterangan Aktif Kuliah".
3. Aplikasi membuka Halaman Form Pengajuan.
4. Mahasiswa mengisi keperluan/keterangan surat pada form dan menekan "Kirim Pengajuan".
5. Aplikasi melakukan validasi form; jika lolos, data disimpan.
6. Aplikasi menampilkan pesan sukses (SnackBar) lalu mengarahkan mahasiswa kembali ke Halaman Beranda.
7. Mahasiswa melihat status surat terbarukan menjadi "Diproses" di daftar pengajuan.

## Soal 5 — UI/UX Mobile
1. **Prinsip:** *Touch Target Sizing* (Ukuran Target Sentuh) yang Ergonomis.
   **Keputusan desain:** Menggunakan desain *Card* untuk setiap item surat dengan *padding* longgar (minimal tinggi area klik 48dp).
   **Alasan:** Mengingat layar ponsel kecil dan dioperasikan dengan jari (terutama satu tangan), target sentuh yang besar dan terpisah jelas mencegah *fat-finger error* (salah ketuk antar surat).
2. **Prinsip:** *Visual Hierarchy* (Hierarki Visual & Keterbacaan).
   **Keputusan desain:** Menampilkan Nama Surat dengan font tebal (bold/16sp), sedangkan status pengajuan dengan warna indikator (misal: hijau/kuning) dan ukuran font yang lebih kecil (12sp).
   **Alasan:** Memandu mata pengguna dalam sesi penggunaan singkat agar langsung fokus ke judul layanan tanpa perlu membaca deskripsi teks yang panjang.
3. **Prinsip:** *Immediate Feedback* (Umpan Balik Interaksi).
   **Keputusan desain:** Memberikan efek riak air (InkWell/Ripple effect) saat daftar surat ditekan.
   **Alasan:** Interaksi sentuh butuh kepastian. Efek visual ini meyakinkan pengguna bahwa layar tidak *lag* dan input mereka telah diterima oleh sistem.

## Soal 6 — Navigasi dan Interaksi
Metode navigasi dan kapan digunakan:
- **`pushNamed`:** Digunakan ketika berpindah dari Halaman Daftar ke Halaman Form atau Detail. Ini sangat direkomendasikan karena rute terdaftar rapi (terpusat) di `MaterialApp` sehingga alur tertelusur.
- **`push`:** Digunakan jika harus mengirim rute secara eksplisit dengan mem-build halaman di tempat (biasanya jarang dipakai jika sudah menggunakan `pushNamed`).
- **`pop`:** Digunakan untuk menutup Halaman Form atau Detail dan membuang rute teratas dari struktur *stack*, sehingga layar otomatis kembali ke Halaman Daftar di bawahnya.

**Pengiriman data jenis surat ke halaman form:**
Dilakukan dengan mengirim objek/data melalui properti `arguments` saat memanggil `Navigator.pushNamed`. Di Halaman Form penerima, data ditangkap menggunakan `ModalRoute.of(context)?.settings.arguments` lalu divalidasi tipe datanya sebelum ditampilkan.

**Feedback setelah form dikirim:**
Sebelum fungsi diakhiri dengan `Navigator.pop`, saya memanggil `ScaffoldMessenger.of(context).showSnackBar()` untuk memunculkan notifikasi/kotak pesan kecil di bagian bawah layar. Tujuannya adalah mengonfirmasi kepada mahasiswa bahwa surat berhasil diajukan sebelum mereka dilempar kembali ke layar awal.

## Soal 7 — Model Data dan State
**Mengapa setiap field bersifat `final`:** Model data dirancang agar bersifat *immutable* (tidak dapat diubah) setelah diinstansiasi. Jika status berubah, sistem harus membuat objek `PengajuanSurat` baru. Ini mencegah manipulasi referensi memori secara tidak sengaja dan mempermudah pelacakan *state* aplikasi.
**Mengapa `id` wajib ada:** `id` bertindak sebagai kunci unik (Primary Key). Jika ada dua pengajuan surat dengan jenis dan tanggal yang sama persis, program tetap dapat membedakan keduanya saat akan melakukan penghapusan atau pembaruan.

**Perbedaan StatelessWidget dan StatefulWidget:**
`StatelessWidget` adalah tampilan statis yang tidak bisa mengubah dirinya sendiri, sedangkan `StatefulWidget` memiliki objek internal (`State`) yang datanya bisa diubah kapan saja dan layar bisa dirender ulang.
**Halaman daftar menggunakan:** `StatefulWidget`.
**Alasan:** Karena halaman daftar bertugas menampung data riwayat surat yang bisa bertambah (saat mengajukan baru), berubah status (update), atau dibatalkan (delete). Perubahan daftar ini mewajibkan layar untuk melakukan render ulang secara dinamis.

**Fungsi setState:** Untuk memberi tahu kerangka kerja (framework) Flutter bahwa data internal di dalam state telah dimodifikasi, sehingga metode `build()` perlu dipanggil ulang untuk memperbarui UI.
**Apa yang terjadi bila data ditambah tanpa setState:** Data di dalam memori/List sebenarnya berhasil bertambah, namun UI tidak dirender ulang. Mahasiswa tidak akan melihat pengajuan barunya di layar hingga mereka berpindah halaman atau me-*refresh* aplikasi secara manual.

## Soal 8 — CRUD Lokal
| Operasi | Method List / mekanisme |
|:--------|:------------------------|
| **Create** | `add()` atau `insert()` untuk memasukkan objek pengajuan baru ke dalam daftar (*List*). |
| **Read** | Kombinasi properti `itemCount` dan membongkar *List* satu-per-satu di dalam fungsi `itemBuilder` pada `ListView.builder`. |
| **Update** | `indexWhere()` untuk mencari tahu di mana indeks data lama berada, kemudian menimpa indeks tersebut dengan objek pengajuan baru (`list[index] = dataBaru;`). |
| **Delete** | `removeWhere()` untuk menghapus seluruh objek di dalam daftar yang nilai kondisinya sama dengan ID target. |

**Mengapa `id` digunakan sebagai kunci update dan delete:** Karena `id` bersifat spesifik, unik, dan melekat permanen pada data tersebut selamanya.
**Konsekuensi bila index digunakan sebagai kunci:** Indeks *List* bisa bergeser. Jika kita menargetkan indeks ke-3 untuk dihapus, namun tiba-tiba pengajuan indeks ke-1 dibatalkan, maka seluruh urutan naik ke atas. Akibatnya, sistem akan salah sasaran dan malah menghapus atau mengedit data milik mahasiswa/surat yang salah.

## Soal 9 — Persistensi Data Lokal
**Perbedaan in-memory dan persistensi:**
Penyimpanan *in-memory* (seperti variabel `List`) hanya bertahan di dalam RAM saat aplikasi berjalan; begitu aplikasi ditutup/di-*kill*, data hilang tak bersisa. Persistensi (dengan `shared_preferences`) menulis file data tersebut ke ruang penyimpanan internal ponsel (ROM), sehingga data tetap utuh meskipun ponsel di-*restart*.

**Mengapa operasi shared_preferences asinkron (Future):** Karena proses komunikasi (baca/tulis) ke memori fisik ponsel membutuhkan waktu I/O (Input/Output). Jika bersifat sinkron, seluruh aplikasi akan mengalami *freeze/stutter* (hang sejenak) menunggu proses simpan selesai.
**Apa yang terjadi bila await diabaikan:** Kode di bawah perintah simpan akan langsung tereksekusi tanpa peduli data selesai ditulis atau tidak. Ini berisiko tinggi memicu *bug* di mana aplikasi gagal memuat data terbaru atau data korup jika aplikasi keburu tertutup sebelum I/O kelar.

**Contoh situasi in-memory sudah cukup:** Menyimpan data *filter* pencarian sementara atau indeks halaman tab aktif yang tidak penting jika terhapus.
**Contoh situasi persistensi mutlak diperlukan:** Menyimpan data token sesi login, pengaturan tema gelap/terang pengguna, atau draf form pengajuan surat mahasiswa yang panjang agar tidak hilang saat aplikasi tidak sengaja diminimalkan.

## Soal 10 — Integrasi Konsep Lintas Pertemuan
1. **Arsitektur:**
   Aplikasi mobile berfungsi sebagai antarmuka (Client). Input peminjaman buku akan disimpan terlebih dahulu menggunakan persistensi data lokal (misal: shared_preferences/SQLite) agar riwayat tetap muncul ketika mhs sedang tidak ada koneksi, kemudian data akan dikirim ke Backend Server Perpustakaan melalui REST API saat online untuk sinkronisasi pembaruan stok.
2. **Kebutuhan & Alur:**
   Dua kebutuhan *Must have*: (1) Mahasiswa dapat mencari dan meminjam buku. (2) Mahasiswa dapat melihat riwayat peminjaman mereka.
   Alur pengguna: Membuka aplikasi -> Tampil Halaman Katalog (Grid) -> Mengklik salah satu buku -> Aplikasi beralih ke Halaman Detail Buku -> Mahasiswa menekan FAB "Pinjam" -> Form konfirmasi durasi pinjam diisi -> Submit -> Validasi sukses -> Kembali ke Katalog -> Riwayat tampil di Halaman Profil/Daftar Pinjaman.
3. **Struktur Komponen:**
   Menggunakan `MaterialApp` dengan rute awal (`/`) berisi `Scaffold`. `body` Halaman Katalog memakai `ListView.builder`/`GridView`. Navigasi menggunakan `Navigator.pushNamed('/form_pinjam', arguments: dataBuku)`. Di halaman form, struktur inti memakai widget `Form`, `TextFormField`, dan tombol `FilledButton`.
4. **Data & State:**
   **Definisi Model Buku:**
   `class Buku { final String idBuku; final String judul; final String kategori; final bool isTersedia; }`
   **Manajemen State:** State dikelola di `StatefulWidget`. Saat "Meminjam" (Create), fungsi akan membuat objek transaksi baru dan menyuntikkannya dengan `daftarRiwayat.add(transaksi)` di dalam balutan `setState()`. Saat "Melihat Riwayat" (Read), metode `build()` akan dipicu untuk merender ulang isi terbaru `daftarRiwayat` menggunakan `ListView.builder`.