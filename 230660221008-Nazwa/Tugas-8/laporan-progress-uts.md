
---

# Laporan Progress Project UTS (Milestone M4)

**Mata Kuliah:** Pemrograman Aplikasi Bergerak

**Berkas:** `tugas-8/laporan-progress-uts.md`

---

## 1. Identitas & Ringkasan Project

* **Nama / NIM:** Nazwa Umaira Nanindia Ramdhani / 230660221008
* **Kelas:** SI-VIIB


* **Domain Sistem Informasi:** Pengaduan Fasilitas Kampus


* **Judul Aplikasi:** Mobile Campus Facility Complaint System (Aplikasi Pengaduan Fasilitas Kampus)
* **Ringkasan Problem & Solusi:**
Proses pelaporan fasilitas kampus yang rusak (seperti AC, proyektor, kursi kelas, atau fasilitas toilet) sebelumnya dilakukan secara manual atau lisan sehingga sering kali tidak terdata dengan baik dan status tindak lanjut perbaikannya sulit dipantau oleh mahasiswa. Aplikasi berbasis Flutter ini hadir sebagai solusi bagi civitas akademika untuk melaporkan kerusakan fasilitas secara praktis melalui ponsel, melakukan validasi kelengkapan laporan, serta memantau status penanganan laporan (Menunggu, Diproses, Selesai) secara transparan.



---

## 2. Status Milestone (M1 – M3)

| Milestone | Keluaran / Tugas | Target Pertemuan | Status | Evaluasi & Ringkasan Hasil |
| --- | --- | --- | --- | --- |
| **M1: Analisis Kebutuhan** | Dokumen Kebutuhan & User Flow (Tugas 4)

 | Pertemuan 4

 | `Selesai`

 | User persona (mahasiswa & petugas sarpras), 6 kebutuhan fungsional pengaduan (F-01 s.d. F-06), 2 non-fungsional, matriks MoSCoW, dan diagram alur user flow.

 |
| **M2: UI/UX & Navigasi** | Wireframe, Layout & Navigation Flow (Tugas 5 & 6)

 | Pertemuan 5–6

 | `Selesai`

 | Komposisi layout Flutter (`Scaffold`, `Column`, `ListView`), peta route bernama (`Navigator.pushNamed`), Form validation kelengkapan pengaduan, dan feedback `SnackBar`.

 |
| **M3: Implementasi Mobile Awal** | MVP Data Lokal & CRUD (Tugas 7)

 | Pertemuan 7

 | `Selesai`

 | Model data `Pengaduan` dengan field `id` unik, manajemen state (`StatefulWidget` & `setState`), serta fungsi CRUD lokal (Create pengaduan, Read daftar, Update status, Delete pengaduan).

 |

---

## 3. Matriks Kebutuhan ke Antarmuka & Operasi CRUD

| ID Kebutuhan | Rumusan Kebutuhan Fungsional | Prioritas | Halaman Pemenuh | Operasi CRUD Lokal | Status Fitur |
| --- | --- | --- | --- | --- | --- |
| **F-01** | Mahasiswa dapat mengisi dan mengirimkan formulir laporan pengaduan fasilitas

 | Must

 | Halaman Form (`/form`)

 | **Create** (`add`)

 | `Aktif` |
| **F-02** | Mahasiswa dapat melihat daftar riwayat laporan pengaduan beserta status penanganannya

 | Must

 | Halaman Utama (`/`)

 | **Read** (`ListView.builder`)

 | `Aktif` |
| **F-03** | Mahasiswa/Petugas dapat mengubah status penanganan atau memperbarui rincian pengaduan

 | Must

 | Halaman Form / Detail

 | **Update** (`indexWhere`)

 | `Aktif` |
| **F-04** | Mahasiswa/Petugas dapat menghapus data laporan pengaduan setelah konfirmasi

 | Must

 | Halaman Utama / Detail

 | **Delete** (`removeWhere`)

 | `Aktif` |
| **F-05** | Mahasiswa dapat melihat rincian detail dari satu laporan pengaduan fasilitas

 | Should

 | Halaman Detail (`/detail`)

 | **Read** (via `arguments`)

 | `Aktif` |
| **F-06** | Mahasiswa dapat menyaring data pengaduan berdasarkan kata kunci atau lokasi fasilitas

 | Could

 | Halaman Utama (`/`)

 | **Read** (`where`)

 | `Aktif` |

---

## 4. Dokumentasi Tangkapan Layar Aplikasi

1. **Halaman Utama & Daftar Pengaduan (`screenshot-daftar.png`):**

*Keterangan:* Menampilkan daftar laporan pengaduan fasilitas dalam bentuk `Card` dan `ListTile` yang dilengkapi badge status penanganan (Menunggu / Diproses / Selesai) menggunakan `ListView.builder`.


2. **Formulir Laporan & Validasi Input (`screenshot-form.png`):**

*Keterangan:* Menampilkan formulir input pengaduan (lokasi fasilitas, jenis kerusakan, deskripsi) dengan `Form` dan `TextFormField`. Mengaktifkan validasi input wajib serta memberikan feedback `SnackBar` saat laporan berhasil dikirim.


3. **Dialog Konfirmasi Hapus Pengaduan (`screenshot-hapus.png`):**

*Keterangan:* Menampilkan modal dialog `AlertDialog` saat tombol batal/hapus ditekan untuk mengonfirmasi eksekusi `removeWhere` pada list data pengaduan.



---

## 5. Kendala Teknis & Solusi

1. **Kendala 1 (RenderFlex Overflowed pada Daftar Pengaduan):**
* *Masalah:* Terjadi error *overflow* vertikal ketika `ListView.builder` daftar pengaduan dimasukkan ke dalam `Column` bersama widget `TextField` pencarian lokasi[cite: 28, 32].
* *Solusi:* Membungkus `ListView.builder` menggunakan widget `Expanded` agar mengambil sisa ruang layar secara fleksibel[cite: 28, 32].


2. **Kendala 2 (Status Pengaduan Tidak Memperbarui Tampilan UI):**
* *Masalah:* Operasi perubahan status pengaduan fasilitas berhasil mengubah nilai objek `Pengaduan` secara internal, namun warna badge dan teks status di layar tidak langsung berubah.


* *Solusi:* Membungkus kode penggantian objek data di dalam pemanggilan `setState(() { ... })` agar framework memicu *re-build* pada `StatefulWidget`.





---

## 6. Rencana Milestone M5 (REST API) & Refleksi Pembelajaran

### Rencana Integrasi REST API (Minggu 9–10)

1. **Migrasi Storage:** Mengganti penyimpanan `List<Pengaduan>` lokal (in-memory) dengan pengiriman HTTP request menggunakan package `http` ke server backend sarpras kampus.


2. **Serialisasi Data JSON:** Mengimplementasikan fungsi `fromJson()` dan `toJson()` pada class model `Pengaduan` untuk mengolah payload data laporan dari REST API.


3. **Penanganan Asinkron & Error Handling:** Menggunakan `FutureBuilder` atau `async/await` untuk memuat daftar pengaduan dari server serta menangani kondisi *loading*, koneksi terputus, dan error status HTTP.



### Refleksi Pembelajaran

Pengerjaan project aplikasi pengaduan fasilitas kampus dari M1 hingga M3 memberikan pengalaman penting mengenai alur penerjemahan kebutuhan pengguna ke dalam kode nyata. Hambatan utama yang dirasakan adalah memastikan struktur data model `Pengaduan` dapat mengakomodasi perubahan status secara konsisten pada antarmuka. Pembelajaran ini membentuk pemahaman yang kuat bahwa aplikasi bergerak yang baik tidak hanya berfokus pada estetika UI, melainkan pada keandalan pengelolaan state dan alur interaksi pengguna.

---

## 7. Deklarasi Penggunaan AI

Deklarasi penggunaan AI: **Gemini (Google AI)** — Membantu menyusun draf struktur laporan Markdown, menyelaraskan pemetaan kebutuhan ke fungsi CRUD pengaduan fasilitas, serta konsultasi perbaikan layout Flutter; seluruh logika aplikasi, penulisan kode utama, dan penyempurnaan isi laporan dikerjakan secara mandiri oleh penulis.

---