@'
# Dokumen Kebutuhan dan User Flow — Travel Booking App

---

## 1. Deskripsi Aplikasi

**Travel Booking App** adalah aplikasi mobile layanan reservasi dan pemesanan paket pariwisata yang dirancang untuk mengatasi kendala proses pemesanan manual, ketidakpastian status ketersediaan kuota, serta sulitnya konfirmasi pembayaran secara cepat. Aplikasi ini dibangun berbasis *mobile* untuk memberikan fleksibilitas bagi wisatawan dalam mencari, memesan, serta memantau status reservasi paket perjalanan kapan saja dan di mana saja langsung dari genggaman tanpa harus datang ke kantor agen travel.

---

## 2. User Persona

### Persona 1 — Wisatawan / Pelanggan

| Komponen | Isi |
|:---------|:----|
| **Nama dan peran** | Rian — Wisatawan (Pelanggan) |
| **Tujuan** | Mencari paket wisata hemat dan melakukan reservasi tour secara praktis |
| **Kendala** | Waktu kerja padat dan sering kehabisan kuota paket tour karena informasi terlambat |
| **Perangkat dan konteks** | Smartphone Android; diakses di sela waktu istirahat atau malam hari |
| **Frekuensi penggunaan** | 1–2 kali per bulan |

### Persona 2 — Agen / Admin Travel

| Komponen | Isi |
|:---------|:----|
| **Nama dan peran** | Siska — Admin Layanan Travel |
| **Tujuan** | Memverifikasi pesanan masuk dan memperbarui status ketersediaan paket tour |
| **Kendala** | Pencatatan pesanan manual memicu risiko bentrokan jadwal dan kesalahan data |
| **Perangkat dan konteks** | Smartphone/Tablet; diakses saat jam operasional kantor |
| **Frekuensi penggunaan** | Setiap hari kerja |

---

## 3. Kebutuhan Fungsional

| ID | Rumusan Kebutuhan | Terkait Persona |
|:---|:------------------|:----------------|
| **F-01** | Pelanggan dapat melihat daftar paket wisata yang tersedia beserta detail harga dan status kuota | Rian |
| **F-02** | Pelanggan dapat melakukan formulir pemesanan paket wisata dengan memilih tanggal keberangkatan dan jumlah peserta | Rian |
| **F-03** | Pelanggan dapat melihat status pemesanan (menunggu konfirmasi, disetujui, atau ditolak) | Rian |
| **F-04** | Admin dapat memperbarui status ketersediaan paket wisata (Tersedia / Penuh) | Siska |
| **F-05** | Admin dapat menyetujui atau menolak pengajuan pemesanan paket wisata dari pelanggan | Siska |
| **F-06** | Pelanggan dapat mencari paket wisata berdasarkan nama destinasi | Rian |

---

## 4. Kebutuhan Nonfungsional

| ID | Kategori | Rumusan | Kriteria Terukur |
|:---|:---------|:--------|:-----------------|
| **NF-01** | Kegunaan (*Usability*) | Proses pemesanan paket wisata dari halaman utama hingga konfirmasi harus cepat dan tidak berbelit | Alur pemesanan selesai maksimal dalam 5 langkah |
| **NF-02** | Kinerja (*Performance*) | Katalog paket wisata harus dapat dimuat dengan responsif | Daftar paket wisata tampil kurang dari 3 detik pada jaringan internet standar |

---

## 5. Prioritas Fitur (MoSCoW)

| Prioritas | ID Kebutuhan | Alasan |
|:----------|:-------------|:-------|
| **Must have** | F-01, F-02, F-03, F-04, F-05 | Fitur utama agar alur pencarian, pemesanan, dan konfirmasi reservasi dapat berjalan |
| **Should have** | F-06 | Memudahkan pengguna mencari destinasi secara spesifik, namun reservasi tetap berjalan tanpa fitur ini |
| **Could have** | — | Belum dialokasikan pada fase ini |
| **Won't have (saat ini)** | Pengolahan Pembayaran Online Gateway | Ditunda sementara karena verifikasi pembayaran masih menggunakan metode transfer manual pada fase awal ini |

---

## 6. Pemetaan Kebutuhan ke Antarmuka

| ID Kebutuhan | Rumusan (ringkas) | Prioritas | Halaman yang Memenuhi | Widget yang Direncanakan (P3) |
|:-------------|:------------------|:----------|:----------------------------|:------------------------------|
| **F-01** | Melihat daftar paket wisata | Must | Halaman Katalog Utama | `ListView.builder` + `Card` + `Row` |
| **F-02** | Mengisi formulir pemesanan | Must | Halaman Form Reservasi | `Scaffold` + `Column` + `Padding` |
| **F-03** | Melihat status pemesanan | Must | Halaman Riwayat Pemesanan | `ListView.builder` + `ListTile` |
| **F-04** | Kelola ketersediaan paket | Must | Halaman Dashboard Admin | `ListView.builder` + `Container` badge status |
| **F-05** | Menyetujui/menolak pesanan | Must | Halaman Verifikasi Admin | `Card` + `Row` (tombol aksi) |
| **F-06** | Pencarian nama destinasi | Should | Halaman Katalog Utama | `Column` + `TextField` pencarian |

---

## 7. Diagram User Flow

```mermaid
flowchart TD
    S(["Mulai: Pelanggan membuka aplikasi"]) --> A["Halaman Utama: Katalog Paket Wisata"]
    A --> B["Pilih Paket Tour"]
    B --> C["Form Reservasi: Isi Tanggal & Jumlah Peserta"]
    C --> D{"Data Form Valid?"}
    D -- "Tidak" --> E["Tampilkan Pesan Error / Lakukan Pengisian Ulang"]
    E --> C
    D -- "Ya" --> F["Kirim Pengajuan Pemesanan"]
    F --> G{"Kuota Masih Tersedia?"}
    G -- "Tidak" --> H["Tampilkan Notifikasi Kuota Penuh"]
    H --> A
    G -- "Ya" --> I["Konfirmasi Pemesanan Berhasil (Status: Menunggu)"]
    I --> T(["Tujuan Tercapai: Pesanan Tercatat di Riwayat"])