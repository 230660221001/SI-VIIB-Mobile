# Tugas 3 PAB — Akademik PKBM Al Qosimmiyah

**Nama:** Talitha Ardelia Ivana
**NIM:** 230660221114 
**Kelas:** SI-VIIB  
**Domain SI:** Akademik — PKBM Al Qosimmiyah

## Deskripsi Halaman

Aplikasi Akademik PKBM Al Qosimmiyah merupakan aplikasi mobile yang dirancang untuk memudahkan peserta didik mengakses informasi akademik. Aplikasi ini memiliki empat halaman utama, yaitu Beranda, Nilai Akademik, Jadwal Pelajaran, dan Jadwal Ujian. Informasi disajikan menggunakan kartu dan daftar agar mudah dibaca serta membantu peserta didik melihat informasi akademik melalui perangkat mobile.

## 2. Widget yang Digunakan

| Widget | Peran di Halaman |
|---|---|
| `MaterialApp` | Membungkus aplikasi dan mengatur judul aplikasi. |
| `Scaffold` | Menyediakan struktur utama halaman. |
| `AppBar` | Menampilkan judul atau identitas halaman. |
| `IndexedStack` | Mengatur tampilan halaman yang dipilih melalui navigasi. |
| `NavigationBar` | Memudahkan perpindahan antara Beranda, Nilai, Pelajaran, dan Ujian. |
| `Column` | Menyusun konten halaman secara vertikal. |
| `Row` | Menyusun elemen atau informasi secara horizontal. |
| `Padding` | Memberikan jarak di sekitar elemen. |
| `Card` | Menampilkan informasi akademik dalam bentuk kartu. |
| `ListView.builder` | Menampilkan daftar nilai dan jadwal yang dapat digulir. |

Layout yang digunakan meliputi `Column`, `Row`, `Padding`, dan `ListView.builder`. Widget tersebut membantu menyusun informasi agar lebih teratur dan nyaman dilihat pada layar ponsel.

## Data

Aplikasi menggunakan data akademik statis yang ditulis langsung di dalam kode Flutter. Data mencakup informasi nilai mata pelajaran, jadwal pelajaran, dan jadwal ujian. Data tersebut digunakan sebagai contoh untuk menampilkan informasi pada setiap halaman aplikasi.

## Refleksi

Bagian yang paling sulit saya rangkai adalah ListView.builder di dalam Column, karena daftar memerlukan batas tinggi agar tidak menyebabkan tampilan meluap. Jika ruang daftar tidak diatur dengan benar, aplikasi dapat mengalami error RenderFlex overflow. Saya mengatasinya dengan menggunakan Expanded ketika diperlukan agar daftar dapat mengisi sisa ruang yang tersedia dan digulir dengan baik.