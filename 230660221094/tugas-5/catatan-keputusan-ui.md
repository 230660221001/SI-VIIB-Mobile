# Catatan Keputusan UI/UX SIPUSKAM

## 1. Pemilihan Seed Color

Saya menggunakan seed color `Colors.indigo` pada `ThemeData` untuk membangun tampilan utama SIPUSKAM. Warna indigo dipilih karena memberikan kesan profesional, tenang, dan sesuai dengan karakter aplikasi perpustakaan kampus. Penggunaan `ColorScheme.fromSeed()` juga membuat warna pada komponen UI lebih konsisten dan mengikuti prinsip **consistency**.

## 2. Tampilan Status Ketersediaan Buku

Status ketersediaan buku ditampilkan secara langsung pada setiap card buku dengan teks **"Tersedia"** atau **"Tidak tersedia"**. Status menggunakan warna yang berbeda agar pengguna dapat mengetahui kondisi buku dengan cepat tanpa harus membuka halaman lain. Keputusan ini mendukung prinsip **feedback** karena sistem memberikan informasi yang jelas mengenai kondisi buku.

## 3. Penempatan Primary Action

Primary action **"Cari Buku"** ditempatkan pada bagian bawah halaman menggunakan `FloatingActionButton.extended`. Posisi tersebut mudah dijangkau oleh pengguna ketika menggunakan perangkat mobile dan memberikan penekanan visual pada fungsi pencarian. Keputusan ini juga mempertimbangkan prinsip **touch target** agar tombol dapat digunakan dengan nyaman pada layar sentuh.

## 4. Hierarki Teks

Hierarki teks dibuat dengan membedakan ukuran dan ketebalan teks. Judul aplikasi, sapaan pengguna, dan judul daftar buku dibuat lebih menonjol, sedangkan informasi seperti penulis dan kategori menggunakan ukuran teks yang lebih kecil. Hal ini bertujuan agar pengguna dapat memahami informasi utama terlebih dahulu dan mendukung prinsip **visual hierarchy**.

## 5. Penggunaan Card pada Daftar Buku

Setiap buku ditampilkan dalam bentuk `Card` yang berisi judul, penulis, kategori, dan status ketersediaan. Pengelompokan informasi dalam satu card membuat setiap buku lebih mudah dibedakan dan dipindai oleh pengguna. Keputusan ini mendukung prinsip **consistency** karena setiap item buku memiliki struktur tampilan yang sama.

## 6. Empty State

Empty state disediakan ketika tidak terdapat buku yang dapat ditampilkan. Tampilan tersebut menggunakan ikon buku, pesan **"Belum ada buku yang ditemukan"**, dan keterangan untuk mencoba kata kunci lain. Empty state dipilih agar pengguna tetap mendapatkan feedback dan mengetahui apa yang harus dilakukan ketika hasil pencarian kosong.

## 7. Readability dan Kontras

Warna teks dan komponen dipilih agar tetap mudah dibaca pada layar mobile. Informasi penting seperti judul buku dan status ketersediaan dibuat lebih menonjol melalui ukuran atau ketebalan teks. Keputusan ini dibuat untuk memenuhi prinsip **readability dan contrast**, sehingga informasi dapat dibaca dengan nyaman oleh pengguna.

## Kesimpulan

Keputusan UI pada SIPUSKAM dibuat dengan mempertimbangkan kebutuhan utama pengguna untuk mencari dan mengetahui ketersediaan buku dengan cepat. Tampilan dibuat sederhana, konsisten, mudah dibaca, dan memberikan feedback yang jelas pada kondisi normal maupun ketika tidak ada hasil pencarian.
