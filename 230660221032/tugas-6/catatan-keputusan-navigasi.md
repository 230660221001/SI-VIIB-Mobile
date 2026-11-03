# Catatan Keputusan Navigasi — RadiAct (UNSAP Radio)

Dokumen ini mencatat keputusan desain navigasi, pengiriman data antarlayar, validasi form, dan feedback interaksi pada aplikasi RadiAct berdasarkan dokumen kebutuhan dan Information Architecture (IA).

## Tabel Keputusan Navigasi

| Keputusan | Pilihan Anda | Alasan (merujuk IA/kebutuhan) |
| :--- | :--- | :--- |
| **Nama route** |Terpusat pada `MaterialApp`: `/` (`HalamanUtama`), `/tambah` (`FormTambahJadwal`), dan `/detail` (`DetailJadwal`).| Supaya semua nama halaman terdata di satu tempat sehingga kodenya rapi, tidak bikin bingung, dan sesuai dengan rancangan layar (IA) dari Tugas 5 (F-01 dan F-03). |
| **Data antarlayar** | Mengirim data `DataJadwal` saat kartu diketuk, lalu dibaca di halaman `/detail` dengan mengecek tipe data dan kondisi `null`. | Agar layar detail bisa menampilkan informasi siaran secara lengkap (F-03). Pengecekan tipe data dan `null` dibuat supaya aplikasi tidak *error* atau mendadak tertutup jika datanya tidak sengaja kosong. |
| **Validator tiap field** | Memeriksa input tidak boleh kosong atau cuma berisi spasi pada kolom Judul, Divisi, dan Tanggal. | Supaya tim radio tidak sengaja mengirim form yang belum diisi (memenuhi kebutuhan F-01 agar data jadwal yang masuk selalu lengkap). |
| **Feedback tiap aksi** | Teks peringatan merah di bawah kolom jika belum diisi, dan notifikasi melayang (`SnackBar`) oranye di bawah layar setelah berhasil menyimpan. | Memberikan kepastian kepada pengguna: teks merah memberi tahu bagian mana yang salah diisi, sedangkan `SnackBar` memberi tahu bahwa jadwal berhasil dicatat dan layar otomatis kembali ke halaman utama. |