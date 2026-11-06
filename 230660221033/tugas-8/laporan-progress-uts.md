# Laporan Progress Project UTS (Milestone M4)

| | |
|:--|:--|
| **Nama** | Yelly Ambarwaty |
| **NIM** | 230660221033 |
| **Kelas** | SI-VIIB |
| **Domain SI** | Layanan Pengelolaan Koleksi dan Peminjaman Buku Panti Baca Ceria |
| **Judul Aplikasi** | CeriaReads Mobile |
| **Tautan Repository** | 
---

## 1. Ringkasan Eksekutif Project
CeriaReads Mobile adalah sebuah aplikasi bergerak (*mobile app*) berbasis Sistem Informasi yang didesain secara khusus untuk menjawab masalah pengelolaan operasional di komunitas literasi "Panti Baca Ceria". Aplikasi ini memudahkan relawan dan anggota dalam mengecek ketersediaan katalog buku serta memfasilitasi pengajuan peminjaman buku yang tercatat dengan rapi. Solusi *mobile* dipilih agar petugas dan anggota dapat mengakses data ketersediaan buku secara *real-time* langsung dari genggaman ponsel mereka, baik saat berkegiatan di dalam ruangan panti maupun pada acara literasi di lapangan.

## 2. Ketercapaian Milestone (M1 s.d. M3)

| Milestone | Deliverable | Status (Selesai / Sebagian) | Catatan / Bukti |
|:----------|:------------|:----------------------------|:----------------|
| M1: Kebutuhan | Dokumen kebutuhan + User Flow | Selesai | File `dokumen-kebutuhan.md` di Tugas 4 |
| M2: UI/UX | Wireframe + Navigasi | Selesai | File prototype, navigasi, form di Tugas 5 & 6 |
| M3: MVP Awal | Model data + CRUD lokal | Selesai | File `crud-lokal.dart` di Tugas 7 |

## 3. Matriks Kebutuhan ke Implementasi

| ID Kebutuhan | Deskripsi Kebutuhan | Prioritas MoSCoW | Halaman Pemenuh | Operasi Data Terkait |
|:-------------|:-------------------|:----------------:|:----------------|:---------------------|
| F-01 | Mengeksplorasi daftar katalog buku koleksi panti | Must | Halaman Katalog (Utama) | Read |
| F-02 | Mengajukan form peminjaman buku beserta durasi pinjam | Must | Halaman Form / BottomSheet | Create |
| F-03 | Melihat dan memantau status persetujuan peminjaman buku | Must | Halaman Daftar Pinjaman | Read & Update |
| F-04 | Membatalkan pengajuan pinjaman yang salah atau kadaluwarsa | Should | Halaman Daftar Pinjaman | Delete |

## 4. Tangkapan Layar Aplikasi Berjalan
Tangkapan layar (`screenshot-daftar.png`, `screenshot-form.png`, `screenshot-hapus.png`) telah saya simpan secara terpisah pada direktori `tugas-8` ini yang membuktikan:
1. Daftar buku dan daftar riwayat pengajuan berhasil dirender melalui `ListView.builder`.
2. Halaman form peminjaman berfungsi menahan masukan invalid menggunakan `validator`.
3. Dialog *AlertDialog* tampil sempurna untuk memberikan peringatan sebelum data pengajuan dihapus permanen.

## 5. Kendala dan Solusi Teknis
1. **Kendala Indeks vs ID pada Delete:** Awalnya, operasi hapus saya menggunakan indeks array. Ketika data teratas dibatalkan, baris di bawahnya naik, menyebabkan aksi hapus/ubah selanjutnya salah menyasar data.
   **Solusi:** Saya merombak logika dengan membuat atribut `id` *timestamp* unik. Penghapusan kemudian disesuaikan dengan menggunakan `removeWhere((item) => item.id == id)`, sehingga penghapusan dijamin akurat 100%.
2. **Kendala Pembaruan State Antarmuka:** Data berhasil tersimpan dari inputan form, namun daftar di halaman tidak berubah secara visual sampai aplikasi direstart.
   **Solusi:** Saya memindahkan array data ke tingkat `StatefulWidget` dan mewajibkan segala mutasi data (Create/Delete/Update) selalu dieksekusi di dalam struktur tutup kurung kurawal `setState(() { ... })`.

## 6. Rencana Pengembangan Milestone M5 (REST API)
Pada pertemuan dan milestone M5 (Minggu ke-9 dan ke-10) mendatang, saya berencana mengintegrasikan CeriaReads dengan REST API layanan *backend*. Data katalog buku dan riwayat peminjaman yang saat ini bersifat *in-memory* akan diubah menjadi dinamis. Aplikasi akan menggunakan *package* `http` untuk me-Request data JSON dari server agar ketersediaan stok buku selalu terhubung dengan aplikasi pengurus yang lain secara tersinkronisasi.

## 7. Refleksi Pembelajaran Tengah Semester
Memasuki paruh semester ini, saya menyadari bahwa merancang aplikasi *mobile* menuntut konsistensi yang ketat, mulai dari menganalisis user flow di dokumen hingga mentransformasikannya menjadi widget layout Flutter. Tantangan terbesar bukanlah pada menghafal sintaks, melainkan merancang arsitektur pengelolaan *state* (kapan dan di mana data harus disimpan, divalidasi, dan dirender ulang). Penugasan sistematis ini sangat melatih nalar logika saya dalam menjamin kelancaran interaksi (*smooth UX*) demi kepuasan pengguna.

---