# Tes Konsep UTS — < Tika Anggraeni> <230660221098>

## Soal 1 — Konsep Aplikasi Bergerak dalam SI

1. Karakteristik: Pengajuan pengaduan
   Contoh penerapan: Ketika mahasiswa ingin mangajukan pengaduan perihal fasilitas kampus, mahasiswa tinggal membuat laporannya saja

2. Karakteristik: Melihat status pengajuan
   Contoh penerapan: ketika ingin melihat progres laporan yang telah diajukan, mahasiswa dapat melihat secara real time

3. Karakteristik: Toleransi Konektivitas
   Contoh penerapan:Ketika berada di area kampus yang minim sinyal internet, draf pengajuan surat dapat tersimpan sementara di penyimpanan lokal ponsel dan akan otomatis terkirim saat sinyal kembali stabil.

## Soal 2 — Dasar Pemrograman Dart

- List<String> daftarSurat = []: hanya menampung tipe data teks (String), diawali sebagai daftar kosong.
- Parameter String jenis: double nilai / List> komponen
- jenis.isEmpty: komponen.isEmpty
- return pada kondisi error: return 0.0
- daftarSurat.add(jenis): Method untuk memasukkan nilai dari variabel jenis ke dalam urutan paling belakang dari koleksi daftarSurat
- Perulangan for: Struktur iterasi untuk melintasi (looping) elemen di dalam daftarSurat satu per satu agar dapat diolah atau ditampilkan ke layar.

Kesalahan umum bila validasi isEmpty dihapus: Sistem akan menerima string kosong "" sebagai masukan yang sah. Akibatnya, pengajuan tanpa nama akan masuk ke dalam daftarSurat sehingga menimbulkan baris kosong atau tampilan kartu tanpa teks di antarmuka pengguna.

## Soal 3 — Struktur Flutter dan Widget (CPMK-1)

- MaterialApp:Widget akar (root) yang menetapkan tema Material Design, judul aplikasi, halaman utama, dan konfigurasi rute navigasi.
- Scaffold: kerangka tata letak visual dasar untuk satu halaman (menyediakan slot appBar, body, floatingActionButton, dll.).
- AppBar: bilah navigasi di bagian atas layar yang berfungsi menampilkan judul halaman dan tombol aksi atas.
- Column: tata letak (layout) untuk menyusun anak-anak widget (children) secara vertikal dari atas ke bawah.
- Text: menampilkan rangkaian teks ke layar antarmuka.
- ListView.builder: daftar yang dapat digulir (scrollable) secara efisien (lazy loading) yang hanya merender elemen saat terlihat di layar.

Masalah bila ListView.builder di dalam Column tanpa Expanded: Akan memicu error fatal tampilan antarmuka yaitu RenderFlex overflowed atau Vertical viewport was given unbounded height.
Penyebab: Column memberikan tinggi tidak terbatas (unbounded height) ke widget anak-anaknya, sedangkan ListView.builder membutuhkan kepastian batas tinggi area scroll dari induknya.
Perbaikan: Membungkus ListView.builder dengan widget Expanded (contoh: Expanded(child: ListView.builder(...))) agar ListView memanfaatkan sisa ruang tinggi yang tersedia pada Column.

## Soal 4 — Analisis Kebutuhan dan User Flow (CPMK-2)

Klasifikasi dan prioritas:

| No. | Permintaan                           | Fungsional/Nonfungsional | Prioritas MoSCoW | Alasan                                                                                                                  |
| :-: | :----------------------------------- | :----------------------- | :--------------: | :---------------------------------------------------------------------------------------------------------------------- |
|  1  | ingin melihat status pengajuan saya. | fungsional               |    must have     | sangat penting untuk memberikan transparansi informasi penanganan surat tanpa mahasiswa harus bertanya manual ke loket. |
|  2  | ingin mengajukan pengaduan           | fungsional               |    must have     | npa fitur pengajuan, aplikasi tidak memiliki nilai guna utama bagi mahasiswa.                                           |
|  3  | ingin menerima notifikasi            | fungsional               |   should have    | penting untuk kenyamanan pengguna agar tidak perlu mengecek aplikasi secara berulang                                    |

User flow untuk kebutuhan Must:

1. Mahasiswa membuka aplikasi pengajuan laporan
2. Sistem menampilkan Halaman Utama yang berisi daftar riwayat pengajuan dan tombol "+ Ajukan laporan".
3. Mahasiswa menekan tombol "+ Ajukan laporan".
4. Sistem membuka Halaman Form Pengajuan; mahasiswa memilih jenis surat dan mengisi alasan pengajuan.
5. Mahasiswa menekan tombol "Kirim Pengajuan".
6. Titik Keputusan (Validasi Form): Apakah seluruh data form sudah terisi dengan benar?
   Jika Tidak: Tampilkan pesan peringatan kesalahan (error feedback) di form -> Mahasiswa melengkapi isian.
   Jika Ya: Simpan data pengajuan baru dengan status awal "Menunggu".
7. Sistem mengembalikan tampilan ke Halaman Utama dan memperbarui daftar pengajuan

## Soal 5 — UI/UX Mobile (CPMK-2)

1. Prinsip: Hierarki Visual & Card-Based Layout
   Keputusan desain: Mengelompokkan setiap pengajuan surat ke dalam komponen Card dengan judul cetak tebal, tanggal yang lebih kecil, serta label status berwarna di sudut kanan.
   Alasan: Memudahkan pemindaian informasi (skimming) dalam sesi penggunaan singkat pada ukuran layar ponsel yang terbatas.

2. Prinsip: Area Sentuh Layak & Keterjangkauan Jempol (Touch Target Size e48)
   Keputusan desain: Menggunakan ListTile berjarak aman serta menempatkan tombol aksi utama berupa
   Alasan: Mencegah kesalahan ketuk (fat-finger error) dan memastikan tombol mudah dijangkau saat penggunaan satu tangan di area kampus

3. Prinsip: Multi-Indikator Status
   Keputusan desain: Menampilkan status pengajuan dengan kombinasi ikon, teks, dan warna yang dipadukan dari ColorScheme (misal: Ikon Jam + Abu-abu untuk "Menunggu", Ikon Ceklis + Hijau untuk "Selesai").
   Alasan: Menjamin antarmuka tetap konsisten dan informatif bagi seluruh pengguna, termasuk yang memiliki keterbatasan penglihatan warna.

## Soal 6 — Navigasi dan Interaksi (CPMK-2)

Metode navigasi dan kapan digunakan:

- push: menambahkan layar baru ke atas tumpukan navigasi. Digunakan saat berpindah dari halaman daftar ke halaman form atau halaman detail secara langsung.
- pushNamed: berpindah ke layar baru memanfaatkan rute bernama yang didaftarkan pada MaterialApp. Digunakan untuk struktur navigasi aplikasi yang lebih terorganisir.
- pop: menutup layar paling atas dan kembali ke layar sebelumnya. Digunakan pada tombol "Batal" atau saat kembali setelah data berhasil disimpan.

Pengiriman data jenis surat ke halaman form: dta dikirim sebagai argumen melalui fungsi navigasi Navigator.pushNamed(context, '/form', arguments: jenisSurat). Pada halaman form tujuan, data tersebut ditangkap dan dibaca menggunakan perintah ModalRoute.of(context)!.settings.arguments.

Feedback setelah form dikirim: setelah pengguna mengirim form dan halaman kembali di-pop, aplikasi memicu pemanggilan ScaffoldMessenger.of(context).showSnackBar(...) pada Halaman Utama untuk memunculkan pesan umpan balik singkat bertuliskan "Pengajuan laporan berhasil dikirim!".

## Soal 7 — Model Data dan State (CPMK-3)

Mengapa setiap field bersifat final: aggar objek bersifat immutable (tidak dapat diubah sembarangan di tengah alur program). Pembaruan data dilakukan secara aman dengan membuat objek baru menggunakan method copyWith().
Mengapa id wajib ada: sebagai kunci identitas unik. Wajib ada agar operasi update dan delete selalu mengenai data yang tepat meskipun posisi urutan (index) dalam daftar berubah.
Perbedaan StatelessWidget dan StatefulWidget: StatelessWidget bersifat statis dan tidak memiliki state internal yang berubah setelah dibuat, sedangkan StatefulWidget memiliki objek State dinamis yang dapat memperbarui tampilan antarmuka saat datanya berubah.
Halaman daftar menggunakan (StatelessWidget/StatefulWidget): StatefulWidget
Alasan: karena data pada halaman daftar bersifat dinamis (dapat bertambah saat pengajuan baru, berubah status, atau dihapus).
Fungsi setState: memberitahu framework Flutter bahwa telah terjadi perubahan state internal, sehingga Flutter memicu pemanggilan ulang fungsi build() untuk merender ulang tampilan di layar.
Apa yang terjadi bila data ditambah tanpa setState: data di dalam memori (List) sebenarnya bertambah, namun antarmuka layar pengguna tidak berubah (re-render) sehingga data baru tidak muncul hingga aplikasi dimuat ulang.

## Soal 8 — CRUD Lokal (CPMK-3)

| Operasi | Method List / mekanisme                                                                                                     |
| :------ | :-------------------------------------------------------------------------------------------------------------------------- |
| Create  | daftar.insert(0, dataBaru) atau daftar.add(dataBaru) di dalam panggilan setState()                                          |
| Read    | ListView.builder membaca jumlah daftar.length dan menampilkan elemen daftar[index]                                          |
| Update  | indexWhere((item) => item.id == targetId) untuk mencari posisi, lalu mengganti objek daftar[index] = dataBaru.copyWith(...) |
| Delete  | daftar.removeWhere((item) => item.id == targetId) di dalam panggilan setState()                                             |

Mengapa id digunakan sebagai kunci update dan delete: id merupakan identitas unik yang bersifat stabil dan konstan pada setiap entitas data, sehingga operasi pembaruan (update) dan penghapusan (delete) selalu tepat sasaran pada objek yang dituju meskipun urutan tampilan atau jumlah data dalam koleksi berubah.
Konsekuensi bila index digunakan sebagai kunci: Indeks bersifat dinamis dan bergantung pada posisi elemen di dalam koleksi. Jika ada data baru yang ditambahkan di posisi teratas atau data lain yang dihapus, posisi indeks seluruh item di bawahnya akan bergeser. Menggunakan indeks sebagai kunci akan menyebabkan operasi edit atau hapus salah sasaran dan merusak data milik elemen lain.

## Soal 9 — Persistensi Data Lokal (CPMK-3)

Perbedaan in-memory dan persistensi: penyimpanan in-memory menempatkan data sementara di RAM sehingga data akan hilang total saat aplikasi ditutup atau di-restart. Sementara itu, persistensi data (seperti shared_preferences) menyimpan data secara permanen di media penyimpanan fisik perangkat (flash storage), sehingga data tetap tersimpan aman meskipun aplikasi ditutup atau ponsel dimatikan.

Mengapa operasi shared_preferences asinkron (Future): proses membaca dan menulis data ke media penyimpanan fisik perangkat membutuhkan waktu transaksi I/O (Input/Output). Agar antarmuka (UI) aplikasi tetap responsif dan tidak membeku (freeze/lag) saat proses penyimpanan berlangsung, operasi ini dijalankan di latar belakang secara asinkron (non-blocking).
Apa yang terjadi bila await diabaikan: program akan langsung melompat mengeksekusi baris kode berikutnya sebelum proses pembacaan atau penulisan data selesai. Akibatnya, data yang dibaca bisa bernilai null/belum diperbarui, atau data baru belum sempat tersimpan permanen ke media penyimpanan fisik saat aplikasi ditutup.

Contoh situasi in-memory sudah cukup: menyimpan kata kunci pencarian sementara pada search bar, status tab yang sedang aktif dipilih pengguna, atau keadaan visual dialog konfirmasi yang tidak perlu diingat saat aplikasi dibuka kembali.
Contoh situasi persistensi mutlak diperlukan: menyimpan token autentikasi login pengguna, identitas profil (NIM/Nama), draf pengajuan offline, serta riwayat transaksi/laporan yang sudah berhasil dikirim.

## Soal 10 — Integrasi Konsep Lintas Pertemuan (CPMK-1 s.d. CPMK-3)

1. Arsitektur:
   Hubungan aplikasi mobile, penyimpanan lokal, dan backend Sistem Informasi: aplikasi mobile berfungsi sebagai antarmuka pengguna (client) untuk melakukan interaksi langsung seperti memilih item dan mengisi form. Penyimpanan lokal (shared_preferences) bertindak sebagai penampung draf sementara saat offline serta penyimpan token sesi. Backend Sistem Informasi bertindak sebagai pusat pemroses aturan bisnis (business logic) dan pengelola basis data utama (database server) yang terhubung dengan aplikasi mobile melalui protokol HTTP/REST API.

2. Kebutuhan & Alur:
   Dua kebutuhan Must have: pengguna dapat memilih dan mengajukan item/surat/layanan melalui formulir dan
   pengguna dapat melihat daftar transaksi/pengajuan aktif beserta status perkembangannya secara real-time.
   Alur pengguna dari membuka aplikasi hingga tugas selesai: pengguna membuka aplikasi -> Halaman Utama menampilkan daftar riwayat dan tombol aksi "+ Ajukan" -> Pengguna mengetuk tombol "+ Ajukan" -> Sistem membuka Halaman Form -> Pengguna mengisi data dan mengetuk "Kirim" -> Validasi form memeriksa isian (jika kosong, tampilkan pesan error) -> Data terkirim dan tersimpan -> Navigasi kembali ke Halaman Utama disertai tampilan feedback SnackBar "Pengajuan Berhasil" -> Data baru tampil di urutan teratas daftar.

3. Struktur Komponen:
   Halaman katalog dan form peminjaman, serta navigasi antarhalaman: diawali dari MaterialApp yang mendaftarkan rute navigasi. Halaman Utama disusun menggunakan Scaffold, AppBar, ListView.builder untuk menampilkan daftar kartu (Card), serta FloatingActionButton untuk berpindah ke Halaman Form. Halaman Form disusun menggunakan Scaffold, Form, Column, TextFormField, dan ElevatedButton. Perpindahan dari Halaman Utama ke Form menggunakan Navigator.pushNamed(context, '/form'), dan kembali menggunakan Navigator.pop(context) setelah proses simpan selesai.

4. Data & State:
   Definisi model data Buku (minimal 4 field): class Buku {
   final String id;
   final String judul;
   final String pengarang;
   final bool isDipinjam;

Buku({
required this.id,
required this.judul,
required this.pengarang,
this.isDipinjam = false,
});
}
Cara operasi Create (meminjam) dan Read (melihat riwayat) dikelola dalam state: halaman dibungkus menggunakan StatefulWidget yang mengelola variabel daftar List<Buku> \_daftarBuku.
