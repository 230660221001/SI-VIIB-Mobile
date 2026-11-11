# Model Data — Akademik PKBM Al Qosimmiyah

## 1. Daftar Entitas

Aplikasi Akademik PKBM Al Qosimmiyah menggunakan satu entitas utama, yaitu `CatatanBelajar`. Entitas ini digunakan untuk menyimpan informasi catatan pembelajaran yang dibuat dan dikelola oleh Warga Belajar. Selain itu, entitas ini memiliki fitur sematkan (Pin) untuk memprioritaskan catatan penting agar selalu ditampilkan di bagian atas daftar.

| Entitas | Field | Tipe Data | Kebutuhan yang Dipenuhi |
|---|---|---|---|
| CatatanBelajar | `id` | int | Mendukung identifikasi unik dan pengelolaan catatan. |
| CatatanBelajar | `judul` | String | Mendukung penambahan dan pengubahan judul catatan. |
| CatatanBelajar | `isi` | String | Mendukung penambahan dan pengubahan isi catatan. |
| CatatanBelajar | `diperbarui` | DateTime | Menyimpan informasi waktu catatan dibuat atau terakhir diperbarui. |
| CatatanBelajar | `disematkan` | bool | Menentukan apakah catatan disematkan agar ditampilkan di bagian atas daftar. |

**Keterangan:**
- `int` digunakan untuk menyimpan data berupa bilangan bulat.
- `String` digunakan untuk menyimpan data berbentuk teks.
- `DateTime` digunakan untuk menyimpan tanggal dan waktu catatan dibuat atau diperbarui.
- `bool` digunakan untuk menyimpan nilai logika `true` atau `false`.
- `id` digunakan sebagai identitas unik setiap catatan untuk proses pengubahan dan penghapusan data.
- `disematkan` bernilai `true` jika catatan disematkan dan `false` jika tidak disematkan.

## 2. Sumber Nilai Data

Setiap field pada entitas `CatatanBelajar` memiliki sumber nilai yang berbeda, yaitu dari form Warga Belajar atau sistem aplikasi.

| Field | Sumber Nilai | Keterangan |
|---|---|---|
| `id` | Sistem | Dibuat secara otomatis ketika catatan baru ditambahkan dan digunakan sebagai identitas unik catatan. |
| `judul` | Form Warga Belajar | Diisi oleh Warga Belajar sesuai judul materi atau kegiatan pembelajaran. |
| `isi` | Form Warga Belajar | Diisi oleh Warga Belajar untuk menyimpan materi, ringkasan, atau informasi pembelajaran. |
| `diperbarui` | Sistem | Diisi secara otomatis berdasarkan waktu ketika catatan dibuat atau diperbarui. |
| `disematkan` | Sistem / Interaksi Warga Belajar | Diatur melalui tindakan sematkan atau lepas sematan pada catatan. Nilai awalnya adalah `false`. |