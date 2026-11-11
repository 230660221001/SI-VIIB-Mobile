# Refleksi Tugas 13

1. Risiko bug paling penting pada project ini adalah pengguna tidak sengaja menekan tombol simpan berkali-kali karena jaringan lambat, yang dapat menyebabkan data pesanan ganda di backend.
2. Mitigasi yang dipilih adalah menerapkan *state locking* (`_sedangMenyimpan`) pada UI, sehingga tombol otomatis nonaktif selama proses asinkron berjalan.
3. Hal yang masih perlu diperbaiki adalah menambahkan *unit test* yang lebih mendalam untuk validasi logika bisnis (seperti kalkulasi total harga) dan melakukan *integration test* dengan *mock server*.