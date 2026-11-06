# Laporan Progress Project UTS (Milestone M4)

| | |
|:--|:--|
| **Nama** | Ridho Akmal Aulia |
| **NIM** | 230660221024 |
| **Kelas** | SI-VIIB |
| **Domain SI** | Aplikasi Absensi Organisasi Mahasiswa |
| **Judul Aplikasi** | Absensi Organisasi Mahasiswa |
| **Tautan Repository** | https://github.com/230660221024/SI-VIIB-Mobile/tree/230660221024/tugas-8 |

---

## 1. Ringkasan Eksekutif Project
Aplikasi Absensi Organisasi Mahasiswa dirancang untuk menyelesaikan masalah pencatatan kehadiran kegiatan yang masih menggunakan kertas. Pengguna utamanya adalah anggota organisasi dan panitia. Solusi mobile dipilih karena anggota dapat melakukan check-in langsung dari ponsel di lokasi kegiatan, menghemat waktu, dan meminimalisir kehilangan data kertas karena rekap dilakukan secara digital.

## 2. Ketercapaian Milestone (M1 s.d. M3)

| Milestone | Deliverable | Status (Selesai / Sebagian) | Catatan / Bukti |
|:----------|:------------|:----------------------------|:----------------|
| M1: Kebutuhan | Dokumen kebutuhan + User Flow | Selesai | File di `tugas-4/dokumen-kebutuhan.md` |
| M2: UI/UX | Wireframe + Navigasi | Selesai | Wireframe di `tugas-5/` dan navigasi di `tugas-6/form-interaksi.dart` |
| M3: MVP Awal | Model data + CRUD lokal | Selesai | File `tugas-7/crud-lokal.dart` |

## 3. Matriks Kebutuhan ke Implementasi

| ID Kebutuhan | Deskripsi Kebutuhan | Prioritas MoSCoW | Halaman Pemenuh | Operasi Data Terkait |
|:-------------|:-------------------|:----------------:|:----------------|:---------------------|
| F-01 | Melihat daftar kegiatan | Must | Halaman Daftar Kegiatan | Read |
| F-02 | Melakukan check-in | Must | Form Check-in / Detail | Create |
| F-05 | Panitia buka/tutup sesi | Must | Halaman Utama (Menu) | Update |
| F-07 | Hapus kegiatan batal | Should | Halaman Utama (Menu) | Delete |

## 4. Tangkapan Layar Aplikasi Berjalan
*(Catatan: Anda harus menempelkan/melampirkan gambar screenshot yang sudah Anda ambil di Tugas 7 ke dalam file Markdown ini. Formatnya: `![Daftar](screenshot-daftar.png)` dll)*

1. `screenshot-daftar.png`: Halaman utama menampilkan daftar kegiatan yang sudah ditambahkan.
2. `screenshot-form.png`: Halaman form pengisian data kegiatan (bisa pakai screenshot Tugas 6).
3. `screenshot-hapus.png`: Dialog konfirmasi saat akan menghapus kegiatan.

## 5. Kendala dan Solusi Teknis

| No. | Kendala | Cara Mengatasinya |
|:---:|:--------|:-------------------|
| 1 | Terjadi `RenderFlex overflow` saat menaruh ListView di dalam Column. | Membungkus widget `ListView` dengan `Expanded` agar mengambil sisa ruang yang tersedia. |
| 2 | Data tidak muncul di layar setelah ditambahkan dari form. | Menambahkan fungsi `setState()` di sekitar proses `_daftar.add()` agar UI diperbarui. |

## 6. Rencana Pengembangan Milestone M5 (REST API)
Pada minggu ke-9, aplikasi akan dihubungkan ke backend Sistem Informasi menggunakan REST API. Data kegiatan dan status absensi tidak lagi disimpan di memori lokal, melainkan diambil secara *real-time* dari database kampus menggunakan HTTP Request (JSON) dan package `http`. Ini memungkinkan anggota dan panitia melihat data yang sama secara sinkron.

## 7. Refleksi Pembelajaran Tengah Semester
Memahami arsitektur Flutter dari widget tree hingga pengelolaan state (setState) merupakan tantangan tersendiri, terutama dalam memastikan UI selalu sinkron dengan data terbaru. Saya belajar bahwa pemilihan widget yang tepat (seperti Expanded) sangat krusial untuk mencegah error layout. Membangun aplikasi mobile mengajarkan saya bahwa perencanaan desain (wireframe) dan struktur data (model) di awal akan sangat mempermudah proses coding di tahap akhir.

## 8. Deklarasi Penggunaan AI
Deklarasi penggunaan AI: AI coding assistant — membantu menyusun struktur peta routes, logika CRUD, dan penanganan layout UI; seluruh alur dan kode ditinjau ulang, dipahami, dan diverifikasi oleh penulis.