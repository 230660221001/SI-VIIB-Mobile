# Tugas 5: Prototype UI/UX — Peminjaman Ruang Laboratorium

Dokumen dan repositori ini berisi hasil pengerjaan Tugas 5 mata kuliah Pemrograman Aplikasi Bergerak (PAB). Tugas ini mencakup perancangan Information Architecture (IA), pembuatan wireframe low-fidelity, implementasi layar utama di Flutter, serta dokumentasi keputusan UI/UX.

## Daftar Berkas Tugas
* `information-architecture.md` — Inventaris layar, diagram IA (Mermaid), dan alasan pemilihan layar utama.
* `wireframe.png` — Sketsa wireframe low-fidelity (2 layar) dengan anotasi ID kebutuhan dan keadaan kosong.
* `halaman-utama.dart` — Implementasi layar utama menggunakan Flutter dengan tema terpusat.
* `screenshot-halaman.png` — Tangkapan layar penuh dari halaman utama saat dijalankan.
* `catatan-keputusan-ui.md` — Tabel keputusan perancangan antarmuka beserta alasannya.
* `README.md` — Deskripsi tugas, refleksi pengerjaan, dan deklarasi AI.

## Refleksi
Bagian yang paling sulit dipertahankan konsistensinya adalah menyelaraskan batas area serta tata letak pada wireframe dengan susunan hierarki widget di kode Flutter. Hal ini terjadi karena rancangan visual pada wireframe sering kali membutuhkan penyesuaian struktur `Column`, `Row`, atau `Card` agar tidak terjadi masalah *overflow* saat diimplementasikan. Meskipun demikian, dengan merujuk kembali pada catatan keputusan UI/UX, konsistensi fungsi utama dan identitas visual aplikasi tetap dapat terjaga dengan baik.

---
Deklarasi penggunaan AI: Gemini — membantu merumuskan draf struktur dokumen IA, catatan keputusan UI/UX, penyusunan logika widget Flutter, serta perumusan kalimat refleksi; seluruh hasilnya telah ditinjau dan dirumuskan ulang oleh penulis.