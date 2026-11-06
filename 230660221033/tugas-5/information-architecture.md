# Information Architecture (IA) — CeriaReads
**Nama:** Yelly Ambarwaty  
**NIM:** 230660221033  
**Domain SI:** Sistem Informasi Komunitas Panti Baca Ceria  

---

## 1. Inventaris Layar
Inventaris layar disusun berdasarkan pemetaan kebutuhan fungsional (F-01 s.d. F-06) pada Tugas 4:

| Nama Layar | Peran / Aktor | Kebutuhan yang Dipenuhi | Deskripsi Singkat |
|:---|:---|:---|:---|
| **Halaman Utama (Katalog)** | Anggota & Relawan | F-01 | Menampilkan banner statistik, kolom pencarian, filter kategori, dan daftar koleksi buku beserta stoknya. |
| **Halaman Detail & Pengajuan** | Anggota | F-02 | Menampilkan sinopsis lengkap, lokasi rak, dan formulir konfirmasi pengajuan peminjaman. |
| **Halaman Riwayat Peminjaman** | Anggota | F-03 | Menampilkan daftar buku yang sedang dipinjam dan opsi pembatalan pengajuan. |
| **Halaman Dasbor Relawan** | Relawan | F-04, F-05, F-06 | Menampilkan daftar antrean pengajuan pinjam (setuju/tolak) dan daftar pengembalian buku. |

---

## 2. Diagram Information Architecture

```mermaid
flowchart TD
    App["📱 Aplikasi CeriaReads"] --> MainScreen["🏠 Halaman Utama (Katalog)<br>[F-01]"]
    
    MainScreen --> DetailScreen["📖 Halaman Detail & Pengajuan<br>[F-02]"]
    MainScreen --> HistoryScreen["📋 Halaman Riwayat Peminjaman<br>[F-03]"]
    MainScreen --> AdminDashboard["🛠️ Halaman Dasbor Relawan<br>[F-04, F-05, F-06]"]
    
    DetailScreen --> ConfirmModal["✅ Modal Konfirmasi Pinjam"]
    AdminDashboard --> ApproveAction["✔️ Setujui / Penolakan Pengajuan"]
    AdminDashboard --> ReturnAction["🔄 Catat Pengembalian Buku"]