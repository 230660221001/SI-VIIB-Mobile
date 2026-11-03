# Tugas 6: Navigation Flow dan Interaksi

**Nama**  : Deyna Angeliawati Zahara  
**NPM**   : 230660221032  
**Kelas** : SI VII B  

## 1. Deskripsi Singkat Tugas
Pada Tugas 6 ini, aplikasi RadiAct (UNSAP Radio) dikembangkan lebih lanjut dengan menghubungkan layar-layar antarmuka menjadi satu alur aplikasi bernavigasi berbasis Flutter. Tugas ini mencakup penerapan rute bernama (`pushNamed` dan `pop`), pengiriman data jadwal secara *read-only* melalui `arguments` ke layar detail, penambahan form input jadwal siaran beserta fungsi validasinya, dan pemberian umpan balik (*feedback*) berupa `SnackBar` saat aksi berhasil dilakukan.

## 2. Komponen Tugas (Hasil)
- Navigation Flow: [navigation-flow.md](navigation-flow.md)
- Kode Flutter Interaksi: [form-interaksi.dart](form-interaksi.dart)
- Bukti Layar Detail (Arguments): [screenshot-alur.png](screenshot-alur.png)
- Bukti Feedback (SnackBar): [screenshot-feedback.png](screenshot-feedback.png)
- Catatan Keputusan Navigasi: [catatan-keputusan-navigasi.md](catatan-keputusan-navigasi.md)

## 3. Refleksi
Bagian yang paling sulit dipertahankan konsistensinya adalah menyelaraskan aturan validasi form antara alur di diagram navigation flow, kode program, dan catatan keputusan. Kesulitan ini terjadi karena harus memastikan setiap kolom wajib diisi dengan benar sebelum data diproses dan layar berpindah. Namun, saya belajar bahwa validasi yang konsisten sangat penting agar aplikasi RadiAct tidak menerima data kosong atau bermasalah.

## 4 Struktur Folder
```text
tugas6Deyna/
├── catatan-keputusan-navigasi.md
├── form-interaksi.dart
├── navigation-flow.md
├── screenshot-alur.png
├── screenshot-feedback.png
└── README.md