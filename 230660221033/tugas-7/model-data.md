# Model Data — CeriaReads
**Nama:** Yelly Ambarwaty  
**NIM:** 230660221033  

## 1. Daftar Entitas
| Entitas | Field | Tipe Data | Kebutuhan (ID) |
|:---|:---|:---|:---|
| **DataPengajuan** | `id` | String | F-01, F-02, F-03 |
| | `judulBuku` | String | F-01, F-02 |
| | `namaPeminjam` | String | F-02 |
| | `durasiHari` | int | F-02 |
| | `status` | String | F-03 |

## 2. Sumber Nilai
*   **id**: Dihasilkan secara otomatis oleh sistem (menggunakan `DateTime.now().millisecondsSinceEpoch.toString()`) sebagai kunci unik operasi *update* dan *delete*.
*   **judulBuku**, **namaPeminjam**, **durasiHari**: Berasal langsung dari input form (Create / Update) pengguna.
*   **status**: Diisi nilai bawaan sistem ("Menunggu") saat dibuat, dan dapat diubah (Update) menjadi "Disetujui" atau "Ditolak".