# Laporan Progress Project UTS (Milestone M4)

| | |
|:--|:--|
| **Nama** | Ghatan Zalfaa Kautsar |
| **NIM** | 230660221001 |
| **Kelas** | SI-VIIB |
| **Domain SI** | Sistem Penjualan Beras di Pabrik BSM |
| **Judul Aplikasi** | Sistem Penjualan Beras BSM |
| **Tautan Repository** | https://github.com/230660221001/SI-VIIB-Mobile/tree/main/230660221001 |

---

## 1. Ringkasan Eksekutif Project
Aplikasi mobile "Sistem Penjualan Beras BSM" dikembangkan untuk mendigitalkan proses pemesanan beras yang sebelumnya manual (via telepon/WhatsApp dan catatan buku). Pengguna utama adalah Konsumen (memesan dan melacak) serta Karyawan Pengiriman (memperbarui status resi). Solusi mobile dipilih karena karakteristik **konteks bergerak** (memesan dari mana saja) dan **sesi penggunaan singkat** (memeriksa status dalam hitungan detik).

## 2. Ketercapaian Milestone (M1 s.d. M3)

| Milestone | Deliverable | Status (Selesai / Sebagian) | Catatan / Bukti |
|:----------|:------------|:----------------------------|:----------------|
| M1: Kebutuhan | Dokumen kebutuhan + User Flow | Selesai | File `dokumen-kebutuhan.md` di Tugas 4 |
| M2: UI/UX | Wireframe + Navigasi | Selesai | File `wireframe.png` dan `halaman-utama.dart` di Tugas 5 & 6 |
| M3: MVP Awal | Model data + CRUD lokal | Selesai | File `crud-lokal.dart` dan `model-data.md` di Tugas 7 |

## 3. Matriks Kebutuhan ke Implementasi

| ID Kebutuhan | Deskripsi Kebutuhan | Prioritas MoSCoW | Halaman Pemenuh | Operasi Data Terkait |
|:-------------|:-------------------|:----------------:|:----------------|:---------------------|
| F-01 | Melihat daftar beras beserta kualitas, harga, dan stok | Must | Halaman Katalog | Read |
| F-02 | Menambahkan beras ke keranjang dengan menentukan jumlah | Must | Halaman Detail | Create (Keranjang) |
| F-03 | Melakukan checkout dengan alamat dan metode pengiriman | Must | Halaman Checkout | Create (Transaksi) |
| F-05 | Mengonfirmasi pembayaran dengan mengunggah bukti transfer | Must | Halaman Konfirmasi | Create (Pembayaran) |
| F-08 | Memasukkan nomor resi dan memperbarui status pengiriman | Must | Halaman Karyawan | Update (Status & Resi) |
| F-06 | Melihat status pesanan (Menunggu, Terverifikasi, Dikirim) | Should | Halaman Riwayat | Read |
| F-07 | Melihat daftar pesanan siap kirim | Should | Halaman Daftar Pesanan | Read |

## 4. Tangkapan Layar Aplikasi Berjalan
*(Ganti bagian ini dengan gambar yang sudah disalin ke folder tugas-8)*
- [Halaman Utama - Katalog Beras](screenshot-daftar.png)
- [Halaman Form - Pesanan Baru](screenshot-feedback.png)
- [Dialog Konfirmasi Hapus](screenshot-hapus.png)

## 5. Kendala dan Solusi Teknis
1. **Kendala:** Error `RenderFlex overflow` saat menampilkan `ListView` di dalam `Column`. **Solusi:** Membungkus `ListView` dengan widget `Expanded` agar menyesuaikan sisa tinggi layar.
2. **Kendala:** Data hilang saat aplikasi ditutup. **Solusi:** Mengimplementasikan `shared_preferences` dengan `jsonEncode` dan `jsonDecode` untuk persistensi lokal.

## 6. Rencana Pengembangan Milestone M5 (REST API)
Pada M5 (Minggu 9-10), data katalog, transaksi, dan status pengiriman akan diambil dan dikirim secara *real-time* ke Backend SI melalui REST API, sehingga data konsumen dan admin sinkron dan tidak hanya bergantung pada data lokal.

## 7. Refleksi Pembelajaran Tengah Semester
Membangun aplikasi mobile bukan sekadar UI, melainkan rekayasa perangkat lunak utuh dari analisis kebutuhan, UI/UX, navigasi, hingga pengelolaan *state* dan data lokal. Tantangan terbesar adalah menjaga konsistensi alur data dan memastikan setiap perubahan *state* dirender dengan tepat menggunakan `setState`. Saya menyadari pentingnya struktur model data dan relasi antar-halaman (navigasi) agar aplikasi tidak sekadar tampil menarik, tetapi benar-benar menyelesaikan masalah pengguna.