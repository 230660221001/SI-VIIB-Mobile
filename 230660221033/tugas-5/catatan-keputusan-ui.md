# Catatan Keputusan UI/UX — CeriaReads
**Nama:** Yelly Ambarwaty  
**NIM:** 230660221033  

---

## Tabel Keputusan Perancangan Antarmuka

| Keputusan UI/UX | Pilihan yang Diterapkan | Alasan (Merujuk Kebutuhan / Persona / Prinsip UI Mobile) |
|:---|:---|:---|
| **Skema Warna Benih (Seed Color)** | Premium Indigo (`#4F46E5`) dipadukan dengan Soft Slate Background (`#F1F5F9`). | Memberikan nuansa elegan, tenang, dan terpercaya bagi komunitas literasi. Skema `ColorScheme.fromSeed` menjamin kontras rasio teks sesuai standar aksesibilitas Material 3 sehingga mudah dibaca di lingkungan luar ruangan (*outdoor* lapak baca). |
| **Bentuk Badge Status Stok** | Pill-shaped Badge (Hijau Soft `#DCFCE7` untuk Stok Ada, Merah Soft `#FEE2E2` untuk Habis). | Menerapkan **Prinsip Feedback & Keterbacaan Visual**. Warna dan bentuk kapsul pembeda memungkinkan pengguna (Persona Andi) mengetahui ketersediaan stok hanya dengan lirik kilat (*glanceable*) tanpa perlu membaca angka rinci. |
| **Posisi & Styling Aksi Utama** | `FloatingActionButton.extended` di pojok kanan bawah dengan label "Pinjam Buku". | Menerapkan **Prinsip Target Sentuh Memadai (minimal 48dp)** dan hierarki aksi utama. FAB yang melayang memastikan tombol pengajuan peminjaman selalu siap dijangkau ibu jari pengguna (*thumb zone*) saat menggulir katalog. |
| **Hierarki Teks & Komponen Kartu** | Judul Buku 15pt Bold (Slate 900), Penulis 13pt Regular (Slate 600), Kategori 11pt Chip. | Menerapkan **Prinsip Hierarki Visual**. Menegaskan informasi yang paling dicari pengguna secara bertingkat sehingga layar tidak berantakan (*cluttered*) dan mata pengguna dapat melakukan pemindaian data secara alami. |