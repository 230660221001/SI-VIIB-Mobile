# Catatan Keputusan UI/UX — SI Pendataan Bencana BPBD

**Layar yang dirancang:** Halaman Laporan Masuk Petugas (F-03)  
**Persona utama:** Petugas Pendataan BPBD

| Keputusan | Pilihan | Alasan |
|---|---|---|
| Warna benih (*seed color*) | Navy `#17365D` melalui `ColorScheme.fromSeed`; merah `#D32F2F` digunakan sebagai aksen pada aksi utama. | Navy memberi kesan formal dan menjaga konsistensi identitas visual aplikasi layanan BPBD. Warna utama diterapkan melalui `ThemeData` agar komponen memiliki palet yang konsisten. Aksen merah membuat aksi pencatatan mudah ditemukan tanpa mendominasi seluruh layar. |
| Bentuk status | Status ditampilkan sebagai `Chip` berlabel dengan warna latar dari `ColorScheme`: `tertiaryContainer` untuk Menunggu Verifikasi, `errorContainer` untuk Perlu Klarifikasi, dan `primaryContainer` untuk Terverifikasi. | Petugas perlu membedakan hasil pemeriksaan laporan saat memindai daftar (F-03). Teks status tetap ditampilkan agar makna tidak bergantung pada warna saja dan lebih mudah dipahami. |
| Posisi aksi utama | `FloatingActionButton.extended` bertuliskan “Catat Kejadian” di kanan bawah. | Aksi ini mendukung F-04, yaitu pencatatan kejadian yang diterima melalui jalur selain aplikasi. Penempatan di kanan bawah membuat aksi utama mudah ditemukan tanpa mengganggu daftar laporan yang menjadi fokus layar F-03. |
| Hierarki teks | Nama instansi dan nama sistem pada `AppBar`; sapaan petugas sebagai judul; ringkasan jumlah laporan menunggu verifikasi; judul “Laporan Terbaru”; lalu jenis bencana, lokasi, tanggal, dan status pada setiap kartu. | Petugas membutuhkan informasi ringkas untuk memantau dan memeriksa laporan (F-03). Ukuran dan urutan teks dibuat dari informasi umum menuju rincian agar daftar dapat dipindai dengan cepat. |
