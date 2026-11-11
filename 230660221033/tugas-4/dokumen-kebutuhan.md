# Tugas 4: Dokumen Kebutuhan dan User Flow
**Nama:** Yelly Ambarwaty  
**NIM:** 230660221033  
**Nama Aplikasi:** CeriaReads  

---

## 1. Deskripsi Aplikasi
Aplikasi CeriaReads adalah solusi digital untuk manajemen katalog dan peminjaman buku di komunitas Panti Baca Ceria. Saat ini, anggota dan relawan kesulitan mengecek ketersediaan buku dan riwayat peminjaman karena pencatatan masih dilakukan secara manual menggunakan buku tulis, yang rentan hilang dan menyebabkan antrean panjang di lapak baca. Solusi ini dibangun dalam bentuk aplikasi *mobile* karena aktivitas relawan dan anggota sangat dinamis dan selalu berpindah-pindah lokasi lapak baca, sehingga membutuhkan akses informasi yang praktis, cepat, dan selalu ada dalam genggaman melalui ponsel cerdas mereka.

## 2. User Persona

### Persona 1 — Andi — Anggota Komunitas Peminjam
| Komponen | Isi |
|:---------|:----|
| Nama dan peran | Iqbal — Anggota Komunitas Peminjam |
| Tujuan | Mengetahui ketersediaan buku secara *real-time* dan meminjam buku tanpa harus bertanya kepada relawan. |
| Kendala | Sering datang ke lapak baca hanya untuk mendapati buku yang dicari sedang dipinjam orang lain. |
| Perangkat dan konteks | Ponsel cerdas Android spesifikasi menengah; digunakan di lapak baca dan di rumah. |
| Frekuensi penggunaan | 1-2 kali per minggu saat ada kegiatan lapak baca. |

### Persona 2 — Siti — Relawan Pengurus Lapak
| Komponen | Isi |
|:---------|:----|
| Nama dan peran | Taufiq — Relawan Pengurus Lapak |
| Tujuan | Mencatat proses peminjaman dan pengembalian buku dengan cepat agar tidak terjadi antrean anak-anak. |
| Kendala | Proses mencari nama peminjam di buku catatan manual memakan waktu lama dan sering terjadi salah tulis. |
| Perangkat dan konteks | Ponsel cerdas; digunakan secara intensif selama kegiatan lapak baca berlangsung. |
| Frekuensi penggunaan | Sepanjang durasi kegiatan lapak baca (sekitar 3-4 jam) setiap akhir pekan. |

## 3. Kebutuhan Fungsional

| ID | Rumusan Kebutuhan | Terkait Persona |
|:---|:------------------|:----------------|
| F-01 | Anggota komunitas dapat melihat daftar katalog buku sehingga mengetahui informasi judul, penulis, dan status ketersediaan stok. | Persona 1 |
| F-02 | Anggota komunitas dapat mengajukan peminjaman buku yang berstatus "tersedia" sehingga pengajuan masuk ke sistem relawan. | Persona 1 |
| F-03 | Anggota komunitas dapat membatalkan pengajuan peminjaman buku sebelum disetujui relawan sehingga status buku kembali tersedia. | Persona 1 |
| F-04 | Relawan dapat menyetujui pengajuan peminjaman buku dari anggota sehingga sistem mencatat tanggal mulai pinjam. | Persona 2 |
| F-05 | Relawan dapat menolak pengajuan peminjaman buku dari anggota sehingga sistem membatalkan transaksi. | Persona 2 |
| F-06 | Relawan dapat mencatatkan pengembalian buku dari anggota sehingga status buku kembali menjadi tersedia. | Persona 2 |

## 4. Kebutuhan Nonfungsional

| ID | Kategori | Rumusan | Kriteria Terukur |
|:---|:---------|:--------|:-----------------|
| NF-01 | Kegunaan | Proses pengajuan peminjaman oleh anggota harus praktis. | Proses pengajuan peminjaman selesai maksimal dalam 4 langkah dari halaman utama. |
| NF-02 | Kinerja | Waktu muat halaman katalog harus cepat. | Daftar katalog buku tampil kurang dari 3 detik pada koneksi internet seluler (4G). |

## 5. Prioritas Fitur (MoSCoW)

| Prioritas | ID Kebutuhan | Alasan |
|:----------|:-------------|:-------|
| Must have | F-01, F-02, F-04, F-06 | Empat fitur ini adalah inti atau *Minimum Viable Product* (MVP) dari sistem peminjaman; tanpa fitur ini aplikasi tidak bisa berfungsi. |
| Should have | F-03, F-05 | Pembatalan dan penolakan sangat penting untuk menjaga integritas data, tetapi untuk versi awal, kesalahan input masih bisa diakali dengan koordinasi langsung di lapangan. |
| Could have | (Akan menyusul) | Fitur notifikasi pengingat pengembalian bisa ditambahkan jika waktu mencukupi. |
| Won't have (saat ini) | Fitur rating buku | Penilaian buku bukan fokus utama pada tahap penyelesaian masalah sirkulasi saat ini, sehingga ditunda. |

## 6. Pemetaan Kebutuhan ke Antarmuka

| ID Kebutuhan | Rumusan (ringkas) | Prioritas | Halaman yang Memenuhi | Widget yang Direncanakan (P3) |
|:-------------|:------------------|:----------|:----------------------------|:------------------------------|
| F-01 | Melihat katalog buku | Must | Halaman Utama (Katalog) | `Scaffold` + `ListView.builder` + `Card` |
| F-02 | Mengajukan peminjaman | Must | Halaman Detail Buku | `Column` + `ElevatedButton` |
| F-03 | Membatalkan pengajuan | Should | Halaman Riwayat Pinjam | `ListView.builder` + `TextButton` |
| F-04 | Menyetujui pengajuan | Must | Halaman Dasbor Relawan | `Scaffold` + `ListView.builder` + `Row` |
| F-05 | Menolak pengajuan | Should | Halaman Dasbor Relawan | `ListTile` + `IconButton` |
| F-06 | Mencatat pengembalian | Must | Halaman Dasbor Relawan | `ListTile` + `ElevatedButton` |

---