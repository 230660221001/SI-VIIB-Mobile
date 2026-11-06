# Test Case — Aplikasi Absensi

| ID | Skenario | Kondisi Awal | Langkah | Expected Result | Actual Result | Status |
|:---|:---------|:-------------|:--------|:----------------|:--------------|:------:|
| TC-01 | Simpan data valid | Form kosong | Isi Nama, NIM, Kegiatan valid lalu klik Simpan | Data tersimpan, muncul pesan sukses | Data tersimpan | Pass |
| TC-02 | Validasi Nama kosong | Form kosong | Biarkan Nama kosong, klik Simpan | Muncul pesan error "Nama wajib diisi" | Pesan error muncul | Pass |
| TC-03 | Validasi NIM salah | Form kosong | Isi NIM dengan huruf, klik Simpan | Muncul pesan error "NIM hanya boleh angka" | Pesan error muncul | Pass |
| TC-04 | Validasi Kegiatan kosong | Form kosong | Biarkan Kegiatan kosong, klik Simpan | Muncul pesan error "Kegiatan wajib diisi" | Pesan error muncul | Pass |
| TC-05 | Tombol simpan ditekan 2x (Bug) | Form terisi valid | Klik Simpan dua kali dengan sangat cepat | Hanya 1 data tersimpan | 2 data tersimpan (Ganda) | Fail (Bug) |
| TC-06 | Tombol simpan ditekan 2x (Fix) | Form terisi valid | Klik Simpan dua kali dengan sangat cepat (setelah diperbaiki) | Hanya 1 data tersimpan | 1 data tersimpan | Pass |
| TC-07 | Loading state muncul | Form terisi valid | Klik Simpan | Tombol berubah jadi tulisan "Menyimpan..." | Tombol berubah | Pass |
| TC-08 | Tampilan awal | Aplikasi baru dibuka | Lihat layar | Menampilkan form kosong dan status "Belum ada data." | Tampilan sesuai | Pass |