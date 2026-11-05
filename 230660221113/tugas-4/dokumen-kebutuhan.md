# Dokumen Kebutuhan — FasKampus

## 1. Deskripsi Aplikasi

FasKampus adalah aplikasi yang dirancang untuk membantu mahasiswa Universitas Sebelas April mencari informasi dan mengajukan peminjaman fasilitas kampus. Mahasiswa dapat melihat daftar dan detail fasilitas, memilih tanggal dan jam penggunaan, mengisi tujuan peminjaman, serta memantau status pengajuannya. Pengajuan akan diperiksa oleh sistem untuk mengetahui apakah terdapat benturan jadwal sebelum dikirim kepada admin untuk ditinjau dan diputuskan. Aplikasi berbasis mobile dipilih agar mahasiswa dapat mencari informasi dan mengajukan peminjaman melalui ponsel, sedangkan admin dapat memeriksa pengajuan dan memperbarui keputusan dengan lebih praktis.

## 2. User Persona

### Persona 1 — Rani — Mahasiswa Peminjam

| **Komponen** | **Isi** |
|---|---|
| Nama dan peran | Rani — mahasiswa yang mengajukan peminjaman fasilitas kampus. |
| Tujuan | Menemukan fasilitas yang sesuai dengan kebutuhan kegiatan dan mengajukan peminjaman pada jadwal yang diinginkan. |
| Kendala | Belum mengetahui informasi lengkap fasilitas, kesulitan memastikan jadwal tersedia, dan perlu mengetahui hasil pengajuan tanpa harus bertanya langsung kepada admin. |
| Perangkat dan konteks | Ponsel saat berada di kampus atau ketika merencanakan kegiatan kuliah dan organisasi. |
| Frekuensi penggunaan | Sesuai kebutuhan, terutama ketika akan mengadakan kegiatan yang memerlukan fasilitas kampus. |

### Persona 2 — Dedi — Admin Fasilitas

| **Komponen** | **Isi** |
|---|---|
| Nama dan peran | Dedi — admin yang bertugas memeriksa dan memproses pengajuan peminjaman fasilitas kampus. |
| Tujuan | Memeriksa pengajuan mahasiswa, mempertimbangkan jadwal penggunaan, dan memberikan keputusan peminjaman secara jelas. |
| Kendala | Harus memeriksa informasi fasilitas, tanggal, jam, dan tujuan pengajuan serta menghindari benturan jadwal dengan peminjaman lain. |
| Perangkat dan konteks | Komputer atau ponsel ketika bertugas mengelola fasilitas kampus. |
| Frekuensi penggunaan | Setiap kali ada pengajuan baru yang perlu diperiksa atau diputuskan. |

## 3. Kebutuhan Fungsional

| **ID** | **Rumusan Kebutuhan** | **Terkait Persona** |
|---|---|---|
| F-01 | Mahasiswa dapat melihat daftar fasilitas kampus beserta informasi ringkas setiap fasilitas. | Persona 1 |
| F-02 | Mahasiswa dapat melihat detail fasilitas yang dipilih untuk mengetahui informasi fasilitas sebelum mengajukan peminjaman. | Persona 1 |
| F-03 | Mahasiswa dapat mengajukan peminjaman fasilitas dengan mengisi fasilitas, tanggal, jam, dan tujuan peminjaman yang diperlukan. | Persona 1 |
| F-04 | Sistem dapat memeriksa benturan jadwal untuk fasilitas yang sama sebelum pengajuan dikirim, termasuk terhadap pengajuan yang masih menunggu dan peminjaman yang telah disetujui. | Persona 1 dan Persona 2 |
| F-05 | Mahasiswa dapat melihat status pengajuan peminjaman yang telah dikirim beserta alasan penolakan apabila pengajuan ditolak. | Persona 1 |
| F-06 | Admin dapat melihat daftar dan rincian pengajuan peminjaman yang masuk untuk diperiksa sebelum mengambil keputusan. | Persona 2 |
| F-07 | Admin dapat menetapkan keputusan atas pengajuan peminjaman dengan menyetujui atau menolak pengajuan, dan wajib mengisi alasan apabila menolak. | Persona 2 |
| F-08 | Mahasiswa dapat melihat riwayat pengajuan peminjaman beserta tanggal dan status masing-masing pengajuan. | Persona 1 |

**Aturan yang digunakan dalam analisis:**

- Benturan jadwal terjadi jika fasilitas yang sama diminta pada rentang waktu yang bertumpang tindih.
- Pemeriksaan jadwal dilakukan sebelum pengajuan dikirim untuk diproses admin.
- Pengajuan yang masih menunggu dan peminjaman yang telah disetujui sama-sama diperhitungkan dalam pemeriksaan jadwal.
- Jika jadwal bertabrakan, mahasiswa mendapat informasi bahwa jadwal tidak tersedia dan perlu memperbaiki pilihan waktu.
- Jadwal yang tersedia tidak berarti peminjaman langsung disetujui. Admin tetap mengambil keputusan akhir.
- Penolakan tidak dapat disimpan tanpa alasan dari admin.

## 4. Kebutuhan Nonfungsional

| **ID** | **Kategori** | **Rumusan** | **Kriteria Terukur** |
|---|---|---|---|
| NF-01 | Kinerja | Aplikasi harus menampilkan daftar fasilitas dalam waktu yang wajar agar mahasiswa dapat mencari informasi tanpa menunggu terlalu lama. | Daftar fasilitas tampil maksimal 3 detik pada kondisi pengujian dan jaringan yang telah ditentukan. |
| NF-02 | Kegunaan | Formulir peminjaman harus mudah dipahami agar mahasiswa dapat mengajukan fasilitas tanpa bantuan langsung dari admin. | Mahasiswa yang mengikuti uji coba dapat menyelesaikan pengisian dan pengiriman formulir yang valid dalam maksimal 3 menit. |
| NF-03 | Keamanan | Aplikasi harus membatasi tindakan pengelolaan pengajuan berdasarkan peran pengguna. | Pengguna yang tidak memiliki peran admin tidak dapat menjalankan tindakan persetujuan atau penolakan pengajuan. |

Kriteria di atas merupakan target yang direncanakan dan belum dianggap sebagai hasil pengujian. Pengujian perlu dilakukan untuk memastikan target tersebut tercapai.

## 5. Prioritas Fitur (MoSCoW)

| **Prioritas** | **ID Kebutuhan** | **Alasan** |
|---|---|---|
| Must have | F-01, F-03, F-04, F-06, F-07 | Daftar fasilitas menjadi titik awal pencarian. Pengajuan, pemeriksaan benturan jadwal, pemeriksaan oleh admin, dan keputusan admin merupakan proses inti yang diperlukan agar peminjaman dapat diproses sesuai aturan aplikasi. |
| Should have | F-02, F-05 | Detail fasilitas membantu mahasiswa membuat pilihan yang tepat, sedangkan tampilan status dan alasan penolakan membantu mahasiswa mengetahui hasil pengajuan. Keduanya sangat bermanfaat, tetapi perlu dievaluasi terhadap batas ruang lingkup MVP dan tidak boleh diabaikan dalam rancangan keseluruhan. |
| Could have | F-08 | Riwayat pengajuan memudahkan mahasiswa melihat permintaan terdahulu, tetapi dapat dikembangkan setelah proses pengajuan dan keputusan utama berjalan dengan baik. |
| Won't have (saat ini) | Tidak ada kebutuhan fungsional tambahan yang dimasukkan ke kategori ini. | Fitur di luar ruang lingkup awal, seperti pembayaran denda secara daring dan integrasi kartu akses gedung, belum direncanakan karena tidak diperlukan untuk menguji alur dasar peminjaman. Fitur tersebut dapat dipertimbangkan pada pengembangan berikutnya. |

**Catatan evaluasi prioritas:** pembagian ini masih perlu ditinjau. F-05 berhubungan erat dengan kebutuhan mahasiswa untuk mengetahui keputusan admin. Jika pemantauan status harus tersedia pada versi pertama, pertimbangkan untuk menaikkan F-05 menjadi *Must have* dan menilai kembali apakah F-01 dapat disederhanakan atau diprioritaskan ulang. Jumlah ID dalam kategori *Must have* tidak boleh lebih dari lima.

## 6. Pemetaan Kebutuhan ke Antarmuka

| **ID Kebutuhan** | **Rumusan (ringkas)** | **Prioritas** | **Halaman yang Memenuhi** | **Widget yang Direncanakan (P3)** |
|---|---|---|---|---|
| F-01 | Mahasiswa melihat daftar fasilitas kampus. | Must | Beranda / Daftar Fasilitas | `Scaffold` + `AppBar` + `ListView.builder` + `ListTile` |
| F-02 | Mahasiswa melihat detail fasilitas. | Should | Detail Fasilitas | `Scaffold` + `AppBar` + `Column` + `Card` |
| F-03 | Mahasiswa mengajukan peminjaman. | Must | Form Peminjaman | `Scaffold` + `AppBar` + `Column` + `TextField` + tombol pengajuan |
| F-04 | Sistem memeriksa benturan jadwal. | Must | Form Peminjaman | `Column` + `Text` untuk pesan validasi + tombol pengajuan |
| F-05 | Mahasiswa melihat status dan alasan penolakan. | Should | Status Pengajuan | `Scaffold` + `AppBar` + `ListView.builder` + `Card` + `ListTile` |
| F-06 | Admin melihat dan memeriksa pengajuan masuk. | Must | Dashboard Admin / Detail Pengajuan | `Scaffold` + `AppBar` + `ListView.builder` + `ListTile` + `Card` |
| F-07 | Admin menyetujui atau menolak dengan alasan wajib. | Must | Detail Pengajuan Admin | `Scaffold` + `Column` + `TextField` untuk alasan penolakan + tombol tindakan |
| F-08 | Mahasiswa melihat riwayat pengajuan. | Could | Riwayat Peminjaman | `Scaffold` + `AppBar` + `ListView.builder` + `Card` + `ListTile` |

Widget yang tercantum merupakan rancangan awal berdasarkan materi Pertemuan 3. Widget dan susunan halaman dapat diperbaiki pada pertemuan berikutnya. Widget hanya menjelaskan rencana antarmuka, sedangkan validasi jadwal, penyimpanan pengajuan, dan pengelolaan keputusan tetap merupakan perilaku sistem yang harus dipenuhi.