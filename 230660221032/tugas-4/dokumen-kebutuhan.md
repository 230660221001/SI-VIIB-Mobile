# Dokumen Kebutuhan - Aplikasi RadiAct

## 1. Deskripsi Aplikasi

RadiAct (Radio Activity) adalah aplikasi manajemen jadwal program harian/upload konten digital yang dirancang khusus untuk UKM Unsap Radio. Permasalahan utama yang dihadapi pengguna adalah sistem koordinasi antar divisi yang masih berantakan, sehingga sering terjadi miskomunikasi terkait proses upload konten. Hal ini berdampak pada jadwal publikasi yang tidak sesuai perencanaan, konten telat diunggah atau bahkan gagal diunggah, permintaan pindah hari yang mendadak hingga memicu bentrokan jadwal dengan divisi lain, serta status maupun progres pembuatan konten yang tidak terpantau. Solusi berbasis aplikasi mobile dipilih agar seluruh anggota crew radio dapat mengelola dan memantau jadwal terkini serta memperbarui status publikasi secara fleksibel di mana saja langsung dari perangkat ponsel mereka disela kesibukan perkuliahan.

## 2. User Persona

### 2.1 Persona 1 — Ketua Divisi Inti

| Komponen | Isi |
|:---------|:----|
| Nama dan peran | Ketua Divisi Inti - Koor Implementasi |
| Tujuan | Melaporkan kendala, mengajukan pergeseran jadwal, dan meng-update progres pengerjaan program harian agar terpantau. |
| Kendala | Belum ada media terpusat untuk mencatat progres pengerjaan, sehingga tidak terpantau dan koordinasi masih lewat pesan chat acak yang sering tertumpuk dan terlambat direspons. |
| Perangkat dan konteks | Smartphone Android; digunakan di sela-sela kuliah atau di mana saja untuk memantau dan mengupdate publikasi konten harian | Setiap hari 2–3 kali. |

### 2.2 Persona 2 Ketua Divisi MarCom (Marketing and Communication) / Publikasi

| Komponen | Isi |
|:---------|:----|
| Nama dan peran | Ketua Divisi MarCom - Koor Akhir (Proses Publikasi) |
| Tujuan | Memantau jadwal publikasi, memastikan kesiapan konten dari divisi inti, dan memperbarui status konten yang sudah diunggah. |
| Kendala | Informasi perubahan jadwal atau keterlambatan konten dari divisi inti sering mendadak dan tidak terstruktur, sehingga Marcom sering kelimpungan saat mau upload atau konten terpaksa batal tayang |
| Perangkat dan konteks | Smartphone Android; digunakan di sela-sela jam kuliah, saat memantau jadwal, atau di mana saja menjelang jam publikasi konten harian |
| Frekuensi penggunaan | 3–5 kali seminggu (sesuai dengan jadwal publikasi konten harian) |

### 2.3 Persona 3 Sekretaris Umum

| Komponen | Isi |
|:---------|:----|
| Nama dan peran | Sekretaris Umum - Crew Planning (Pengelola Jadwal) |
| Tujuan | Membuat jadwal program harian, mengatur pergeseran jadwal yang bentrok, dan merekap keterlaksanaan konten harian |
| Kendala | Sering pusing atur jadwal bentrok akibat permintaan pindah hari mendadak dan rekapitulasi evaluasi masih manual (melihat ketersediaan konten publikasi di akun/media publikasi UKM Radio)  |
| Perangkat dan konteks | Smartphone Android; digunakan saat mengolah jadwal harian dan merekap realisasi program |
| Frekuensi penggunaan | 1–2 kali seminggu untuk input dan sesuaikan jadwal, 1 kali di akhir bulan untuk rekapitulasi |

## 3. Kebutuhan Fungsional

| ID | Rumusan Kebutuhan | Terkait Persona |
|:---|:------------------|:----------------|
| F-01 | Crew dapat melihat daftar seluruh jadwal program dan konten harian beserta status publikasinya | Persona 1, Persona 2, Persona 3 |
| F-02 | Sekretaris Umum dapat menambahkan jadwal program baru dengan mengisi nama program, divisi, tanggal, dan jam tayang | Persona 3 |
| F-03 | Crew dapat memperbarui status progres konten (Progres, Terkendala, Tayang, Batal) beserta catatan atau tautan kontennya | Persona 1, Persona 2 |
| F-04 | Crew dapat memfilter daftar jadwal program berdasarkan nama divisi penanggung jawab | Persona 1, Persona 2 |
| F-05 | Sekretaris Umum dapat mengubah tanggal/jam atau menghapus jadwal program yang mengalami bentrokan | Persona 3 |
| F-06 | Crew dapat melihat ringkasan total program harian dan header sapaan di halaman utama | Persona 1, Persona 2, Persona 3 |


## 4. Kebutuhan Nonfungsional

| ID | Kategori | Rumusan | Kriteria Terukur |
|:---|:---------|:--------|:-----------------|
| NF-01 | Kegunaan | Aplikasi memudahkan pengguna mengecek status progres jadwal dan catatan konten secara cepat | Status publikasi, kendala, dan tautan konten dapat dilihat maksimal dalam 2 langkah navigasi setelah aplikasi dibuka |
| NF-02 | Kinerja | Halaman utama aplikasi dapat menampilkan daftar jadwal secara responsif | Seluruh daftar jadwal harian dapat dimuat penuh dalam waktu kurang dari 2 detik saat aplikasi dibuka atau saat berpindah halaman |


## 5. Prioritas Fitur (MoSCoW)

| Prioritas | ID Kebutuhan | Alasan |
|:----------|:-------------|:-------|
| Must have | F-01, F-02, F-03, F-06 | Merupakan alur utama aplikasi untuk menyelesaikan permasalahan yang dialami. F-01 untuk transparansi jadwal (Persona 1, 2, 3), F-02 bagi Sekretaris Umum untuk pembuatan jadwal, F-03 bagi Kadiv Inti dan MarCom untuk update status/kendala, serta F-06 untuk ringkasan harian di home. |
| Should have | F-04 | Pencarian/filter berdasarkan divisi mempermudah Kadiv Inti dan MarCom dalam memilah jadwal spesifik mereka, tetapi alur pemantauan utama tetap bisa berjalan walau harus scroll manual. |
| Could have | F-05 | Penyesuaian/hapus jadwal bentrok oleh Sekretaris Umum sangat berguna saat ada perubahan mendadak, tetapi jika belum diimplementasikan, penyesuaian masih bisa dilakukan dengan membuat jadwal baru. |
| Won't have (saat ini) | F-07 (Notifikasi Otomatis) | Fitur notifikasi otomatis push/reminder ditunda pada pengujian tahap awal ini agar fokus utama pengembangan aplikasi mobile  tetap pada keandalan manajemen jadwal harian. |


## 6. Pemetaan Kebutuhan ke Antarmuka

| ID Kebutuhan | Rumusan (ringkas) | Prioritas | Halaman yang Memenuhi | Widget yang Direncanakan (P3) |
|:-------------|:------------------|:----------|:----------------------------|:------------------------------|
| F-01 | Melihat daftar seluruh jadwal program dan statusnya | Must | Halaman Utama | `Scaffold` + `ListView.builder` + `Card` + `ListTile` |
| F-02 | Menambahkan jadwal program atau konten baru | Must | Form Tambah Jadwal | `Scaffold` + `AppBar` + `Column` + `TextField` + `ElevatedButton` |
| F-03 | Memperbarui status progres dan catatan kendala | Must | Detail / Dialog Edit Status | `Scaffold` + `Column` + `TextField` + `DropdownButton` |
| F-04 | Memfilter jadwal berdasarkan divisi | Should | Halaman Utama | `Row` + `DropdownButton` |
| F-05 | Mengubah tanggal/jam atau menghapus jadwal bentrok | Could | Form Edit / Detail Jadwal | `Scaffold` + `Column` + `IconButton` + `ElevatedButton` |
| F-06 | Melihat header sapaan dan ringkasan total program | Must | Halaman Utama | `Card` + `Column` + `Row` + `Text` |