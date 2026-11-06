# Tugas 3: Halaman Aplikasi Sederhana
**Nama:** Yelly Ambarwaty  
**NIM:** 230660221033  
**Nama Aplikasi:** CeriaReads  
**Domain SI:** Sistem Informasi Komunitas Panti Baca Ceria  

## Deskripsi Halaman
Halaman utama dari aplikasi CeriaReads dirancang khusus untuk menampilkan katalog buku komunitas Panti Baca Ceria secara rapi, dinamis, dan mudah digulir. Halaman ini memberikan informasi langsung kepada anggota maupun relawan mengenai judul buku, penulis, kategori, serta status ketersediaan stok fisik di setiap lapak baca komunitas. Dengan antarmuka yang terstruktur efisien melalui kombinasi widget tata letak seperti kolom, baris, dan daftar yang *scrollable*, pengguna dapat dengan cepat memantau dan mencari koleksi buku tanpa perlu membongkar tumpukan buku secara manual.

## Refleksi
Widget layout yang paling sulit saya rangkai adalah `ListView.builder` ketika ditempatkan di dalam sebuah `Column` karena awalnya sempat memicu pesan *error* `RenderFlex overflow` pada layar. Kesulitan ini terjadi karena widget `Column` pada dasarnya tidak membatasi tinggi elemen anak-anaknya secara otomatis, sehingga `ListView` akan mencoba mengambil ruang vertikal secara tak terbatas. Namun, setelah bereksperimen, saya akhirnya memahami bahwa membungkus `ListView.builder` tersebut dengan widget `Expanded` adalah solusi yang paling tepat agar daftar buku bisa digulir dengan aman dan fleksibel menyesuaikan sisa ruang layar yang tersedia.