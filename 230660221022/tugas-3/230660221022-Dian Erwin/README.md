# Tugas 3 — Halaman Aplikasi Sederhana

**Nama:** Dian Erwin  
**NIM:** 230660221022  
**Kelas:** SI-VIIA  
**Domain SI:** Laboratorium Komputer MAS Darussalam Sumedang — Monitoring & Pelaporan Perangkat  

---

## 1. Deskripsi Halaman
Halaman utama aplikasi Monitoring Lab Komputer ini berfungsi untuk menampilkan status ketersediaan dan kondisi perangkat keras (PC) di laboratorium sekolah secara *real-time*. Halaman ini menyusun elemen visual dengan struktur *MaterialApp* dan *Scaffold*, di mana bagian atas memuat *AppBar* header, area konten menampilkan kartu ringkasan instansi serta daftar unit PC menggunakan kombinasi *Column*, *Row*, *Padding*, dan *ListView.builder*, serta dilengkapi *FloatingActionButton* untuk aksi cepat pengambilan foto pelaporan kerusakan.

---

## 2. Penggunaan Layout
Aplikasi ini memanfaatkan lebih dari 3 jenis layout dasar Flutter, yaitu:
1. **Column**: Menyusun komponen halaman secara vertikal dari header ringkasan, teks seksi, hingga daftar perangkat.
2. **Row**: Menyusun elemen ikon dengan teks info lab secara horizontal, serta menyejajarkan kode PC dengan *badge* status di dalam setiap baris daftar.
3. **Padding**: Memberikan spasi 16px di sekeliling *body* utama dan di dalam *Card* agar tampilan rapi dan tidak merapat ke tepi layar.
4. **ListView.builder & Expanded**: Menampilkan daftar 5 entri perangkat lab secara efisien dan dapat digulir tanpa menyebabkan error *RenderFlex overflow*.

---

## 3. Berkas Dokumentasi & Hasil Visual

- Kode Utama: `halaman_aplikasi.dart`
- Diagram Widget Tree: `widget-tree.png` (Sumber: `widget-tree.mmd`)
- Tangkapan Layar Tampilan Aplikasi: `screenshot-halaman.png`

---

## 4. Refleksi

Layout yang paling sulit saya rangkai adalah kombinasi antara `Column` dan `ListView.builder`. Hal ini terjadi karena `ListView.builder` secara bawaan membutuhkan tinggi ruang yang tidak terbatas, sehingga memicu error *RenderFlex overflow* jika diletakkan langsung di dalam `Column`. Saya berhasil mengatasinya dengan membungkus widget `ListView.builder` menggunakan widget `Expanded` agar daftar tersebut mengambil sisa ruang vertikal yang tersedia secara fleksibel.

---
Bantuan AI: Claude, hanya untuk menyiapkan kerangka file; AI Assistant untuk menyempurnakan struktur layout widget tree dan penyusunan refleksi.
