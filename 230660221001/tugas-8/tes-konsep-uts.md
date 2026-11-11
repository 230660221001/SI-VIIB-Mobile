# Tes Konsep UTS — Ghatan Zalfaa Kautsar 230660221001

## Soal 1 — Konsep Aplikasi Bergerak dalam SI
Aplikasi mobile lebih tepat dibandingkan web desktop untuk pengajuan surat karena tiga karakteristik berikut:
1. **Konteks Bergerak (Mobility):** Mahasiswa dapat mengajukan surat dari mana saja (misalnya dari kos atau saat di perjalanan) tanpa harus datang ke loket administrasi yang mengharuskan kehadiran fisik.
2. **Sesi Penggunaan Singkat:** Proses pengajuan surat dapat diselesaikan dalam beberapa menit (buka aplikasi, pilih surat, isi form, submit). Ini sesuai dengan karakteristik pengguna yang sibuk.
3. **Interaksi Sentuh (Touch Interaction):** Desain antarmuka mobile yang ringkas dengan tombol besar (target sentuh) memudahkan pengguna mengisi form pengajuan surat dengan cepat menggunakan jempol, tanpa perlu perangkat tambahan seperti mouse.

## Soal 2 — Dasar Pemrograman Dart
- **`List<String> daftarSurat = []`**: Mendeklarasikan sebuah variabel koleksi (List) yang menampung elemen bertipe data String (teks). Digunakan untuk menyimpan banyak jenis surat.
- **Parameter `String jenis`**: Menerima input data bertipe teks saat fungsi `tambahSurat` dipanggil.
- **`jenis.isEmpty`**: Memeriksa apakah string yang dimasukkan kosong (tidak memiliki karakter). Mengembalikan nilai boolean (true/false).
- **`return` pada kondisi error**: Menghentikan eksekusi fungsi saat itu juga jika input kosong, sehingga baris kode di bawahnya (proses penambahan data) tidak akan dijalankan.
- **`daftarSurat.add(jenis)`**: Menambahkan nilai dari variabel `jenis` ke dalam urutan terakhir di dalam `daftarSurat`.
- **Perulangan `for`**: Mengulangi blok kode sebanyak panjang `daftarSurat` untuk mencetak setiap elemen satu per satu.

**Kesalahan umum bila validasi `isEmpty` dihapus:**
Data string kosong (`""`) akan tetap masuk ke dalam `daftarSurat`. Hal ini akan merusak integritas data (muncul data hantu/tanpa nama) dan berpotensi menyebabkan error saat data tersebut ditampilkan atau diolah di tahap berikutnya.

## Soal 3 — Struktur Flutter dan Widget
- **`MaterialApp`**: Widget akar yang menyediakan kerangka dasar aplikasi (tema, routing, dan halaman utama).
- **`Scaffold`**: Menyediakan struktur dasar tata letak halaman (seperti AppBar di atas dan body di tengah).
- **`AppBar`**: Bilah judul di bagian atas halaman yang menampilkan teks "Daftar Surat".
- **`Column`**: Menyusun widget anaknya secara vertikal (dari atas ke bawah).
- **`Text`**: Menampilkan teks statis "Pilih jenis surat".
- **`ListView.builder`**: Menampilkan daftar surat secara efisien (hanya merender item yang terlihat di layar).

**Masalah bila `ListView.builder` di dalam `Column` tanpa `Expanded`:**
- **Penyebab:** `Column` mencoba mengukur tinggi anak-anaknya secara vertikal. `ListView` memiliki tinggi yang tak terbatas (infinite height) karena bisa di-scroll. Hal ini menyebabkan error **`RenderFlex overflowed`** (layar kuning-hitam).
- **Perbaikan:** Bungkus `ListView.builder` dengan widget `Expanded(child: ListView.builder(...))` agar ListView mengambil sisa ruang yang tersedia di dalam Column tanpa melampaui batas layar.

## Soal 4 — Analisis Kebutuhan dan User Flow
| No. | Permintaan | Fungsional/Nonfungsional | Prioritas MoSCoW | Alasan |
|:---:|:-----------|:-------------------------|:----------------:|:-------|
| 1 | Mengajukan surat | **Fungsional** (Proses inti aplikasi) | **Must have** | Tanpa fitur ini, aplikasi tidak memiliki tujuan utama. |
| 2 | Melihat status | **Fungsional** (Menampilkan data) | **Should have** | Penting untuk transparansi, tapi aplikasi masih berguna walau status dicek manual via chat. |
| 3 | Notifikasi | **Nonfungsional** (Kualitas pengalaman) | **Could have** | Menambah nilai, tapi bisa ditunda karena butuh integrasi perangkat/sistem notifikasi. |

**User flow untuk kebutuhan Must (Mengajukan surat):**
1. Mahasiswa membuka aplikasi.
2. Memilih menu "Daftar Surat".
3. Memilih jenis surat (misal: Surat Keterangan Aktif Kuliah).
4. Mengisi form data diri yang diperlukan.
5. Menekan tombol "Ajukan".
6. Sistem memvalidasi input (jika kosong, muncul pesan error; jika valid, data disimpan).
7. Muncul pesan sukses (SnackBar) dan pengajuan tercatat.

## Soal 5 — UI/UX Mobile
1. **Target Sentuh Memadai (Touch Target):** 
   - *Keputusan desain:* Membuat tombol "Ajukan" berukuran minimal 48x48 dp dengan jarak antar tombol yang cukup. 
   - *Alasan:* Mencegah pengguna salah menekan tombol lain saat menggunakan ponsel dengan satu tangan.
2. **Hierarki Visual:**
   - *Keputusan desain:* Nama surat ditampilkan dengan huruf tebal (font weight bold) dan ukuran lebih besar, sedangkan status ditampilkan dengan warna label (chip) yang berbeda.
   - *Alasan:* Memudahkan mata pengguna memindai daftar surat dengan cepat dalam sesi penggunaan yang singkat.
3. **Umpan Balik (Feedback):**
   - *Keputusan desain:* Menampilkan indikator loading (spinner) saat menekan tombol ajukan, lalu menampilkan SnackBar hijau jika berhasil.
   - *Alasan:* Memberikan kepastian kepada pengguna bahwa aksi mereka sedang diproses dan berhasil, sehingga mereka tidak menekan tombol berulang kali.

## Soal 6 — Navigasi dan Interaksi
- **Metode navigasi:**
  - `pushNamed`: Digunakan untuk maju dari halaman daftar ke halaman form pengajuan (menambah tumpukan layar baru).
  - `pop`: Digunakan untuk kembali dari halaman detail/form ke halaman daftar (menghapus layar dari tumpukan).
- **Pengiriman data jenis surat:**
  - Data dikirim dari halaman daftar melalui parameter `arguments` pada `Navigator.pushNamed(context, '/form', arguments: jenisSurat)`. Di halaman form, data dibaca menggunakan `ModalRoute.of(context)?.settings.arguments`.
- **Feedback setelah form dikirim:**
  - Menampilkan `SnackBar` berisi pesan "Pengajuan surat berhasil dikirim" dan memanggil `Navigator.pop(context)` untuk kembali ke halaman daftar.

## Soal 7 — Model Data dan State
- **Mengapa field bersifat `final`:** Agar data yang sudah dibuat tidak dapat diubah secara sengaja (immutable). Perubahan data dilakukan dengan membuat objek baru, sehingga mencegah bug data berubah di tengah proses.
- **Mengapa `id` wajib ada:** Sebagai kunci unik (primary key) untuk mengidentifikasi setiap pengajuan. Jika ada dua surat dengan nama sama, `id` memastikan sistem mengubah/menghapus data yang benar.
- **Perbedaan Stateless dan Stateful:** `StatelessWidget` tidak memiliki data yang berubah (UI statis). `StatefulWidget` memiliki `State` yang bisa berubah dan memicu render ulang.
- **Halaman daftar menggunakan:** `StatefulWidget`. 
- **Alasan:** Karena daftar pengajuan bisa bertambah, berubah, atau dihapus. Kita butuh `setState` untuk memperbarui UI saat data berubah.
- **Fungsi `setState`:** Memberitahu Flutter bahwa ada perubahan data pada `State`, sehingga Flutter akan menjalankan ulang method `build()` untuk merender UI terbaru.
- **Jika tanpa `setState`:** Data di dalam variabel (memori) akan berubah, tetapi tampilan layar tidak akan diperbarui. Pengguna akan merasa aplikasi macet/tidak merespons.

## Soal 8 — CRUD Lokal
| Operasi | Method List / Mekanisme |
|:--------|:------------------------|
| Create  | `list.add(objek)` |
| Read    | `ListView.builder` membaca `itemCount` dan index `list[i]` |
| Update  | `list.indexWhere()` untuk mencari posisi, lalu ganti elemen dengan objek baru |
| Delete  | `list.removeWhere()` berdasarkan kondisi |

- **Mengapa `id` digunakan sebagai kunci:** `id` bersifat unik dan permanen. 
- **Konsekuensi bila index digunakan:** Index (posisi) bisa berubah ketika ada data yang dihapus atau diurutkan. Jika menggunakan index, operasi update/delete bisa salah sasaran (menghapus data yang salah karena posisinya bergeser).

## Soal 9 — Persistensi Data Lokal
- **Perbedaan in-memory dan persistensi:** In-memory (`List`) hanya menyimpan data selama aplikasi berjalan; jika ditutup, data hilang. Persistensi (`shared_preferences`) menyimpan data ke penyimpanan perangkat (disk), sehingga data tetap ada meskipun aplikasi ditutup.
- **Mengapa asinkron (`Future`):** Proses baca/tulis ke disk memakan waktu (I/O). Jika dilakukan secara sinkron, UI aplikasi akan "freeze" atau macet sementara. Asinkron memungkinkan UI tetap responsif.
- **Apa yang terjadi bila `await` diabaikan:** Aplikasi tidak akan menunggu proses penyimpanan selesai. Jika aplikasi langsung ditutup setelah memanggil fungsi simpan, data bisa gagal tersimpan (korup).
- **Contoh in-memory cukup:** Menyimpan sementara daftar item di keranjang belanja sebelum user menekan tombol checkout.
- **Contoh persistensi mutlak:** Menyimpan data login user (sesi), atau menyimpan riwayat transaksi agar tidak hilang saat HP dimatikan.

## Soal 10 — Integrasi Konsep Lintas Pertemuan
1. **Arsitektur:** Aplikasi mobile (Flutter) berkomunikasi dengan Backend SI (REST API) via HTTP Request (JSON). Backend terhubung ke Database. Aplikasi juga memiliki penyimpanan lokal (`shared_preferences`) untuk cache data agar bisa diakses offline atau menyimpan sesi login.
2. **Kebutuhan & Alur:** 
   - *Must have:* (1) Melihat katalog buku, (2) Meminjam buku.
   - *Alur:* Buka app -> Login -> Lihat Katalog (Read) -> Pilih Buku -> Isi Form Pinjam -> Validasi -> Submit (Create) -> Konfirmasi.
3. **Struktur Komponen:** Halaman Katalog menggunakan `Scaffold` + `AppBar` + `ListView.builder` untuk daftar buku. Halaman Form menggunakan `Scaffold` + `Form` + `TextFormField` + tombol. Navigasi antar halaman menggunakan `Navigator.pushNamed` dan `Navigator.pop`.
4. **Data & State:** 
   - Model `Buku`: `id` (String), `judul` (String), `penulis` (String), `stok` (int).
   - *Create (meminjam):* Form divalidasi, lalu objek `Buku` baru atau data pinjaman ditambahkan ke list di `State` menggunakan `setState()`.
   - *Read (riwayat):* `ListView.builder` membaca list pinjaman dari state dan menampilkannya di layar.