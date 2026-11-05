# Catatan Keputusan UI/UX — PustakaKu

## 1. Tujuan Desain

PustakaKu merupakan prototype aplikasi perpustakaan yang dirancang untuk memudahkan pengguna mencari buku dan mengetahui status ketersediaannya. Desain halaman utama dibuat sederhana agar informasi buku dapat ditemukan dengan mudah tanpa terlalu banyak elemen yang mengganggu.

## 2. Keputusan Desain Antarmuka

### 2.1 AppBar dan Identitas Aplikasi

Nama PustakaKu ditempatkan pada bagian atas halaman sebagai identitas aplikasi. Penggunaan AppBar membantu membedakan bagian navigasi utama dari konten katalog buku.

### 2.2 Judul dan Deskripsi Halaman

Judul "Katalog Buku" disertai deskripsi singkat "Temukan buku yang ingin dipinjam." Bagian ini memberikan konteks kepada pengguna mengenai fungsi halaman yang sedang dibuka.

### 2.3 Kolom Pencarian

Kolom pencarian ditempatkan di bawah judul dan deskripsi halaman. Kolom ini menggunakan ikon pencarian dan petunjuk "Cari judul atau penulis buku" agar pengguna memahami informasi yang dapat dicari.

Keputusan ini bertujuan mempermudah pengguna menemukan buku berdasarkan judul atau nama penulis tanpa harus memeriksa seluruh daftar secara manual.

### 2.4 Daftar Buku

Setiap buku ditampilkan menggunakan komponen berbentuk Card. Informasi di dalamnya meliputi ikon buku, judul, nama penulis, dan status ketersediaan.

Penggunaan Card membantu memisahkan informasi setiap buku sehingga daftar lebih mudah dibaca. Ikon buku juga digunakan sebagai elemen visual pendukung yang konsisten pada setiap item.

### 2.5 Warna Status Ketersediaan

Status buku dibedakan menggunakan teks berwarna. Status "Tersedia" menggunakan warna biru, sedangkan status "Sedang dipinjam" menggunakan warna merah.

Perbedaan warna membantu pengguna mengenali kondisi buku dengan lebih cepat. Meskipun demikian, informasi tetap disampaikan dalam bentuk teks agar status tidak hanya dapat dipahami melalui warna.

### 2.6 Tombol Ajukan Peminjaman

Tombol "Ajukan Peminjaman" ditempatkan di bagian kanan bawah halaman. Bentuk tombol yang menonjol dan ikon tambah membantu pengguna mengenali tindakan utama yang berkaitan dengan peminjaman buku.

Fungsi tombol perlu diuji untuk memastikan bahwa tindakan yang dilakukan sesuai dengan labelnya. Apabila tombol hanya menampilkan notifikasi, proses pengajuan peminjaman belum dapat dianggap selesai.

### 2.7 Warna Latar dan Tata Letak

Latar halaman menggunakan warna terang dengan kombinasi abu-abu pada bagian AppBar dan kartu buku. Pemilihan warna ini bertujuan menjaga tampilan tetap sederhana dan membuat teks lebih mudah dibaca.

Jarak antarbagian juga digunakan untuk memisahkan judul halaman, kolom pencarian, dan daftar buku. Tata letak tersebut membantu membentuk urutan informasi yang jelas.

## 3. Prinsip UI/UX yang Diterapkan

- **Kejelasan informasi:** judul, penulis, dan status buku ditampilkan secara langsung.
- **Konsistensi:** setiap buku menggunakan pola tampilan yang sama.
- **Kemudahan penggunaan:** kolom pencarian dan tombol peminjaman ditempatkan pada area yang mudah ditemukan.
- **Umpan balik:** tindakan pengguna sebaiknya menghasilkan respons yang jelas.
- **Keterbacaan:** teks dan warna dipilih agar informasi dapat dipahami dengan mudah.

## 4. Evaluasi Antarmuka

Berdasarkan tampilan halaman utama, informasi katalog sudah disusun secara terstruktur dan setiap buku memiliki pemisah visual yang jelas. Tombol peminjaman juga mudah ditemukan karena ditempatkan terpisah dari daftar buku.

Namun, terdapat beberapa hal yang perlu diperhatikan pada pengembangan berikutnya:

1. Memastikan kolom pencarian dapat memfilter buku berdasarkan judul atau penulis.
2. Memastikan tombol pengajuan peminjaman menjalankan tindakan yang sesuai.
3. Menguji tampilan pada layar dengan ukuran berbeda.
4. Memastikan kontras warna teks dan status tetap nyaman dibaca.
5. Menambahkan tampilan ketika hasil pencarian tidak ditemukan atau daftar buku kosong.

Evaluasi ini didasarkan pada pengamatan terhadap tampilan prototype. Pengujian langsung kepada pengguna belum dapat dinyatakan telah dilakukan apabila belum ada proses pengujian.

## 5. Kesimpulan

Keputusan desain UI/UX PustakaKu berfokus pada penyajian katalog buku yang sederhana, konsisten, dan mudah dipahami. Penggunaan AppBar, kolom pencarian, Card, indikator status, dan tombol pengajuan peminjaman mendukung tujuan tersebut. Pengembangan berikutnya perlu memastikan bahwa setiap elemen tidak hanya terlihat jelas, tetapi juga berfungsi sesuai kebutuhan pengguna.
