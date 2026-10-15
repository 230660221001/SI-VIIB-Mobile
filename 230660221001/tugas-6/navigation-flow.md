# Navigation Flow — Sistem Penjualan Beras BSM

## 1. Daftar Route

| Nama Route | Layar | Kebutuhan | Data yang Dikirim | Initial Route |
|:-----------|:------|:----------|:------------------|:--------------|
| `/` | Katalog Beras | F-01 | — | ✅ Ya |
| `/detail` | Detail Beras | F-02 | `DataBeras` (read-only) | — |
| `/form` | Form Pesanan | F-03 | — (form diisi pengguna) | — |

## 2. Diagram Navigation Flow

Alur utama: **Konsumen melihat katalog → memesan beras → mengirim pesanan.**

```mermaid
flowchart TD
    K["Katalog Beras<br>(/ — F-01)"] -->|"Tombol Pesan Sekarang"| F["Form Pesanan<br>(/form — F-03)"]
    F -->|"Kirim valid → SnackBar → pop"| K
    K -->|"Ketuk kartu + arguments"| D["Detail Beras<br>(/detail — F-02)"]
    D -->|"Kembali → pop"| K