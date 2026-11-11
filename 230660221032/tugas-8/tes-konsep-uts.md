# Tes Konsep UTS — Deyna Angeliawati Zahara (230660221032)

## Soal 1 — Konsep Aplikasi Bergerak dalam SI (CPMK-1)

1. Karakteristik: Portabilitas dan Aksesibilitas Tinggi (Dapat diakses kapan saja dan di mana saja)
   Contoh penerapan: Mahasiswa tidak perlu datang langsung ke loket administrasi atau membuka komputer desktop. Pengajuan surat keterangan aktif kuliah dapat diisi dan dikirim langsung melalui smartphone di sela-sela jadwal kuliah.

2. Karakteristik: Notifikasi Real-Time (Push Notification)
   Contoh penerapan: Sistem memberikan pemberitahuan langsung ke layar HP mahasiswa saat status surat berubah (misalnya: "Surat Selesai Diproses"). Hal ini mencegah mahasiswa harus datang berulang kali ke loket hanya untuk mengecek status.

3. Karakteristik: Pemanfaatan Fitur Bawaan Perangkat (Kamera dan Storage)
   Contoh penerapan: Mahasiswa dapat langsung mengunggah dokumen persyaratan (seperti Kartu Tanda Mahasiswa atau bukti bayar) dengan memfotonya menggunakan kamera HP, serta mengunduh berkas surat digital langsung ke penyimpanan lokal smartphone.

## Soal 2 — Dasar Pemrograman Dart (CPMK-1)

| Bagian Kode | Fungsi dan Penjelasan |
| :--- | :--- |
| `List<String> daftarSurat = []` | Mendefinisikan variabel koleksi (*list*) bernama `daftarSurat` yang khusus menampung sekumpulan data bertipe teks (`String`), diawali dengan kondisi awal berupa daftar kosong (`[]`). |
| `Parameter String jenis` | Variabel masukan pada fungsi yang berfungsi untuk menerima data teks (nama/jenis surat) dari luar ketika fungsi `tambahSurat` dipanggil. |
| `jenis.isEmpty` | Properti *boolean* untuk mengecek apakah nilai teks pada variabel `jenis` tidak memiliki karakter (string kosong `""`). |
| `return pada kondisi error` | Perintah untuk menghentikan dan keluar dari fungsi agar baris kode penambahan data (`add`) tidak dijalankan ketika input tidak valid. |
| `daftarSurat.add(jenis)` | Method bawaan dari `List` yang digunakan untuk menambahkan elemen teks `jenis` baru ke urutan paling akhir dari koleksi `daftarSurat`. |
| `Perulangan for` | Struktur kontrol perulangan (*iterasi*) yang digunakan untuk mengakses dan menampilkan seluruh item di dalam `daftarSurat` satu per satu berdasarkan indeksnya (`i`). |

**Kesalahan umum bila validasi `isEmpty` dihapus:**  
Fungsi akan tetap memasukkan teks kosong (`""`) ke dalam `daftarSurat` saat pengguna tidak mengisi input form. Akibatnya, daftar akan tercemar oleh data surat yang tidak valid (kosong) sehingga merusak tampilan antarmuka (UI) dan membingungkan pengguna.

## Soal 3 — Struktur Flutter dan Widget (CPMK-1)

| Widget | Fungsi dan Perannya dalam Struktur Halaman |
| :--- | :--- |
| `MaterialApp` | Widget tingkat teratas (*root*) yang mengatur konfigurasi utama aplikasi, seperti tema warna dasar, judul aplikasi, dan alur navigasi. |
| `Scaffold` | Widget yang menyediakan kerangka tata letak standar halaman Material Design (misalnya menyediakan tempat untuk `appBar` dan `body`). |
| `AppBar` | Widget bilah atas yang berfungsi menampilkan judul halaman ('Daftar Surat') serta tombol aksi atau navigasi. |
| `Column` | Widget tata letak (*layout*) yang menyusun widget anak-anaknya secara vertikal dari atas ke bawah. |
| `Text` | Widget untuk menampilkan teks singkat ke layar (misalnya label 'Pilih jenis surat'). |
| `ListView.builder` | Widget daftar efisien yang membangun item secara dinamis hanya saat muncul di layar (*lazy loading*). |

**Masalah bila `ListView.builder` ditempatkan langsung di dalam `Column` tanpa `Expanded`:**  
Terjadi kesalahan tata letak berupa *Unbounded Height Error* (biasanya ditandai dengan layar rusak / *RenderFlex overflowed*).

* **Penyebab**: `Column` memberikan tinggi tidak terbatas secara vertikal ke anak-anaknya, sementara `ListView.builder` secara *default* juga mencoba mengambil tinggi seluas-luasnya. Hal ini membuat Flutter mengalami konflik saat menghitung ukuran layar.
* **Perbaikan**: Membungkus `ListView.builder` dengan widget `Expanded`. Dengan demikian, `ListView` akan mengalah dan mengisi sisa ruang kosong yang tersedia di dalam `Column`.

## Soal 4 — Analisis Kebutuhan dan User Flow (CPMK-2)

Klasifikasi dan prioritas:

| No. | Permintaan | Fungsional/Nonfungsional | Prioritas MoSCoW | Alasan |
|:---:|:-----------|:-------------------------|:----------------:|:-------|
| 1   | "Saya ingin mengajukan surat keterangan aktif kuliah." | Fungsional | Must | Merupakan fitur utama (*core function*) dari aplikasi; tanpa fitur ini aplikasi tidak memenuhi tujuan pembuatannya. |
| 2   | "Saya ingin melihat status pengajuan saya." | Fungsional | Must | Penting bagi pengguna untuk mengetahui progres pengajuan (misal: Menunggu, Diproses, Selesai) secara transparan. |
| 3   | "Saya ingin menerima notifikasi saat surat siap diambil." | Fungsional | Should | Fitur pendukung yang sangat bermanfaat untuk memberikan pembaruan secara instan, namun sistem dasar pengajuan masih bisa berjalan tanpanya. |

User flow untuk kebutuhan Must:
1. Mahasiswa membuka aplikasi pengajuan surat.
2. Sistem menampilkan Halaman Utama yang berisi daftar riwayat pengajuan surat.
3. Mahasiswa menekan tombol **"Tambah Pengajuan"** (tombol `+`).
4. Sistem mengarahkan pengguna ke Halaman Form Pengajuan Surat.
5. Mahasiswa mengisi data pada form (memilih jenis surat dan memasukkan alasan) lalu menekan tombol **"Kirim Pengajuan"**.
6. Sistem memvalidasi input, menyimpan data pengajuan baru ke memori state, dan menutup halaman form (*pop*).
7. Sistem mengembalikan pengguna ke Halaman Utama dan memperbarui tampilan daftar dengan data pengajuan baru berstatus *"Menunggu"*.

## Soal 5 — UI/UX Mobile (CPMK-2)

1. Prinsip: Kejelasan Hirarki Visual dan Tata Letak Ringkas
  
   Keputusan desain: Menggunakan komponen `Card` terpisah untuk setiap item serta label warna (`Chip`) untuk penanda status.
   Alasan: Memudahkan pengguna memindai (*scanning*) 20 item surat dengan cepat pada ukuran layar smartphone yang terbatas tanpa beban visual berlebih.

2. Prinsip: Area Sentuh Nyaman (Touch Target Size)
   
   Keputusan desain: Memastikan ukuran tombol minimal dan memberi jarak (*padding/margin*) yang cukup antarkartu.
   Alasan: Mencegah kesalahan ketuk saat pengguna berinteraksi menggunakan jari tangan di layar sentuh mobile.

3. Prinsip: Efisiensi Sesi Penggunaan Singkat (Micro-interaction)
   
   Keputusan desain: Menampilkan ringkasan status utama langsung pada kartu di halaman daftar tanpa wajib membuka layar detail.
   Alasan: Mendukung kebiasaan penggunaan aplikasi mobile yang singkat (beberapa detik) agar pengguna langsung mendapatkan informasi utama secara instan.

## Soal 6 — Navigasi dan Interaksi (CPMK-2)

Metode navigasi dan kapan digunakan:
- `push`: Digunakan untuk berpindah ke halaman baru (misal: dari halaman daftar ke halaman form atau detail) dengan membuat rute layar baru secara langsung menggunakan `MaterialPageRoute`.
- `pushNamed`: Digunakan untuk berpindah halaman berdasarkan nama rute yang terdaftar di `MaterialApp` (misal: `Navigator.pushNamed(context, '/form')`), memudahkan pengelolaan rute pada aplikasi dengan banyak layar.
- `pop`: Digunakan untuk menutup halaman yang sedang aktif dan kembali ke halaman sebelumnya (misal: menutup halaman form setelah selesai mengisi data atau menekan tombol batal/kembali).

Pengiriman data jenis surat ke halaman form:
Data jenis surat dikirim melalui parameter `arguments` saat melakukan navigasi (`Navigator.pushNamed(context, '/form', arguments: jenisSurat)`). Pada halaman form, data tersebut ditangkap menggunakan `ModalRoute.of(context)!.settings.arguments` untuk menetapkan nilai awal jenis surat yang diproses.

Feedback setelah form dikirim:
Feedback diberikan dalam bentuk `SnackBar` pesan singkat (misal: "Pengajuan surat berhasil dikirim!") yang dimunculkan di bagian bawah layar menggunakan `ScaffoldMessenger.of(context).showSnackBar(...)` tepat setelah proses simpan berhasil dan halaman form di-`pop`.

## Soal 7 — Model Data dan State (CPMK-3)

Mengapa setiap field bersifat final:
Atribut `final` memastikan nilai data pada objek `PengajuanSurat` bersifat *immutable* (tidak dapat diubah secara langsung setelah objek dibuat). Hal ini menjaga konsistensi data dan mencegah perubahan yang tidak disengaja.

Mengapa id wajib ada:
`id` berfungsi sebagai identitas unik (*primary key*) untuk setiap data pengajuan surat, sehingga operasi spesifik seperti mengubah status (*update*) atau menghapus data (*delete*) dapat menemukan objek yang tepat tanpa risiko keliru.

Perbedaan StatelessWidget dan StatefulWidget:
- `StatelessWidget`: Widget statis yang tampilan antarmukanya tidak berubah setelah dibuat karena tidak memiliki state internal yang dinamis.
- `StatefulWidget`: Widget dinamis yang dapat menyimpan dan memperbarui keadaan (*state*), serta merender ulang antarmuka saat terjadi perubahan data.

Halaman daftar menggunakan: StatefulWidget
Alasan: Halaman daftar bersifat dinamis karena daftarnya dapat bertambah, berubah statusnya, atau berkurang (penanganan CRUD) secara langsung saat aplikasi berjalan.

Fungsi setState:
`setState` berfungsi memberi tahu Flutter bahwa terjadi perubahan pada variabel *state* internal, sehingga Flutter akan memicu proses *rebuild* (rending ulang) pada metode `build()` untuk memperbarui tampilan UI sesuai data terbaru.

Apa yang terjadi bila data ditambah tanpa setState:
Data baru sebenarnya berhasil ditambahkan ke dalam objek `List` di memori, tetapi tampilan antarmuka (UI) di layar tidak akan berubah atau tidak diperbarui sama sekali karena Flutter tidak melakukan *rebuild* widget.

## Soal 8 — CRUD Lokal (CPMK-3)

| Operasi | Method List / mekanisme |
|:--------|:------------------------|
| Create  | Menggunakan method `.add(objekBaru)` untuk menambahkan objek pengajuan baru ke dalam koleksi `List`. |
| Read    | Mengakses elemen `List` secara langsung atau melakukan perulangan/pemetaan menggunakan `ListView.builder` dan `.map()`. |
| Update  | Menggunakan `.indexWhere((item) => item.id == targetId)` untuk mencari posisi indeks, lalu memperbarui atau mengganti elemen pada indeks tersebut. |
| Delete  | Menggunakan method `.removeWhere((item) => item.id == targetId)` untuk menghapus elemen yang memiliki `id` sesuai dari koleksi `List`. |

Mengapa id digunakan sebagai kunci update dan delete:
`id` bernilai unik untuk setiap objek data. Penggunaan `id` menjamin bahwa operasi *update* atau *delete* menemukan data yang benar secara pasti, meskipun urutan atau posisi data di dalam `List` berubah.

Konsekuensi bila index digunakan sebagai kunci:
Jika terdapat proses manipulasi daftar (seperti penghapusan data, pengurutan ulang, atau penyaringan/pencarian), posisi *index* elemen di dalam `List` akan bergeser. Bila *index* lama tetap digunakan sebagai kunci, aplikasi berisiko salah sasaran dengan mengubah atau menghapus data lain yang kebetulan menduduki posisi *index* tersebut.

## Soal 9 — Persistensi Data Lokal (CPMK-3)

Perbedaan in-memory dan persistensi:
Penyimpanan *in-memory* menyimpan data di RAM (variabel `List`), sehingga data akan hilang (*volatile*) saat aplikasi ditutup atau di-*restart*. Sedangkan persistensi menggunakan `shared_preferences` menyimpan data ke memori fisik HP (*disk storage*), sehingga data tetap tersimpan aman (*non-volatile*) meskipun aplikasi ditutup, HP dimatikan, atau di-*restart*.

Mengapa operasi shared_preferences asinkron (Future):
Operasi `shared_preferences` bersifat asinkron (`Future`) karena melibatkan proses I/O (*Input/Output*) membaca dan menulis ke media penyimpanan fisik HP. Sifat asinkron memastikan proses ini berjalan di latar belakang tanpa membekukan (*freezing*) antarmuka UI aplikasi.

Apa yang terjadi bila await diabaikan:
Jika kata kunci `await` diabaikan, program akan langsung mengeksekusi baris kode berikutnya sebelum proses penyimpanan fisik selesai. Akibatnya, data bisa belum sempat tersimpan sempurna saat dibaca kembali, atau terjadi *race condition* yang menyebabkan kegagalan konsistensi data.

Contoh situasi in-memory sudah cukup:
Skenario aplikasi demonstrasi/prototipe singkat, data penginputan sesi sementara yang tidak perlu disimpan permanen, atau pencarian filter sementara selama layar aktif.

Contoh situasi persistensi mutlak diperlukan:
Menyimpan pengaturan aplikasi (seperti tema *dark mode*), sesi *login* pengguna (*token/auth*), atau status riwayat pengajuan surat agar mahasiswa tidak perlu mengisi ulang formulir setiap kali aplikasi dibuka kembali.

## Soal 10 — Integrasi Konsep Lintas Pertemuan (CPMK-1 s.d. CPMK-3)

1. Arsitektur:
   
   Hubungan aplikasi mobile, penyimpanan lokal, dan backend Sistem Informasi: Aplikasi mobile Flutter bertindak sebagai antarmuka *client* (front-end) untuk interaksi pengguna. Penyimpanan lokal (*in-memory* /  `shared_preferences`) digunakan untuk mengelola *state* sementara dan menyimpan riwayat peminjaman lokal agar dapat diakses dengan cepat secara offline. Aplikasi mobile nantinya terhubung ke backend Sistem Informasi Perpustakaan (server database) melalui REST API HTTP untuk sinkronisasi katalog buku dan validasi status peminjaman secara *real-time*.

2. Kebutuhan dan Alur:
   Dua kebutuhan Must have:

   | ID | Deskripsi Kebutuhan | Tipe | Prioritas MoSCoW | Alasan |
   | :---: | :--- | :---: | :---: | :--- |
   | **F-01** | Mahasiswa dapat melihat daftar katalog buku perpustakaan yang tersedia (Read). | Fungsional | **Must** | Merupakan fungsi utama aplikasi agar pengguna dapat mencari dan memilih buku sebelum meminjam. |
   | **F-02** | Mahasiswa dapat mengisi dan mengirimkan formulir peminjaman buku (Create). | Fungsional | **Must** | Fungsi inti transaksi peminjaman; tanpa fitur ini alur peminjaman buku tidak dapat berjalan. |

   Alur pengguna dari membuka aplikasi hingga tugas selesai:

   ```mermaid
   graph TD
       A[Buka Aplikasi] --> B[Halaman Katalog Buku]
       B -->|Pilih Buku & Klik Pinjam| C[Halaman Form Peminjaman]
       C -->|Isi Data & Klik Konfirmasi| D{Validasi Input}
       D -->|Tidak Valid| E[Tampilkan Pesan Error]
       E --> C
       D -->|Valid| F[Simpan Data ke State & Tampilkan SnackBar]
       F -->|Navigator.pop| B
       B --> G[Daftar Katalog/Riwayat Terbarui]

3. Struktur Komponen:

   Halaman katalog dan form peminjaman, serta navigasi antarhalaman:


   **Widget Tree Aplikasi:**

   ```mermaid
   graph TD
       A[runApp: MyApp] --> B[MaterialApp]
       B --> C[HalamanKatalogBuku]
       
       C --> D[AppBar: Katalog Perpustakaan]
       C --> E[body: Column]
       C --> F[FloatingActionButton: Pinjam Buku]
       
       E --> G[Padding: Teks Pencarian/Header]
       E --> H[Expanded: ListView.builder]
       
       H --> I[Kotak Card: Item Buku]
       I --> J[Row: Judul Buku, Pengarang, Status]

       C -.->|Navigator.pushNamed| K[HalamanFormPeminjaman]
       K --> L[AppBar: Form Peminjaman]
       K --> M[body: Form / Column]
       M --> N[TextFormField: Tanggal & Durasi]
       M --> O[ElevatedButton: Konfirmasi Peminjaman]
       
       O -.->|Navigator.pop| C
```
    Mekanisme Navigasi:
        
    Katalog ke Form (pushNamed): Tombol pinjam memicu Navigator.pushNamed(context, '/form-pinjam', arguments: dataBuku) membawa data buku ke halaman form.

    Tangkap Data: Di halaman form, data diterima melalui ModalRoute.of(context)!.settings.arguments.

    Form ke Katalog (pop): Tombol konfirmasi menyimpan data, menampilkan SnackBar, lalu mengeksekusi Navigator.pop(context) untuk kembali ke katalog.
```

4. Data dan State:
   Definisi model data Buku (minimal 4 field):
   ```dart
   class Buku {
     final String id;
     final String judul;
     final String pengarang;
     final bool isTersedia;

     const Buku({
       required this.id,
       required this.judul,
       required this.pengarang,
       required this.isTersedia,
     });
   }