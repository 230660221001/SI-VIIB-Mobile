# Model Data — RadiAct (UNSAP Radio)

Dokumen ini mendefinisikan struktur model data `DataJadwal` yang digunakan untuk mengelola sistem penjadwalan konten internal RadiAct berbasis data lokal (in-memory).

## 1. Daftar Entitas Data

Berikut adalah rincian *field* pada entitas utama **DataJadwal** beserta tipe data dan keterkaitannya dengan kebutuhan aplikasi:

| Entitas | Field | Tipe Data | Kebutuhan yang Dipenuhi |
| :--- | :--- | :--- | :--- |
| **DataJadwal** | `id` | `String` | **Teknis/CRUD** — Kunci unik pengenal data untuk operasi Update & Delete |
| **DataJadwal** | `judul` | `String` | **F-01** — Mengisi nama program atau judul siaran radio |
| **DataJadwal** | `divisi` | `String` | **F-01** — Menentukan divisi pengampu program (Edukasi, Redaksi, Entertain, dll.) |
| **DataJadwal** | `tanggal` | `String` | **F-01 & F-03** — Menetapkan tanggal pelaksanaan konten/penampilannya di daftar |
| **DataJadwal** | `status` | `String` | **F-02 & F-03** — Menampilkan dan mengubah status keterlaksanaan (Progres, Tayang, Terkendala) |
| **DataJadwal** | `catatan` | `String` | **F-01 & F-03** — Catatan tambahan mengenai progres atau kendala siaran |

## 2. Penjelasan Sumber Nilai (Origin)

Berikut adalah penjelasan asal sumber nilai untuk setiap *field* pada model `DataJadwal`:

1. **`id`** (`String`): 
   * **Sumber**: *Sistem (Perhitungan Timestamp)*.
   * **Penjelasan**: Dihasilkan secara otomatis oleh sistem saat form dikirim menggunakan fungsi `DateTime.now().millisecondsSinceEpoch.toString()`. Hal ini menjamin bahwa setiap data jadwal memiliki ID yang unik dan tidak akan bentrok dengan data lain saat proses pengubahan atau penghapusan.
2. **`judul`** (`String`): 
   * **Sumber**: *Form Input (Pengguna)*.
   * **Penjelasan**: Diisi secara manual oleh crew radio melalui `TextFormField` nama program siaran pada form tambah jadwal.
3. **`divisi`** (`String`): 
   * **Sumber**: *Form Input (Pengguna)*.
   * **Penjelasan**: Diisi secara manual oleh pengguna melalui `TextFormField` divisi pengampu siaran.
4. **`tanggal`** (`String`): 
   * **Sumber**: *Form Input (Pengguna)*.
   * **Penjelasan**: Diisi oleh pengguna melalui `TextFormField` tanggal siaran (contoh: "30 Oktober 2026").
5. **`status`** (`String`): 
   * **Sumber**: *Form Input / Default Sistem*.
   * **Penjelasan**: Dipilih oleh pengguna dari pilihan `DropdownButtonFormField` (pilihan: "Progres", "Tayang", "Terkendala") saat membuat data baru, atau diperbarui saat melakukan aksi *Update* status.
6. **`catatan`** (`String`): 
   * **Sumber**: *Form Input (Pengguna - Opsional)*.
   * **Penjelasan**: Diisi oleh pengguna melalui `TextFormField` catatan siaran untuk memberikan konteks progres atau alasan kendala program.