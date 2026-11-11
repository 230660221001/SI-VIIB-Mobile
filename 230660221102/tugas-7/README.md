# Tugas 7 — MVP Awal dengan Data Lokal: Mantra Attendance

## Deskripsi Singkat
Tugas ini mengubah prototype Mantra Attendance dari data statis menjadi MVP awal dengan data lokal. Model `DataKehadiran` disusun dari kebutuhan F-03 sampai F-06 dan dikelola pada `State` Dashboard dengan `setState`. CRUD berjalan lengkap: check-in menambah catatan (Create), Dashboard dan layar Detail menampilkan data (Read), check-out mengubah jam keluar (Update), dan catatan dapat dihapus dengan konfirmasi dialog (Delete). Data disimpan in-memory, sedangkan persistensi serta kebutuhan backend (Login dan pemantauan admin) dicatat sebagai pengembangan lanjutan.

Berkas: `model-data.md`, `crud-lokal.dart`, `screenshot-daftar.png`, `screenshot-hapus.png`, `catatan-keputusan-data.md`.

## Refleksi
Bagian yang paling sulit dijaga konsistensinya adalah aturan status dan kondisi tombol check-in/check-out antara kebutuhan, model data, dan kode. Hal ini karena aturan seperti batas jam 08:00 untuk status Terlambat dan syarat check-in hanya sekali sehari ditulis di tiga tempat berbeda, sehingga perubahan di satu tempat mudah terlewat di tempat lain. Karena itu saya mencocokkan ulang setiap field model dan aturan bisnis dengan ID kebutuhan F-03 sampai F-06 setiap kali kode berubah.

## Deklarasi penggunaan AI
Deklarasi penggunaan AI: Claude — membantu menyusun draf awal model data, kode CRUD lokal, catatan keputusan, dan draf README; hasilnya dirumuskan ulang oleh penulis.