# Model Data — Sistem Penjualan Beras BSM

## 1. Daftar Entitas

| Entitas | Field | Tipe | Sumber Nilai | Kebutuhan |
|:--------|:------|:-----|:-------------|:----------|
| DataPesanan | id | String | Sistem (timestamp) | — (kunci internal) |
| DataPesanan | namaPemesan | String | Form (F-03) | F-03 |
| DataPesanan | jenisBeras | String | Form/pilih dari katalog (F-02) | F-02 |
| DataPesanan | jumlahKg | int | Form (F-02) | F-02 |
| DataPesanan | alamat | String | Form (F-03) | F-03 |
| DataPesanan | status | String | Sistem (default 'menunggu'), diubah karyawan (F-08) | F-06, F-08 |
| DataPesanan | nomorResi | String? | Form oleh karyawan (F-08) — nullable | F-08 |

## 2. Sumber Nilai Setiap Field

| Field | Sumber | Penjelasan |
|:------|:-------|:-----------|
| `id` | Sistem | Dihasilkan dari `DateTime.now().millisecondsSinceEpoch.toString()` saat pesanan dibuat — unik dan tidak berubah |
| `namaPemesan` | Form | Diisi konsumen pada form checkout (F-03) |
| `jenisBeras` | Form | Dipilih konsumen dari katalog atau diketik (F-02) |
| `jumlahKg` | Form | Diisi konsumen; divalidasi > 0 (F-02) |
| `alamat` | Form | Diisi konsumen; wajib untuk pengiriman (F-03) |
| `status` | Sistem + Karyawan | Default 'menunggu' saat dibuat; diubah menjadi 'diproses', 'dikirim', atau 'selesai' oleh karyawan (F-08) |
| `nomorResi` | Form (Karyawan) | Diisi karyawan saat pesanan dikirim; nullable karena belum ada saat pesanan dibuat (F-08) |

## 3. Keterkaitan dengan Kebutuhan Tugas 4

| Kebutuhan | Operasi CRUD yang Memenuhi |
|:----------|:---------------------------|
| F-02 (tambah ke keranjang) | Create — konsumen membuat pesanan beras |
| F-03 (checkout dengan alamat) | Create — field alamat tersimpan pada model |
| F-06 (lihat status pesanan) | Read — daftar pesanan ditampilkan dengan status berwarna |
| F-08 (input nomor resi) | Update — karyawan mengisi nomorResi dan mengubah status |

Kebutuhan **F-01 (katalog)** dan **F-05 (konfirmasi pembayaran)** tidak termasuk dalam entitas ini karena:
- F-01 adalah data statis katalog (bukan data yang berubah-ubah).
- F-05 memerlukan unggah file (di luar cakupan data lokal).