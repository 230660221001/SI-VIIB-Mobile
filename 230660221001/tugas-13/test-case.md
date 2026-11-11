# Test Case — Tugas 13

| ID | Skenario | Kondisi awal | Langkah | Expected result | Actual result | Status |
|:---|:---------|:-------------|:--------|:----------------|:--------------|:------:|
| TC-01 | Tampilkan Halaman | Aplikasi dibuka | Buka aplikasi | Form dan tombol tampil | Sesuai | Lulus |
| TC-02 | Validasi Nama Kosong | Form kosong | Klik Simpan | Pesan "Nama pemesan wajib diisi" muncul | Sesuai | Lulus |
| TC-03 | Validasi Jumlah Kosong | Form nama terisi | Klik Simpan | Pesan "Jumlah karung wajib diisi" muncul | Sesuai | Lulus |
| TC-04 | Validasi Format Angka | Form terisi teks pada jumlah | Klik Simpan | Pesan "Jumlah harus berupa angka" muncul | Sesuai | Lulus |
| TC-05 | Validasi Angka Negatif | Jumlah diisi -5 | Klik Simpan | Pesan "Jumlah minimal 1 karung" muncul | Sesuai | Lulus |
| TC-06 | Validasi Panjang Nama | Nama > 50 karakter | Klik Simpan | Pesan "Nama maksimal 50 karakter" muncul | Sesuai | Lulus |
| TC-07 | Simpan Pesanan Valid | Form terisi valid | Klik Simpan | Status berubah menjadi "Pesanan Berhasil Disimpan!" | Sesuai | Lulus |
| TC-08 | Cegah Data Ganda | Form valid | Klik Simpan 2x cepat | Tombol nonaktif, proses simpan hanya 1x | Sesuai | Lulus |