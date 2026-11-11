Information Architecture — Tugas 5
Prototype UI/UX SIPUSKAM

Nama: Kikania Zahra
NPM: 230660221094
Mata Kuliah: Pemrograman Aplikasi Bergerak
Pertemuan: 5 — UI/UX Mobile
Domain: Sistem Informasi Perpustakaan Kampus (SIPUSKAM)

1. Deskripsi

Information Architecture (IA) pada SIPUSKAM digunakan untuk menyusun struktur layar aplikasi berdasarkan kebutuhan fungsional yang telah dianalisis pada Tugas 4.

Struktur layar tidak dibuat berdasarkan banyaknya fitur, tetapi berdasarkan kebutuhan pengguna dan tugas utama yang harus dapat dilakukan melalui aplikasi. Setiap layar pada IA memiliki keterkaitan dengan kebutuhan fungsional F-01 sampai F-06 yang telah ditentukan pada Tugas 4.

Pada Tugas 5, rancangan difokuskan pada layar yang berkaitan dengan aktivitas utama pengguna, khususnya mahasiswa dalam mencari dan memperoleh informasi mengenai buku yang tersedia di perpustakaan.

2. Inventaris Layar

Berdasarkan hasil pemetaan kebutuhan pada Tugas 4, diperoleh beberapa layar yang diperlukan dalam aplikasi SIPUSKAM.

ID	Layar	Kebutuhan yang Dipenuhi	Pengguna
L-01	Halaman Utama / Daftar Buku	F-01, F-03	Mahasiswa
L-02	Detail Buku	F-02	Mahasiswa
L-03	Hasil Pencarian Buku	F-03	Mahasiswa
L-04	Kelola Data Buku	F-04, F-05	Petugas
L-05	Status Ketersediaan Buku	F-06	Petugas
Keterangan Kebutuhan
F-01: Mahasiswa dapat melihat daftar buku.
F-02: Mahasiswa dapat melihat detail informasi buku.
F-03: Mahasiswa dapat mencari buku berdasarkan judul atau kata kunci.
F-04: Petugas dapat menambahkan data buku.
F-05: Petugas dapat mengubah informasi buku.
F-06: Petugas dapat mengubah status ketersediaan buku.
3. Penetapan Layar Utama
L-01 — Halaman Utama / Daftar Buku

L-01 ditetapkan sebagai layar utama SIPUSKAM karena menjadi titik awal mahasiswa dalam memperoleh informasi perpustakaan dan secara langsung memenuhi kebutuhan F-01 (melihat daftar buku) serta mendukung F-03 (mencari buku).

Layar ini diprioritaskan karena aktivitas utama mahasiswa pada SIPUSKAM adalah menemukan informasi buku dengan cepat, sehingga daftar buku perlu menjadi informasi yang paling mudah ditemukan ketika aplikasi dibuka.

4. Struktur Information Architecture

Struktur IA SIPUSKAM disusun dengan menempatkan Halaman Utama / Daftar Buku sebagai titik masuk utama. Layar yang mendukung aktivitas pencarian dan informasi buku ditempatkan di bawah aktivitas utama mahasiswa, sedangkan kebutuhan petugas dikelompokkan pada bagian pengelolaan data buku.

flowchart TD
    A["L-01<br/>Halaman Utama / Daftar Buku<br/>F-01, F-03"]

    A --> B["L-02<br/>Detail Buku<br/>F-02"]
    A --> C["L-03<br/>Hasil Pencarian Buku<br/>F-03"]

    A --> D["L-04<br/>Kelola Data Buku<br/>F-04, F-05"]
    D --> E["L-05<br/>Status Ketersediaan Buku<br/>F-06"]
5. Pengelompokan Layar
5.1 Area Informasi Buku

Area ini berfokus pada kebutuhan mahasiswa dalam menemukan dan memperoleh informasi buku.

L-01 — Halaman Utama / Daftar Buku

Menampilkan daftar buku.
Menjadi titik awal penggunaan aplikasi.
Memenuhi F-01.
Mendukung pencarian berdasarkan F-03.

L-02 — Detail Buku

Menampilkan informasi lebih lengkap mengenai buku yang dipilih.
Memenuhi F-02.

L-03 — Hasil Pencarian Buku

Menampilkan buku yang sesuai dengan kata kunci pencarian.
Memenuhi F-03.
5.2 Area Pengelolaan Buku

Area ini digunakan oleh petugas untuk mengelola informasi koleksi perpustakaan.

L-04 — Kelola Data Buku

Menjadi area pengelolaan informasi buku.
Mendukung penambahan data buku melalui F-04.
Mendukung perubahan informasi buku melalui F-05.

L-05 — Status Ketersediaan Buku

Digunakan untuk memperbarui informasi ketersediaan buku.
Memenuhi F-06.
6. Hubungan IA dengan Kebutuhan

Setiap layar harus dapat ditelusuri kembali ke kebutuhan fungsional pada Tugas 4.

Kebutuhan	Layar yang memenuhi	Tujuan
F-01	L-01	Menampilkan daftar buku kepada mahasiswa
F-02	L-02	Menampilkan detail buku
F-03	L-01, L-03	Membantu mahasiswa mencari buku
F-04	L-04	Menambahkan data buku
F-05	L-04	Mengubah informasi buku
F-06	L-05	Mengubah status ketersediaan buku

Dengan pemetaan tersebut, tidak terdapat layar yang berdiri tanpa kebutuhan. Setiap layar memiliki fungsi yang dapat ditelusuri ke kebutuhan fungsional yang telah ditentukan pada Tugas 4.

7. Prioritas untuk Prototype Tugas 5

Walaupun IA memuat seluruh layar yang dibutuhkan SIPUSKAM, implementasi pada Tugas 5 dibatasi pada satu halaman utama sesuai ketentuan Pertemuan 5.

Prioritas implementasi:

Layar Utama

L-01 — Halaman Utama / Daftar Buku

Komponen utama yang direncanakan:

AppBar dengan identitas SIPUSKAM.
Ringkasan/informasi singkat perpustakaan.
Daftar buku.
Informasi judul dan detail singkat buku.
Status ketersediaan buku.
Satu aksi utama.
Keadaan kosong apabila belum terdapat data buku.
Layar Pendukung untuk Wireframe

L-02 — Detail Buku

Layar ini digunakan sebagai layar pendukung dalam wireframe untuk menunjukkan bagaimana pengguna memperoleh informasi yang lebih lengkap setelah menemukan buku pada halaman utama.

Implementasi Flutter pada Tugas 5 tetap hanya untuk L-01. L-02 belum dihubungkan menggunakan Navigator karena navigasi merupakan materi Pertemuan 6.

8. Kesimpulan

Information Architecture SIPUSKAM menempatkan Halaman Utama / Daftar Buku sebagai titik masuk utama karena memenuhi kebutuhan Must have mahasiswa dalam melihat koleksi buku dan mendukung proses pencarian buku.

Struktur ini menjadi dasar untuk membuat wireframe dua layar pada tahap berikutnya, yaitu L-01 sebagai layar utama dan L-02 sebagai layar pendukung. Selanjutnya, rancangan L-01 akan diterjemahkan ke dalam implementasi Flutter menggunakan MaterialApp, ThemeData, Scaffold, AppBar, ListView.builder, Card, ListTile, komponen status, aksi utama, dan keadaan kosong sesuai materi Pertemuan 5.