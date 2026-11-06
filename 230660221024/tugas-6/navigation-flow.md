# Navigation Flow — Aplikasi Absensi Organisasi Mahasiswa

## 1. Daftar Route

| Nama Route | Layar | Kebutuhan yang Dipenuhi | Keterangan |
|:--|:--|:--|:--|
| `/` | Halaman Daftar Kegiatan | F-01, F-02 | `initialRoute` (Layar Utama) |
| `/detail` | Detail Kegiatan | F-03 | Menerima arguments `DataKegiatan` |
| `/check-in` | Form Check-in Kehadiran | F-03 | Menerima arguments `DataKegiatan` |

## 2. Diagram Navigation Flow

```mermaid
flowchart TD
    A["Halaman Daftar Kegiatan<br/>(/ — F-01, F-02)"] -->|"Ketuk Kartu<br/>+ arguments"| B["Detail Kegiatan<br/>(/detail — F-03)"]
    B -->|"Tekan Tombol Check-in<br/>+ arguments"| C["Form Check-in<br/>(/check-in — F-03)"]
    
    C -->|"Kirim Validasi → SnackBar → pop"| B
    B -->|"Tombol Kembali → pop"| A