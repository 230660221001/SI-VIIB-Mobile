# Tugas 6 — Navigation Flow dan Interaksi: Mantra Attendance

## Deskripsi Singkat
Tugas ini melanjutkan Tugas 5 dengan menghubungkan layar Mantra Attendance menjadi alur yang dapat dijalankan. Aplikasi memiliki tiga route bernama, yaitu Dashboard (`/`), Check-in (`/checkin`), dan Detail Hasil Absensi (`/detail`). Alur utama yang dibuat adalah check-in (F-03) dari Dashboard melalui form dengan validasi dan feedback SnackBar. Data kehadiran dikirim ke layar detail melalui `arguments` secara read-only (F-06). Hasil check-in masih berupa simulasi karena penyimpanan data baru dibahas pada Pertemuan 7.

Berkas: `navigation-flow.md`, `form-interaksi.dart`, `screenshot-alur.png`, `screenshot-feedback.png`, `catatan-keputusan-navigasi.md`.

## Refleksi
Bagian yang paling sulit dijaga konsistensinya adalah nama route dan aturan validator antara navigation flow, kode, dan catatan keputusan. Hal ini karena nama seperti `/checkin` dan aturan seperti format jam `HH:mm` ditulis di tiga tempat berbeda, sehingga perubahan di satu berkas mudah terlewat di berkas lainnya. Karena itu saya menyimpan nama route sebagai konstanta di kode dan memeriksa ulang ketiga dokumen setiap kali ada perubahan.

## Deklarasi penggunaan AI
Deklarasi penggunaan AI: Claude — membantu menyusun draf awal navigation flow, kode navigasi dan form, catatan keputusan, serta draf README; hasilnya dirumuskan ulang oleh penulis.