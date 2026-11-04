# Laporan Progress Project UTS (Milestone M4)

| | |
|:--|:--|
| **Nama** | Dian Erwin |
| **NIM** | 230660221022 |
| **Kelas** | SI-VIIA |
| **Domain SI** | Layanan Pemantauan Laboratorium Komputer |
| **Judul Aplikasi** | Lab PC Monitor |
| **Tautan Repository** | [URL folder tugas-8 di GitHub] |

---

## 1. Ringkasan Eksekutif Project
Aplikasi "Lab PC Monitor" dirancang untuk menyelesaikan masalah lambatnya pelaporan kerusakan perangkat komputer oleh pengguna laboratorium. Dengan aplikasi ini, mahasiswa, asisten lab, dan dosen dapat melaporkan kendala PC secara langsung (misal: keyboard rusak, PC mati) dan melihat status perbaikannya. Solusi *mobile* dipilih agar pelapor dapat dengan mudah mengirim laporan secara *real-time* langsung dari bangku lab tempat mereka menemukan kendala.

## 2. Ketercapaian Milestone (M1 s.d. M3)
| Milestone | Deliverable | Status (Selesai / Sebagian) | Catatan / Bukti |
|:----------|:------------|:----------------------------|:----------------|
| M1: Kebutuhan | Dokumen kebutuhan + User Flow | Selesai | File `kebutuhan.md` di Tugas 4 |
| M2: UI/UX | Wireframe + Navigasi | Selesai | File prototype & navigasi di Tugas 5 & 6 |
| M3: MVP Awal | Model data + CRUD lokal | Selesai | File `crud-lokal.dart` di Tugas 7 |

## 3. Matriks Kebutuhan ke Implementasi
| ID Kebutuhan | Deskripsi Kebutuhan | Prioritas MoSCoW | Halaman Pemenuh | Operasi Data Terkait |
|:-------------|:-------------------|:----------------:|:----------------|:---------------------|
| F-02 | Melaporkan kendala PC baru | Must | Form Pelaporan | Create |
| F-01 | Melihat daftar seluruh laporan PC | Must | Halaman Utama | Read |
| F-06 | Menandai laporan PC sebagai Selesai | Must | Halaman Utama | Update |
| F-07 | Menghapus laporan yang keliru dibuat | Could | Halaman Utama (Dialog) | Delete |

## 4. Tangkapan Layar Aplikasi Berjalan
*(Catatan Pengumpulan: Pastikan Anda melampirkan screenshot `screenshot-daftar.png` dan `screenshot-hapus.png` dari Tugas 7 ke dalam folder ini, lalu tautkan namanya di bawah).*
- `screenshot-daftar.png` (Bukti fungsi halaman utama dan penambahan form)
- `screenshot-hapus.png` (Bukti dialog konfirmasi aksi)

## 5. Kendala dan Solusi Teknis
1. **Pembaruan State Antar-Halaman:** Saat menambah data dari form, halaman daftar awalnya tidak mau me-render data baru. **Solusi:** Saya mempelajari bahwa navigasi form harus dilempar dengan `Navigator.pop(context, data)` lalu ditangkap dengan `await` pada navigasi push, dan proses penambahannya dibungkus dengan `setState()`.
2. **Error Index pada saat menghapus data:** Mencoba menggunakan indeks urutan untuk memperbarui dan menghapus data menyebabkan salah sasaran jika posisi berubah. **Solusi:** Saya memodifikasi model agar memiliki properti `id` (menggunakan millisecondsEpoch) dan menggunakan metode `indexWhere` serta `removeWhere`.

## 6. Rencana Pengembangan Milestone M5 (REST API)
Pada pertemuan ke-9 nanti, data in-memory lokal ini akan digantikan dengan data yang ditarik dari Server/REST API. Aplikasi butuh layanan *backend* (API Endpoint) yang bisa menerima permintaan HTTP GET untuk memuat daftar laporan kendala dari basis data terpusat, dan HTTP POST/PUT agar laporan yang disubmit bisa disimpan di server secara riil.

## 7. Refleksi Pembelajaran Tengah Semester
Memahami pengembangan mobile berbasis Flutter mengajarkan saya betapa pentingnya konsep sinkronisasi antara *state* dan tampilan (UI). Pendekatan *declarative UI* membuat kita harus berpikir berorientasi pada data model: setiap perubahan layar diinisiasi oleh mutasi data. Tantangan terbesarnya adalah membiasakan diri dengan struktur *widget tree* yang berlapis (nested), namun jika dikelola dengan *refactoring* yang baik, pembuatan aplikasi mobile dapat dilakukan dengan sangat cepat dan fleksibel.

---
**Deklarasi penggunaan AI:** AI Assistant digunakan untuk menelaah pesan *error* terkait `unbounded height` saat masa uji coba layout UI sebelumnya, serta membantu menstrukturkan argumen teknis pada dokumen laporan ini. Seluruh logika CRUD, kode aplikasi, dan penjelasan tes telah diuji, dipahami, dan diverifikasi kebenarannya oleh penulis.
