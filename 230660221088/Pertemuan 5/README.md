# Tugas 5 — Prototype UI/UX SI Pendataan Bencana BPBD

**Mata Kuliah:** Pengembangan Aplikasi Bergerak (PAB)  
**NIM:** 230660221088  
**Nama:** Muhammad Panji Adhitya  
**Kelas:** SI-VIIB  

## Deskripsi

Tugas ini menerjemahkan kebutuhan dari Tugas 4 menjadi information architecture, wireframe dua layar, dan prototype Flutter untuk **Halaman Laporan Masuk Petugas**. Layar utama membantu petugas melihat laporan masyarakat, memantau status verifikasi, mencari laporan, dan menemukan aksi pencatatan kejadian.

## Isi Folder

- `information-architecture.md` — inventaris layar, diagram IA, dan alasan pemilihan layar utama.
- `wireframe.png` — wireframe low-fidelity untuk layar utama dan layar Detail dan Verifikasi Laporan.
- `halaman-utama.dart` — implementasi Flutter layar utama.
- `screenshot-halaman.png` — tangkapan layar halaman yang dijalankan.
- `catatan-keputusan-ui.md` — alasan keputusan warna, bentuk status, posisi aksi, dan hierarki teks.

## Cara Menjalankan

Salin kode `halaman-utama.dart` ke `lib/main.dart` pada proyek Flutter, kemudian jalankan:

```bash
flutter run -d chrome
```

## Batasan Prototype

Data laporan masih statis dan belum tersambung ke database atau API. Tombol “Catat Kejadian” saat ini menampilkan pesan `SnackBar`; form pencatatan, autentikasi, dan navigasi antarlayar belum menjadi bagian implementasi pada Tugas 5.

## Refleksi

Bagian yang paling sulit dipertahankan konsistensinya adalah informasi status antara wireframe, kode, dan catatan keputusan karena status pemeriksaan laporan harus dibedakan dari status penanganan kejadian. Saya menjaga konsistensi tersebut dengan memakai label Menunggu Verifikasi, Perlu Klarifikasi, dan Terverifikasi pada daftar laporan, serta menggunakan warna status dari tema tanpa menghilangkan teks keterangannya. Tantangan lainnya adalah mempertahankan fokus layar utama pada kebutuhan F-03 sambil tetap menyediakan tombol Catat Kejadian untuk mendukung kebutuhan F-04.

## Deklarasi Penggunaan AI

Deklarasi penggunaan AI: ChatGPT — membantu menyusun struktur information, kritik dan saran dalam proses pembuatan architecture dan wireframe.
