# Catatan Keputusan UI — FasKampus

## 1. Tujuan Perancangan

Perancangan antarmuka FasKampus bertujuan memudahkan mahasiswa dalam mencari informasi fasilitas kampus dan mengakses layanan peminjaman. Antarmuka dirancang sederhana, konsisten, dan mudah dipahami sesuai kebutuhan fungsional yang telah dianalisis pada Tugas 4 dan Information Architecture (IA) Tugas 5.

## 2. Keputusan Desain Utama

### 2.1 Warna Antarmuka

Warna utama yang digunakan adalah merah akademik dengan kode `#B21F32`, dipadukan dengan merah gelap `#821526`. Warna merah digunakan untuk menonjolkan identitas aplikasi dan elemen penting, seperti header, tombol pengajuan, serta ikon fasilitas.

Warna latar belakang menggunakan `#F7F7F9`, sedangkan kartu informasi menggunakan warna putih agar konten mudah dibaca dan dibedakan.

**Alasan:** penggunaan warna yang konsisten membantu membangun identitas visual FasKampus dan menjaga keterbacaan antarmuka.

### 2.2 Tata Letak Beranda

Beranda menjadi layar utama mahasiswa dan mengacu pada kebutuhan F-01. Informasi disusun secara vertikal dengan urutan berikut:

1. Header aplikasi yang memuat nama FasKampus dan tombol notifikasi.
2. Sapaan pengguna dan deskripsi singkat aplikasi.
3. Banner utama yang menyediakan akses menuju pengajuan fasilitas.
4. Ringkasan jumlah jenis fasilitas dan fasilitas yang tersedia.
5. Kolom pencarian dan filter kategori fasilitas.
6. Daftar fasilitas beserta lokasi, jumlah, dan status ketersediaan.
7. Navigasi bawah untuk mengakses menu utama.

**Alasan:** susunan ini memprioritaskan pencarian informasi fasilitas sebagai kebutuhan utama mahasiswa, sekaligus menyediakan akses yang jelas menuju layanan lainnya.

### 2.3 Pencarian dan Filter Fasilitas

Pencarian dirancang berdasarkan nama atau lokasi fasilitas. Filter kategori terdiri dari Semua, Ruangan, dan Peralatan.

Hasil pencarian dan filter ditampilkan pada daftar fasilitas tanpa harus berpindah layar.

**Alasan:** fitur ini membantu mahasiswa menemukan fasilitas yang dibutuhkan secara lebih cepat dan mengurangi kesulitan ketika daftar fasilitas bertambah.

**Keterkaitan kebutuhan:** F-01.

### 2.4 Kartu Informasi Fasilitas

Setiap fasilitas ditampilkan dalam kartu yang memuat nama fasilitas, lokasi, jumlah, ikon, dan status ketersediaan. Status dibedakan menggunakan label, yaitu Tersedia dan Terbatas.

**Alasan:** informasi penting dapat dipindai dengan cepat sehingga mahasiswa dapat mempertimbangkan fasilitas yang sesuai dengan kebutuhannya.

**Keterkaitan kebutuhan:** F-01 dan pengembangan detail fasilitas pada F-02.

### 2.5 Layar Status Pengajuan

Layar pendukung yang dipilih untuk wireframe adalah Status Pengajuan dengan ID kebutuhan F-05. Layar ini dirancang untuk menampilkan daftar pengajuan beserta statusnya, seperti Diproses, Disetujui, dan Ditolak.

Pada keadaan kosong, layar menampilkan pesan bahwa belum ada pengajuan serta ajakan untuk memulai pengajuan fasilitas.

**Alasan:** keadaan kosong memberikan informasi yang jelas ketika mahasiswa belum memiliki pengajuan, sehingga layar tidak terlihat seperti mengalami kesalahan atau gagal memuat data.

### 2.6 Navigasi Bawah

Navigasi bawah terdiri dari empat menu, yaitu Beranda, Fasilitas, Pengajuan, dan Profil. Menu aktif ditandai dengan warna merah akademik.

**Alasan:** navigasi yang konsisten membantu pengguna mengenali lokasi halaman dan mempermudah akses ke fitur utama aplikasi.

Pada prototype Tugas 5, sebagian menu masih berupa demonstrasi dan belum terhubung ke halaman terpisah.

## 3. Tipografi dan Komponen

Antarmuka menggunakan teks dengan ukuran dan ketebalan yang disesuaikan dengan hierarki informasi. Judul halaman dibuat lebih menonjol daripada deskripsi dan informasi tambahan.

Komponen seperti kartu, tombol, kolom pencarian, label status, dan navigasi menggunakan bentuk serta jarak yang konsisten.

**Alasan:** konsistensi tipografi dan komponen membantu meningkatkan keterbacaan serta memberikan pengalaman penggunaan yang lebih teratur.

## 4. Keadaan Kosong dan Feedback

Prototype memperhatikan kebutuhan feedback ketika pengguna berinteraksi dengan aplikasi. Pada beranda, pencarian yang tidak menghasilkan data menampilkan pesan "Fasilitas tidak ditemukan".

Pada layar Status Pengajuan, keadaan kosong ditampilkan dengan pesan "Belum ada pengajuan". Sementara itu, beberapa tombol yang belum memiliki fungsi lengkap memberikan pemberitahuan melalui SnackBar.

**Alasan:** feedback membantu pengguna memahami kondisi aplikasi dan mengetahui apakah tindakan yang dilakukan menghasilkan respons.

## 5. Konsistensi dengan Information Architecture

Keputusan desain disesuaikan dengan struktur IA FasKampus sebagai berikut:

| ID Kebutuhan  | Layar                              | Keputusan UI                                                                             |
| ------------- | ---------------------------------- | ---------------------------------------------------------------------------------------- |
| F-01          | Beranda / Daftar Fasilitas         | Menampilkan ringkasan, pencarian, filter, dan daftar fasilitas.                          |
| F-02          | Detail Fasilitas                   | Direncanakan untuk menampilkan informasi fasilitas secara lebih lengkap.                 |
| F-03 dan F-04 | Form Peminjaman                    | Direncanakan untuk mengisi data peminjaman dan memeriksa benturan jadwal.                |
| F-05          | Status Pengajuan                   | Menampilkan status pengajuan dan alasan penolakan jika tersedia.                         |
| F-06          | Dashboard Admin / Detail Pengajuan | Direncanakan untuk menampilkan pengajuan yang masuk untuk diperiksa admin.               |
| F-07          | Detail Pengajuan Admin             | Direncanakan untuk menampilkan rincian pengajuan serta tindakan menyetujui atau menolak. |
| F-08          | Riwayat Peminjaman                 | Direncanakan untuk menampilkan riwayat pengajuan mahasiswa.                              |

## 6. Batasan Implementasi

Pada Tugas 5, implementasi Flutter difokuskan pada layar Beranda / Daftar Fasilitas. Informasi fasilitas masih menggunakan data contoh yang disimpan dalam kode, belum berasal dari database.

Fitur pengajuan peminjaman, pemeriksaan benturan jadwal, pengelolaan pengajuan oleh admin, dan navigasi menuju layar pendukung belum diimplementasikan sepenuhnya.

Pengembangan berikutnya akan mengikuti prioritas kebutuhan fungsional dan rancangan IA, termasuk penyempurnaan navigasi serta interaksi antarlayar pada Pertemuan 6.

## 7. Kesimpulan

Keputusan UI FasKampus dibuat dengan mempertimbangkan kebutuhan mahasiswa, struktur Information Architecture, konsistensi visual, dan kemudahan penggunaan. Beranda diprioritaskan sebagai layar utama karena menjadi titik awal pencarian fasilitas, sedangkan layar Status Pengajuan digunakan sebagai layar pendukung pada wireframe.

Dengan keputusan desain ini, prototype FasKampus memiliki dasar antarmuka yang konsisten dan dapat dikembangkan secara bertahap sesuai kebutuhan sistem.
