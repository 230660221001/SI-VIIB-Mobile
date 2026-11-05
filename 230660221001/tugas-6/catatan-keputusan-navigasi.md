# Catatan Keputusan Navigasi

## Identitas
- **Nama:** Ghatan Zalfaa Kautsar
- **NIM:** 230660221001
- **Domain:** Sistem Penjualan Beras di Pabrik BSM

## Tabel Keputusan

| Keputusan | Pilihan | Alasan (merujuk IA/kebutuhan) |
|:----------|:--------|:-------------------------------|
| Nama route | `/`, `/detail`, `/form` (huruf kecil, tanpa spasi) | Nama route harus case-sensitive dan konsisten antara peta `routes`, diagram, dan `pushNamed`. Menggunakan `/` sebagai root dan nama deskriptif sederhana untuk memudahkan penelusuran ke IA. |
| Data antarlayar | `DataBeras` objek dikirim dari katalog ke detail via `arguments` | Detail Beras bersifat read-only (F-02) — hanya menampilkan informasi beras yang dipilih, tidak mengubahnya. Sesuai keputusan Pertemuan 6 Bagian 5.2 yang menetapkan arah data satu arah. |
| Validator tiap field | Nama pemesan, jumlah kg, dan alamat wajib diisi; jumlah harus angka positif | Form Pesanan (F-03) tidak boleh menerima input kosong. Pesan validator spesifik per field agar pengguna tahu field mana yang salah. |
| Feedback tiap aksi | `SnackBar` sukses setelah kirim + pesan validator + `splashColor` dari tema | Konsumen Rani memesan di sela waktu istirahat (5–10 menit), jadi setiap aksi harus mendapat konfirmasi visual jelas. `SnackBar` menegaskan "pesanan tercatat (simulasi)", pesan validator mencegah kesalahan input. |