# Tugas 4 — Dokumen Kebutuhan dan User Flow

**Nama:** Dian Erwin  
**NIM:** 230660221022  
**Kelas:** SI-VIIA  
**Domain SI:** Laboratorium Komputer MAS Darussalam Sumedang — Pelaporan Kerusakan Perangkat  

---

## 1. Deskripsi Aplikasi
Aplikasi *Monitoring* Lab Komputer MAS Darussalam adalah solusi berbasis *mobile* untuk mendata kondisi dan memfasilitasi pelaporan kerusakan PC di laboratorium. Masalah utama yang dihadapi saat ini adalah keterlambatan informasi PC rusak yang menyebabkan praktikum terganggu karena siswa sering lupa melaporkannya secara manual ke ruang guru. Solusi ini diwujudkan dalam bentuk aplikasi *mobile* karena pelaporan dapat dilakukan seketika di lokasi kejadian (konteks bergerak) menggunakan perangkat *smartphone*, memanfaatkan fitur kamera untuk melampirkan bukti fisik kerusakan secara *real-time*.

---

## 2. User Persona

### Persona 1 — Dandi — Siswa Pelapor
| Komponen | Isi |
|---|---|
| Nama dan peran | Dandi — Siswa Peminjam/Pelapor |
| Tujuan | Melaporkan PC yang *error* atau rusak dengan cepat agar segera ditindaklanjuti. |
| Kendala | Waktu perpindahan jam pelajaran sempit; enggan berjalan jauh ke ruang guru. |
| Perangkat dan konteks | *Smartphone* Android (Infinix), dipakai langsung di meja lab tempat PC rusak berada. |
| Frekuensi penggunaan | 1–3 kali dalam sebulan (tergantung temuan kerusakan). |

### Persona 2 — Pak Dede — Guru/Teknisi Lab
| Komponen | Isi |
|---|---|
| Nama dan peran | Pak Dede — Guru TIK / Pengelola Lab |
| Tujuan | Menerima rekapitulasi laporan kerusakan PC dan memperbarui status perbaikannya. |
| Kendala | Kesulitan mengidentifikasi tingkat kerusakan jika hanya berupa laporan lisan dari siswa. |
| Perangkat dan konteks | *Smartphone* Android/iPhone, dipakai kapan saja saat menerima notifikasi perbaikan. |
| Frekuensi penggunaan | 1–2 kali setiap hari kerja. |

---

## 3. Kebutuhan Fungsional
| ID | Rumusan Kebutuhan | Terkait Persona |
|---|---|---|
| F-01 | Siswa dapat melihat daftar seluruh PC lab beserta status ketersediaannya pada halaman utama. | Persona 1 |
| F-02 | Siswa dapat mengisi form laporan kerusakan dengan memilih kode PC dan mendeskripsikan kendala. | Persona 1 |
| F-03 | Siswa dapat mengambil foto menggunakan kamera perangkat dan melampirkannya pada form laporan. | Persona 1 |
| F-04 | Siswa dapat melihat riwayat laporan yang pernah ia buat beserta status tindak lanjutnya. | Persona 1 |
| F-05 | Guru Lab dapat melihat daftar seluruh laporan kerusakan yang masuk dari siswa. | Persona 2 |
| F-06 | Guru Lab dapat mengubah status PC (misal: dari "Rusak" menjadi "Siap Pakai") setelah diperbaiki. | Persona 2 |
| F-07 | Guru Lab dapat menambah data master perangkat PC baru ke dalam sistem. | Persona 2 |

---

## 4. Kebutuhan Nonfungsional
| ID | Kategori | Rumusan | Kriteria Terukur |
|---|---|---|---|
| NF-01 | Kegunaan | Proses pelaporan kerusakan oleh siswa harus efisien. | Selesai maksimal dalam 4 langkah (Pilih PC > Klik Lapor > Foto > Kirim). |
| NF-02 | Kinerja | Waktu muat daftar PC pada halaman utama. | Daftar tampil kurang dari 3 detik pada koneksi internet sekolah. |

---

## 5. Prioritas Fitur (MoSCoW)
| Prioritas | ID Kebutuhan | Alasan |
|---|---|---|
| **Must have** | F-01, F-02, F-05, F-06 | Empat fitur ini adalah alur inti operasional. Tanpa daftar PC, pelaporan, dan penerimaan laporan, tujuan sistem tidak tercapai. |
| **Should have** | F-03, F-04 | Lampiran foto sangat penting bagi teknisi, tetapi pelaporan teks (F-02) masih bisa berjalan tanpa foto. Riwayat siswa penting untuk transparansi. |
| **Could have** | F-07 | Penambahan master data perangkat jarang dilakukan. Sementara bisa ditangani dari sistem *backend/database* langsung. |
| **Won't have (saat ini)** | - | Semua fitur di atas masih relevan dalam cakupan proyek 1 semester. |

---

## 6. Pemetaan Kebutuhan ke Antarmuka
| ID Kebutuhan | Rumusan (ringkas) | Prioritas | Halaman yang Memenuhi | Widget yang Direncanakan (P3) |
|---|---|---|---|---|
| F-01 | Melihat daftar PC | Must | Halaman Utama (Daftar PC) | `Scaffold` + `ListView.builder` + `ListTile` |
| F-02 | Mengisi form laporan | Must | Halaman Form Pelaporan | `Scaffold` + `Column` + `Padding` |
| F-03 | Melampirkan foto laporan | Should | Halaman Form Pelaporan | `Row` + `IconButton` (Kamera) |
| F-04 | Melihat riwayat pelaporan | Should | Halaman Riwayat Laporan | `ListView.builder` + `Card` |
| F-05 | Melihat daftar laporan masuk | Must | Dashboard Guru Lab | `Scaffold` + `ListView.builder` + `ListTile` |
| F-06 | Mengubah status PC | Must | Halaman Detail Laporan | `Column` + `ElevatedButton` |
| F-07 | Menambah master PC baru | Could | Halaman Tambah PC | `Scaffold` + `Column` (Form input) |

---
*Deklarasi penggunaan AI: AI Assistant digunakan untuk menata dan merumuskan pola kalimat Aktor-Aksi-Hasil pada Kebutuhan Fungsional.*
