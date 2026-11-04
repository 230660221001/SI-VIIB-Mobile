## 1. Deskripsi Aplikasi

Pengaduan Fasilitas Kampus adalah aplikasi untuk melaporkan kerusakan fasilitas kampus (misalnya AC mati, lampu padam, keran bocor, atau proyektor rusak) dan memantau perkembangan penanganannya. Saat ini laporan disampaikan lewat grup chat, lisan, atau datang ke kantor sehingga lokasi kerusakan sering tidak jelas, tidak ada bukti foto, laporan mudah tenggelam, dan pelapor tidak tahu apakah laporannya sudah ditangani. Solusi berbentuk aplikasi mobile (bukan web desktop atau cara manual) karena kerusakan ditemukan saat mahasiswa sedang bergerak di area kampus, sehingga laporan perlu dibuat langsung di lokasi dalam waktu singkat dengan kamera ponsel, dan aplikasi harus tetap berguna ketika sinyal lemah di dalam gedung.

## 2. User Persona

### Persona 1 — Rani — Mahasiswa Pelapor

| Komponen              | Isi                                                                                                                    |
| :-------------------- | :--------------------------------------------------------------------------------------------------------------------- |
| Nama dan peran        | Rani — mahasiswa pelapor (pengguna utama aplikasi)                                                                     |
| Tujuan                | Melaporkan kerusakan fasilitas dengan cepat dan mengetahui apakah laporannya sudah ditangani                           |
| Kendala               | Laporan di grup chat sering tenggelam, tidak tahu status penanganan, dan sinyal lemah di beberapa gedung               |
| Perangkat dan konteks | Ponsel Android; dipakai langsung di lokasi kerusakan atau di sela jam kuliah dalam sesi singkat                        |
| Frekuensi penggunaan  | Membuat laporan sekitar 1–3 kali per bulan; membuka daftar status sekitar 1–2 kali per minggu selama ada laporan aktif |

### Persona 2 — Dimas — Petugas Sarana Prasarana

| Komponen              | Isi                                                                                                                               |
| :-------------------- | :-------------------------------------------------------------------------------------------------------------------------------- |
| Nama dan peran        | Dimas — petugas sarana prasarana (penerima dan penindak laporan)                                                                  |
| Tujuan                | Menerima laporan yang jelas (lokasi, foto, deskripsi) agar dapat menentukan prioritas dan menugaskan teknisi tanpa bertanya ulang |
| Kendala               | Laporan tersebar di banyak kanal, sering tanpa foto dan lokasi tepat, serta sulit merekap jumlah laporan per status               |
| Perangkat dan konteks | Komputer kantor untuk dasbor pengelolaan (backend SI); ponsel untuk meninjau laporan saat berkeliling kampus                      |
| Frekuensi penggunaan  | Setiap hari kerja                                                                                                                 |

## 3. Kebutuhan Fungsional

| ID   | Rumusan Kebutuhan                                                                                                                                                  | Terkait Persona      | Cara Verifikasi                                                                         |
| :--- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------- | :-------------------------------------------------------------------------------------- |
| F-01 | Mahasiswa dapat membuat laporan kerusakan fasilitas dengan mengisi judul, kategori, lokasi, dan deskripsi; laporan tidak terkirim bila ada isian wajib yang kosong | Persona 1            | Kirim form kosong lalu muncul pesan kesalahan; kirim form lengkap lalu laporan tercatat |
| F-02 | Mahasiswa dapat melihat daftar laporan miliknya, diurutkan dari yang terbaru, beserta status tiap laporan                                                          | Persona 1            | Setelah membuat 3 laporan, ketiganya tampil berurutan dengan status                     |
| F-03 | Mahasiswa dapat membuka halaman detail suatu laporan untuk melihat kategori, lokasi, deskripsi, tanggal, dan status                                                | Persona 1            | Ketuk satu laporan lalu kelima data tampil sesuai isian                                 |
| F-04 | Mahasiswa dapat melampirkan satu foto kerusakan pada laporan dengan mengambil foto langsung dari kamera                                                            | Persona 1, Persona 2 | Setelah mengambil foto, pratinjau tampil di form dan foto terlihat pada detail laporan  |
| F-05 | Mahasiswa dapat melihat status terbaru laporannya setiap kali daftar laporan dibuka atau disegarkan                                                                | Persona 1            | Ubah status laporan di sisi sistem lalu segarkan daftar sehingga status berubah         |
| F-06 | Mahasiswa dapat menyimpan laporan sebagai draf ketika koneksi internet tidak tersedia                                                                              | Persona 1            | Matikan koneksi, isi form, lalu draf tersimpan dan tampil di daftar draf                |
| F-07 | Mahasiswa dapat menerima pemberitahuan ketika status laporannya berubah                                                                                            | Persona 1            | Ubah status di sisi sistem lalu pemberitahuan muncul di ponsel                          |
| F-08 | Mahasiswa dapat mengisi lokasi laporan secara otomatis berdasarkan posisi ponselnya                                                                                | Persona 1            | Ketuk tombol lokasi lalu isian lokasi terisi sesuai posisi saat itu                     |
| F-09 | Petugas dapat memverifikasi laporan dan mengubah status penanganannya                                                                                              | Persona 2            | Ubah status satu laporan lalu status baru tersimpan dan tampil pada laporan yang sama   |
| F-10 | Petugas dapat melihat rekap jumlah laporan per status dan per gedung                                                                                               | Persona 2            | Rekap menampilkan jumlah yang sama dengan data laporan yang ada                         |

## 4. Kebutuhan Nonfungsional

| ID    | Kategori  | Rumusan                                                                           | Kriteria Terukur                                                                                                                     |
| :---- | :-------- | :-------------------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------- |
| NF-01 | Kegunaan  | Pembuatan laporan harus singkat karena dilakukan di lokasi dan dalam sesi singkat | Dari halaman daftar sampai laporan terkirim maksimal 5 ketukan, tidak termasuk pengetikan isian                                      |
| NF-02 | Kinerja   | Daftar laporan harus tampil cepat dan memberi tanda ketika data sedang dimuat     | Daftar berisi hingga 50 laporan tampil kurang dari 3 detik pada koneksi seluler 4G; indikator loading muncul bila lebih dari 1 detik |
| NF-03 | Keandalan | Draf yang disimpan tidak boleh hilang                                             | Dalam 10 kali uji tutup dan buka kembali aplikasi, 0 draf hilang                                                                     |
| NF-04 | Keamanan  | Mahasiswa hanya melihat laporan miliknya sendiri                                  | Pada pengujian dengan 2 akun berbeda, 0 laporan akun lain tampil di daftar                                                           |

## 5. Prioritas Fitur (MoSCoW)

| Prioritas             | ID Kebutuhan                 | Alasan                                                                                                                                                                                                    |
| :-------------------- | :--------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Must have             | F-01, F-02, F-03, F-04, F-05 | Inti tujuan Rani (melapor dan memantau) dan Dimas (menerima laporan lengkap berfoto). Tanpa kelima fitur ini aplikasi tidak menyelesaikan masalah utama: laporan tenggelam, tanpa bukti, dan tanpa status |
| Should have           | F-06, F-07                   | Penting karena sinyal lemah di gedung (Rani) dan agar pelapor tidak perlu membuka aplikasi berulang kali, tetapi aplikasi tetap berguna tanpa keduanya                                                    |
| Could have            | F-08                         | Mempercepat pengisian lokasi, namun lokasi tetap dapat diketik manual lewat F-01                                                                                                                          |
| Won't have (saat ini) | F-09, F-10                   | Dikelola oleh backend SI dan dasbor petugas, bukan aplikasi mobile mahasiswa; dicatat agar batas lingkup jelas dan dapat dikerjakan pada sisi backend nanti                                               |

## 6. Pemetaan Kebutuhan ke Antarmuka

| ID Kebutuhan | Rumusan (ringkas)                                 | Prioritas | Halaman yang Memenuhi                           | Widget yang Direncanakan (P3)                              |
| :----------- | :------------------------------------------------ | :-------- | :---------------------------------------------- | :--------------------------------------------------------- |
| F-01         | Membuat laporan dengan validasi                   | Must      | Halaman Form Buat Laporan                       | `Scaffold` + `Column` + `Padding` (isian: `TextField`, P6) |
| F-02         | Melihat daftar laporan dan status                 | Must      | Halaman Daftar Laporan                          | `ListView.builder` + `Card` + `Row`                        |
| F-03         | Melihat detail laporan                            | Must      | Halaman Detail Laporan                          | `Scaffold` + `Column` + `Padding`                          |
| F-04         | Melampirkan foto dari kamera                      | Must      | Halaman Form Buat Laporan (pratinjau foto)      | `Card` + `Column`                                          |
| F-05         | Status terbaru saat daftar dibuka atau disegarkan | Must      | Halaman Daftar Laporan                          | `ListView.builder` + `Row` + `Text` berwarna sesuai status |
| F-06         | Menyimpan draf saat tanpa koneksi                 | Should    | Halaman Draf Laporan                            | `ListView.builder` + `ListTile`                            |
| F-07         | Pemberitahuan perubahan status                    | Should    | Notifikasi perangkat dan Halaman Daftar Laporan | `Row` + `Text` (penanda status)                            |
| F-08         | Lokasi otomatis                                   | Could     | Halaman Form Buat Laporan                       | `Row` + tombol lokasi                                      |
| F-09         | Petugas mengubah status                           | Won't     | Di luar aplikasi mobile (dasbor backend SI)     | —                                                          |
| F-10         | Rekap laporan petugas                             | Won't     | Di luar aplikasi mobile (dasbor backend SI)     | —                                                          |
