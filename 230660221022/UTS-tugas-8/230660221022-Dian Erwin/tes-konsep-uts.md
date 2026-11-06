# Tes Konsep UTS

**Nama:** Dian Erwin
**NIM:** 230660221022

---

### Soal 1 — Konsep Aplikasi Bergerak dalam SI
Tiga karakteristik aplikasi bergerak yang menjadikannya lebih tepat dibanding web desktop untuk pengajuan surat:
1. **Mobilitas & Aksesibilitas:** Mahasiswa dapat mengajukan surat kapan saja dan di mana saja dari genggaman tangan, tanpa harus terikat pada komputer desktop atau datang secara fisik ke loket. *(Contoh: Mengisi form pengajuan saat sedang di perjalanan ke kampus).*
2. **Personalisasi & Push Notification:** Perangkat mobile adalah perangkat personal. Aplikasi dapat mengirimkan pemberitahuan proaktif langsung ke layar kunci pengguna. *(Contoh: Notifikasi "Surat Keterangan Aktif Kuliah Anda sudah siap diambil di loket" muncul secara real-time).*
3. **Integrasi Perangkat Keras (Hardware):** Aplikasi mobile mudah mengakses fitur bawaan perangkat seperti kamera dan galeri secara langsung. *(Contoh: Mahasiswa bisa langsung memotret KTM atau berkas persyaratan pendukung menggunakan kamera HP dan mengunggahnya).*

### Soal 2 — Dasar Pemrograman Dart
- `List<String>`: Tipe data koleksi (array) yang dirancang khusus untuk menyimpan daftar teks.
- `String jenis`: Parameter fungsi bertipe teks yang menerima nilai input dari pemanggil fungsi.
- `isEmpty`: Properti bawaan Dart untuk memeriksa apakah sebuah string tidak mengandung karakter apa pun.
- `return`: Menghentikan eksekusi fungsi lebih awal jika validasi gagal, sehingga kode di bawahnya tidak dijalankan.
- `add`: Metode untuk menyisipkan elemen baru ke indeks paling akhir dari List.
- `for`: Struktur perulangan untuk melakukan iterasi pada setiap elemen di dalam daftar berdasarkan indeksnya.
- **Kesalahan jika `isEmpty` dihapus:** Aplikasi akan menerima dan menyimpan string kosong (`""`) ke dalam `daftarSurat`. Ini merusak integritas data karena akan ada entri kosong/blank saat daftar ditampilkan.

### Soal 3 — Struktur Flutter dan Widget
- `MaterialApp`: Widget akar (root) yang mengatur tema global, rute navigasi, dan struktur desain Material.
- `Scaffold`: Kerangka halaman yang menyediakan ruang standar untuk komponen UI seperti app bar, body, dan floating action button.
- `AppBar`: Header di bagian atas layar untuk menampilkan judul halaman atau menu.
- `Column`: Layout untuk menyusun widget anak-anaknya secara vertikal (dari atas ke bawah).
- `Text`: Widget untuk menampilkan teks statis di layar.
- `ListView.builder`: Widget pembuat daftar scrollable yang me-render item secara dinamis (lazy loading) sesuai kebutuhan memori.
- **Masalah ListView.builder di dalam Column:** Akan terjadi error *unbounded height* (tinggi tak terbatas). `Column` membiarkan anaknya mengambil ruang vertikal sebesar mungkin, sementara `ListView` juga mencoba memanjang tak terbatas. **Solusinya:** Bungkus `ListView.builder` dengan widget `Expanded` agar dibatasi oleh sisa ruang layar yang tersedia.

### Soal 4 — Analisis Kebutuhan dan User Flow
**Pemisahan Kebutuhan & Prioritas (MoSCoW):**
1. "Mengajukan surat keterangan aktif kuliah" -> **Fungsional | Prioritas: Must**. (Alasan: Ini adalah fungsi inti/utama aplikasi; tanpa ini, aplikasi tidak berguna).
2. "Melihat status pengajuan saya" -> **Fungsional | Prioritas: Must**. (Alasan: Transparansi proses sangat penting untuk menggantikan kebiasaan mahasiswa bolak-balik bertanya ke loket).
3. "Menerima notifikasi saat surat siap" -> **Non-fungsional / Ekstra Fungsional | Prioritas: Could**. (Alasan: Fitur ini sangat membantu, tetapi aplikasi tetap bisa berjalan tanpa notifikasi push; mahasiswa masih bisa mengecek status secara manual (pull)).

**User Flow (Must):**
1. Buka aplikasi -> Tampil Halaman Beranda.
2. Tap tombol "Ajukan Surat Baru".
3. Pilih jenis "Surat Aktif Kuliah" dan isi form pendukung.
4. Tap "Kirim Pengajuan".
5. Sistem memvalidasi, lalu kembali ke Beranda.
6. Mahasiswa melihat kartu pengajuan barunya berstatus "Menunggu".

### Soal 5 — UI/UX Mobile
1. **Ukuran Target Sentuh (Touch Target):** Tombol "Ajukan" harus dibuat cukup besar (minimal ukuran 44x44 atau 48x48 dp) agar mudah di-tap oleh jari tanpa meleset.
2. **Hierarki Visual (Visual Hierarchy):** Nama surat dibuat dengan teks besar dan tebal (Bold), sedangkan status menggunakan teks lebih kecil dengan warna redup (abu-abu). Ini memandu mata pengguna menangkap informasi terpenting lebih dulu.
3. **Penyajian Data Responsif (Efisiensi Layar):** Menggunakan format `Card` atau `ListTile` untuk membungkus 20 item tersebut agar mudah di-scroll, memberikan batas ruang (margin) yang jelas antar-item agar layar tidak terlihat penuh sesak.

### Soal 6 — Navigasi dan Interaksi
- `Navigator.pushNamed`: Digunakan di halaman daftar untuk berpindah ke Halaman Form karena rutenya sudah didaftarkan di MaterialApp secara statis.
- `Navigator.push`: Digunakan untuk berpindah ke Detail Status, karena seringkali kita perlu mengirim objek spesifik langsung ke konstruktor halaman detail.
- `Navigator.pop`: Digunakan di Halaman Form untuk kembali ke daftar sekaligus membuang form dari tumpukan memori.
- **Pengiriman Data & Feedback:** Data jenis surat dari form dikirim kembali ke daftar dengan cara menyematkan data pada argumen pop: `Navigator.pop(context, dataSuratBaru);`. Di halaman daftar, nilai ini ditangkap dengan `await` (karena push mengembalikan Future). Setelah data diterima, feedback ditampilkan menggunakan `ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Surat diajukan!')));`.

### Soal 7 — Model Data dan State
- **Alasan `final` & `id`:** Field `final` digunakan untuk menjaga *immutability* (data tidak bisa sembarangan dimodifikasi setelah objek dibuat). Perubahan harus dilakukan dengan mengganti seluruh objek. `id` wajib ada sebagai pengenal unik (Primary Key) untuk memastikan operasi Edit dan Hapus menyasar objek yang tepat.
- **Stateless vs StatefulWidget:** `StatelessWidget` digunakan untuk antarmuka yang isinya tetap, sedangkan `StatefulWidget` memiliki *state* yang bisa berubah-ubah dan merender ulang UI. Halaman daftar menggunakan **StatefulWidget** karena daftar surat bisa bertambah, berkurang, atau berubah statusnya secara dinamis.
- **Fungsi `setState`:** `setState` berfungsi memberitahu *framework* Flutter bahwa data di dalam memori telah berubah, sehingga Flutter perlu melakukan *re-build* UI untuk merefleksikan data baru. Jika data ditambah tanpa `setState`, data masuk ke List di memori, tetapi layar ponsel tidak akan menampilkan perubahan tersebut.

### Soal 8 — CRUD Lokal
1. **Create (Menambah):** Menggunakan method `.add()` atau menyisipkan elemen ke dalam List.
2. **Read (Membaca):** Menggunakan panjang List `.length` dan mengakses data dengan sintaks indeks `[index]` untuk ditampilkan pada ListView.
3. **Update (Mengubah):** Menggunakan method `.indexWhere()` untuk mencari posisi data berdasarkan ID, lalu menimpa indeks tersebut dengan objek yang baru.
4. **Delete (Menghapus):** Menggunakan method `.removeWhere()` untuk membuang elemen yang ID-nya cocok.
- **Mengapa pakai ID, bukan Index?** Indeks hanyalah nomor urut posisi dalam list. Jika kita menghapus baris pertama (index 0), data baris kedua akan bergeser menjadi index 0. Jika kita menggunakan index sebagai acuan update/delete, pergeseran urutan ini bisa menyebabkan kita mengedit atau menghapus data yang salah (salah sasaran). ID bersifat unik dan melekat selamanya pada objek tersebut.

### Soal 9 — Persistensi Data Lokal
- **In-memory vs Shared Preferences:** *In-memory* menyimpan data secara sementara di RAM perangkat (berupa variabel List); jika aplikasi ditutup atau direstart, data hilang. `shared_preferences` menyimpan data ke dalam penyimpanan fisik (file XML/JSON lokal ponsel); data tetap persisten meskipun aplikasi dimatikan.
- **Asinkron & `await`:** Operasi baca-tulis ke penyimpanan fisik hardware membutuhkan waktu proses (delay). Jika `await` diabaikan, program akan langsung mengeksekusi baris kode berikutnya padahal data belum selesai diambil atau disimpan, menyebabkan variabel bernilai *null* atau UI menampilkan data kosong.
- **Kapan Digunakan:** In-memory sudah cukup untuk data sesi sementara (misal hasil pencarian atau filter kategori sementara). Persistensi `shared_preferences` mutlak diperlukan untuk menyimpan token login autentikasi pengguna, pengaturan tema gelap/terang, atau preferensi bahasa yang harus tetap ada saat app dibuka kembali.

### Soal 10 — Integrasi Konsep Lintas Pertemuan
1. **Arsitektur:** Aplikasi Mobile bertindak sebagai *Client* (Front-end) yang menyediakan antarmuka bagi pengguna. Karena belum ada internet (M1-M3), aplikasi menggunakan Penyimpanan Lokal (State In-Memory) sebagai replika sementara dari backend. Nanti, aplikasi akan berkomunikasi dengan Backend SI Perpustakaan melalui REST API.
2. **Kebutuhan & Alur (Must Have):**
   - Kebutuhan 1: Meminjam buku dari katalog.
   - Kebutuhan 2: Melihat riwayat peminjaman buku.
   - *User Flow:* Buka aplikasi -> Tampil Katalog Buku -> Tap buku "Clean Code" -> Masuk ke Form Peminjaman -> Tap "Pinjam Sekarang" -> Dialihkan ke Halaman Riwayat Peminjaman yang menampilkan buku tersebut.
3. **Struktur Komponen & Navigasi:** 
   - `KatalogPage` (Scaffold -> GridView.builder daftar buku).
   - `FormPinjamPage` (Scaffold -> Form input lama pinjam).
   - Navigasi dari Katalog ke Form menggunakan `Navigator.push()`. Navigasi kembali setelah sukses menggunakan `Navigator.pop(context, dataPinjam)` dengan feedback SnackBar.
4. **Data & State:**
   - Model: `class Buku { final String id; final String judul; final String pengarang; final String status; }`
   - State dikelola menggunakan `StatefulWidget` dengan variabel penampung `List<Buku> riwayat = [];`.
   - *Create:* Saat `pop` menerima data baru, dipanggil `setState(() { riwayat.add(bukuBaru); })`.
   - *Read:* Daftar riwayat di-render dengan `ListView.builder(itemCount: riwayat.length, itemBuilder: (context, index) => Text(riwayat[index].judul))`.
