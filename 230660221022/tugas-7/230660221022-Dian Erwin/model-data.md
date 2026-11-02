# Model Data: Lab PC Monitor

## Daftar Entitas
Fokus pengembangan MVP pada tahap ini adalah pengelolaan entitas laporan kerusakan (kendala) PC.

| Entitas | Field | Tipe Data | Kebutuhan yang Dipenuhi |
|---|---|---|---|
| **DataLaporan** | `id` | String | Kunci unik operasi Update dan Delete (F-06). |
| | `kodePC` | String | Menentukan PC mana yang dilaporkan bermasalah (F-02, F-05). |
| | `kendala` | String | Deskripsi kerusakan atau keluhan perangkat (F-02, F-05). |
| | `tanggal` | String | Waktu laporan diajukan untuk riwayat pelacakan (F-04). |
| | `status` | String | Status penanganan laporan, misal: 'Menunggu' atau 'Selesai' (F-03, F-06). |

## Sumber Nilai
- **`id`**: Diisi secara otomatis oleh sistem menggunakan fungsi penanda waktu (`DateTime.now().millisecondsSinceEpoch`) ketika laporan dikirim, sehingga dijamin unik.
- **`kodePC`**: Diisi oleh pengguna melalui form input teks (Pertemuan 6).
- **`kendala`**: Diisi oleh pengguna melalui form deskripsi (Pertemuan 6).
- **`tanggal`**: Didapatkan otomatis dari sistem lokal perangkat berdasarkan waktu saat formulir disubmit.
- **`status`**: Bernilai *default* "Menunggu" dari sistem saat di-Create, lalu diperbarui secara manual oleh laboran (Update) menjadi "Selesai".
