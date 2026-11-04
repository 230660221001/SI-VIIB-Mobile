# 1.5 Catatan Keputusan UI/UX

| **Keputusan** | **Pilihan Anda** | **Alasan (merujuk kebutuhan/persona/prinsip)** |
|---|---|---|
| Warna benih | Ungu dengan menggunakan `ColorScheme.fromSeed` dan `useMaterial3: true`. | Menjaga konsistensi warna antarmuka dan memberikan tampilan yang seragam. Penggunaan tema juga mempermudah penerapan warna pada komponen UI. |
| Bentuk status | `Chip` dengan warna berbeda untuk status Menunggu, Dikerjakan, dan Selesai. | Membantu pelapor mengenali perkembangan laporan dengan cepat. Teks status tetap ditampilkan agar informasi tidak hanya bergantung pada warna. |
| Posisi aksi utama | `FloatingActionButton.extended` bertuliskan “Buat Laporan” di kanan bawah. | Memudahkan pelapor menemukan tindakan utama aplikasi, yaitu membuat laporan kerusakan fasilitas. |
| Hierarki teks | Judul aplikasi pada `AppBar`, ringkasan pada `Card`, judul “Laporan Saya”, kemudian nama fasilitas, lokasi, deskripsi, dan status pada kartu laporan. | Mengelompokkan informasi berdasarkan fungsi agar pelapor dapat memahami halaman dan menemukan informasi laporan dengan mudah. |
| Keadaan kosong | Ikon, judul “Belum ada laporan”, dan petunjuk untuk membuat laporan. | Memberikan informasi yang jelas ketika belum ada laporan sehingga pelapor mengetahui tindakan yang dapat dilakukan. |
| Konsistensi wireframe | Mempertahankan susunan ringkasan, daftar laporan, status, dan tombol utama sesuai wireframe. | Menjaga kesesuaian antara rancangan awal dan implementasi Flutter. |
