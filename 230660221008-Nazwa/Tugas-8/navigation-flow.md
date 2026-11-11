# Navigation Flow - Pengaduan Fasilitas Kampus

## 1. Daftar Route
| Nama Route | Layar / Halaman | Kebutuhan yang Dipenuhi | Keterangan |
|:-----------|:----------------|:------------------------|:-----------|
| `/` | Halaman Utama (Daftar Laporan) | F-01, F-03 | `initialRoute` (Titik Masuk Utama) |
| `/form` | Halaman Form Pengaduan | F-02 | Form Tambah Laporan Baru |
| `/detail` | Halaman Detail Laporan | F-04, F-05 | Detail Laporan & Ubah Status (Read-Only) |

## 2. Diagram Navigation Flow

```mermaid
flowchart TD
    D["Halaman Utama<br>(/ — F-01, F-03)"] -->|"Tekan FAB 'Buat Laporan'<br>Navigator.pushNamed('/form')"| F["Halaman Form Pengaduan<br>(/form — F-02)"]
    F -->|"Validasi Sukses → SnackBar → Navigator.pop()"| D
    D -->|"Ketuk Kartu Laporan + arguments<br>Navigator.pushNamed('/detail')"| T["Halaman Detail Laporan<br>(/detail — F-04, F-05)"]
    T -->|"Tekan Tombol Kembali<br>Navigator.pop()"| D