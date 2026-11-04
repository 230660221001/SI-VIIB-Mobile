# Navigation Flow — CeriaReads
**Nama:** Yelly Ambarwaty  
**NIM:** 230660221033  

## 1. Daftar Route
| Nama Route | Layar | Kebutuhan yang Dipenuhi | initialRoute |
|:---|:---|:---|:---|
| `/` | Halaman Utama (Katalog) | F-01 (Melihat katalog buku) | Ya |
| `/detail` | Halaman Detail Buku | F-03 (Cek status dan info buku) | Tidak |
| `/form` | Halaman Form Pengajuan | F-02 (Mengajukan peminjaman) | Tidak |

## 2. Alasan Pemilihan `initialRoute`
Route `/` (Halaman Katalog) ditetapkan sebagai `initialRoute` karena memenuhi kebutuhan *Must have* utama pengguna (F-01), di mana anggota komunitas perlu langsung melihat ketersediaan stok buku sesaat setelah aplikasi dibuka tanpa harus melewati langkah tambahan.

## 3. Diagram Alur (Navigation Flow)
```mermaid
flowchart TD
    A["Halaman Utama Katalog<br>(/ — F-01)"] -->|"Ketuk kartu buku + arguments"| B["Halaman Detail Buku<br>(/detail — F-03)"]
    B -->|"Tombol 'Ajukan Peminjaman'<br>(pushNamed /form)"| C["Form Pengajuan Pinjam<br>(/form — F-02)"]
    C -->|"Kirim tidak valid"| C
    C -->|"Kirim valid (SnackBar tampil)"| D["Kembali ke Halaman Detail<br>(pop)"]
    D -->|"Tombol 'Kembali'<br>(pop)"| A