# Tugas 7: MVP Awal dengan Data Lokal

**Nama**  : Deyna Angeliawati Zahara  
**NPM**   : 230660221032  
**Kelas** : SI VII B  

## 1. Deskripsi Singkat Tugas
Pada Tugas 7 ini, aplikasi RadiAct (UNSAP Radio) dikembangkan menjadi versi MVP (Minimum Viable Product) awal berbasis pengelolaan data lokal (in-memory). Tugas ini mencakup pembuatan class model data `DataJadwal` berbasis kebutuhan bisnis, pengelolaan state menggunakan `StatefulWidget` dan `setState`, serta penerapan fungsi CRUD (Create, Read, Update status, dan Delete dengan konfirmasi `AlertDialog`) tanpa package tambahan.

## 2. Komponen Tugas (Hasil)
- Model Data: [model-data.md](model-data.md)
- Kode Flutter CRUD Lokal: [crud-lokal.dart](crud-lokal.dart)
- Bukti Tambah & Tampil Data: [screenshot-daftar.png](screenshot-daftar.png)
- Bukti Konfirmasi Hapus Data: [screenshot-hapus.png](screenshot-hapus.png)
- Catatan Keputusan Data: [catatan-keputusan-data.md](catatan-keputusan-data.md)

## 3. Refleksi
Bagian yang paling sulit dipertahankan konsistensinya adalah menyelaraskan struktur field pada model data dengan pemanggilan operasi CRUD di kode program dan tabel kebutuhan. Harus teliti.

## 5. Struktur Folder
```text
tugas7_Deyna/
├── catatan-keputusan-data.md
├── crud-lokal.dart
├── model-data.md
├── README.md
├── screenshot-daftar.png
└── screenshot-hapus.png