# Quiz Pertemuan 10 — Integrasi Data dan Proses Bisnis

## Soal 1 — Integrasi Data
Integrasi data adalah proses menghubungkan dan menggabungkan data dari beberapa sumber (endpoint) yang berbeda untuk membentuk satu kesatuan informasi yang utuh dan bermakna. 
**Contoh dari proses bisnis BSM:** Aplikasi mengambil data nama pemesan dari endpoint `/users` dan data detail pesanan dari endpoint `/posts`. 
**Identifier penghubung:** `userId`. Data di-join agar daftar pesanan menampilkan nama pemesan yang sesuai.

## Soal 2 — `Future.wait`
`Future.wait` digunakan ketika kita memiliki **beberapa request asynchronous yang tidak saling bergantung** (independent). Tujuannya agar semua request berjalan secara bersamaan (paralel) untuk menghemat waktu eksekusi.
Sebaliknya, request dijalankan **secara berurutan** (menggunakan `await` satu per satu) jika request kedua membutuhkan nilai/identifier (seperti `id`) yang dihasilkan dari response request pertama.

## Soal 3 — Model dan `fromJson`
Field yang dibutuhkan pada model `DataPesanan` untuk menghubungkan pengguna dan pengajuan adalah `userId`.
Di dalam `fromJson`, penanganan field yang tidak tersedia pada response dilakukan dengan menggunakan operator *null-aware* atau nilai default (contoh: `json['status'] as String? ?? 'menunggu'`). Ini mencegah aplikasi *crash* (error tipe data null) jika API tidak mengirimkan field tersebut.

## Soal 4 — Service Layer
Tanggung jawab utama Service Layer adalah menangani seluruh logika komunikasi jaringan (HTTP request), melakukan parsing JSON menjadi objek Dart, dan menerapkan aturan proses bisnis (seperti *join* data).
Penggabungan data tidak boleh ditulis langsung di dalam widget karena widget seharusnya hanya fokus pada *rendering* UI (tampilan). Jika logika jaringan dicampur di dalam widget, kode akan menjadi sangat kotor, sulit diuji, dan tidak bisa digunakan ulang di halaman lain.

## Soal 5 — Status Halaman
State yang perlu ditangani pada halaman integrasi data meliputi:
1. `loading` (sedang memuat data).
2. `sukses` (data berhasil ditampilkan).
3. `error` (terjadi kegagalan jaringan atau server).
4. `kosong` (request sukses, tetapi data yang dikembalikan berjumlah 0).

**Mengapa kosong dan error harus dibedakan?** 
Karena keduanya memiliki arti yang berbeda. Kondisi kosong berarti sistem berjalan normal, hanya saja memang belum ada data (pengguna tidak perlu melakukan apa-apa). Sedangkan kondisi error berarti ada masalah koneksi/server (pengguna disarankan menekan tombol "Coba Lagi"). Jika disamakan, pengguna akan bingung.