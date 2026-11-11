# Catatan Keputusan Navigasi — SI Pendataan Bencana BPBD

**NIM:** 230660221088  
**Nama:** Muhammad Panji Adhitya  
**Kelas:** SI-VIIB    

## Tabel Keputusan

| Keputusan | Pilihan implementasi | Alasan berdasarkan IA / kebutuhan |
|---|---|---|
| Initial route | `/login` | Halaman Login Petugas berasal dari IA Tugas 5 dan memenuhi F-09 yang berprioritas Must have. Setelah validasi demo berhasil, petugas diarahkan ke Halaman Laporan Masuk Petugas (F-03, Must have). |
| Nama route | Sembilan route terdaftar sebagai konstanta pada class `Rute` dan dipetakan pada `MaterialApp.routes`. | Nama route konsisten dengan sembilan layar pada IA Tugas 5; pemusatan nama mengurangi kesalahan penulisan saat pemanggilan `pushNamed`. |
| Navigasi setelah login | `Navigator.pushReplacementNamed` digunakan dari `/login` ke `/laporan-masuk`. | Login petugas memenuhi F-09 (Must have). Penggantian route mencegah pengguna kembali ke halaman login demo dengan tombol Back setelah berhasil masuk. Validasi ini masih simulasi lokal. |
| Navigasi maju | `Navigator.pushNamed` digunakan dari kartu laporan ke detail, dari dashboard ke form pencatatan, dan pada layar pendukung. | Laporan masuk merupakan titik kerja utama petugas (F-03); kartu membuka detail laporan (F-05), sedangkan tombol Catat Kejadian membuka form pencatatan (F-04). |
| Navigasi kembali | `Navigator.pop` digunakan pada layar detail dan form. | Pengguna dapat kembali ke layar sebelumnya tanpa kehilangan konteks daftar selama halaman induk masih berada di navigation stack. |
| Pengiriman laporan ke detail | Kartu laporan mengirim objek `LaporanBencana` melalui `arguments`; halaman tujuan memeriksa `args is LaporanBencana` dan menyediakan cabang data null/tidak sesuai. | Detail harus menampilkan laporan yang dipilih petugas (F-05), bukan selalu menampilkan satu data tetap. Pemeriksaan tipe menghindari penggunaan objek yang tidak sesuai. |
| Pengembalian hasil form | Form mengembalikan objek `KejadianBencana` melalui `Navigator.pop(context, kejadianBaru)`. | Data hasil input harus sampai ke dashboard agar pencatatan manual petugas (F-04) tidak berhenti pada pesan berhasil saja. |
| Tipe hasil named route | Dashboard memakai `Navigator.pushNamed<dynamic>` lalu memeriksa `hasil is KejadianBencana`. | Route yang didaftarkan melalui `MaterialApp.routes` bertipe `Route<dynamic>`. Percobaan awal memakai `pushNamed<KejadianBencana>` menimbulkan TypeError saat runtime; generic `dynamic` dan pemeriksaan tipe menjadi perbaikan yang berjalan pada alur pengujian. |
| Pembaruan dashboard | Setelah hasil lolos pemeriksaan tipe, dashboard menjalankan `setState()` dan `dataKejadianManual.insert(0, hasil)`. | UI harus langsung memperlihatkan kejadian baru yang dicatat petugas. Hasil ditampilkan dalam bagian terpisah **Kejadian Dicatat Petugas**, tidak dicampur dengan laporan masyarakat (F-03/F-04). |
| Penyimpanan data | List `dataKejadianManual` disimpan di state halaman dashboard selama aplikasi berjalan. | Sesuai cakupan interaksi Tugas 6, data dapat diteruskan antarlayar dan ditampilkan kembali ketika kembali ke dashboard. Data belum disimpan permanen dan hilang saat aplikasi di-restart. |
| Validator jenis bencana | Wajib diisi; input null, kosong, atau spasi ditolak. | Jenis bencana merupakan bagian dari data kejadian yang dicatat petugas (F-04). |
| Validator lokasi | Wajib diisi; input null, kosong, atau spasi ditolak. | Lokasi diperlukan agar kejadian dapat dikenali dan ditindaklanjuti sesuai kebutuhan pendataan BPBD (F-04). |
| Validator tanggal/waktu | Wajib diisi; input null, kosong, atau spasi ditolak. | Tanggal/waktu merupakan informasi dasar untuk pencatatan kejadian. Pada prototype ini input masih berupa teks dan belum memvalidasi format kalender/jam. |
| Validator deskripsi | Wajib diisi dan minimal 15 karakter setelah `trim()`. | Deskripsi membantu petugas memahami konteks kejadian; batas minimal menghindari isian yang terlalu singkat. |
| Validator kontak | Opsional; jika diisi, minimal 8 karakter. | Kontak merupakan informasi pendukung dan tidak boleh menghalangi pencatatan ketika sumber informasi tidak menyertakan nomor kontak. |
| Feedback input tidak valid | `TextFormField.validator` menampilkan pesan tepat di bawah field yang bermasalah. | Pengguna mengetahui bagian mana yang perlu diperbaiki sebelum pengiriman (F-04). |
| Feedback pengiriman valid | Dashboard menampilkan `SnackBar` setelah menerima objek `KejadianBencana` dan memperbarui daftar. | Petugas mendapat umpan balik setelah data benar-benar diterima dashboard, bukan hanya setelah tombol kirim ditekan. |