# Bug Report — Tugas 13

| Bagian | Isi |
|:-------|:----|
| ID bug | BUG-01 |
| Skenario reproduksi | Isi form dengan data valid, lalu klik tombol "Simpan Pesanan" dua kali dengan sangat cepat. |
| Expected result | Data pesanan hanya diproses dan disimpan satu kali. |
| Actual result | Data pesanan diproses dua kali (muncul dua antrean data atau loading ganda). |
| Dugaan penyebab | Tombol tidak dinonaktifkan saat fungsi asinkron (proses simpan) sedang berjalan. |
| Perbaikan | Menambahkan variabel state `bool _sedangMenyimpan`. Tombol diatur menjadi `onPressed: _sedangMenyimpan ? null : _simpanPesanan`. |
| Test regresi | TC-08 (Widget test untuk mengecek status loading sebelum dan sesudah delay). |