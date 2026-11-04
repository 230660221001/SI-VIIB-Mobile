# Tugas 6: Navigation Flow dan Interaksi
**Nama:** Yelly Ambarwaty  
**NIM:** 230660221033  

Dokumen dan kode di repositori ini mencakup hasil pengerjaan Tugas 6 untuk aplikasi CeriaReads, yang meliputi perancangan peta navigasi (Navigation Flow), manajemen routing layar, *data passing*, serta validasi formulir interaktif.

## Refleksi
Bagian yang paling sulit dipertahankan konsistensinya adalah memastikan *arguments* data buku yang mengalir dari layar katalog menuju detail dan form tetap aman dari potensi *error null* apabila terjadi perubahan nama variabel di tengah pengerjaan. Hal ini menantang karena Dart mengharuskan pemeriksaan tipe data secara eksplisit di setiap layar penerima untuk mencegah layar macet ketika rute tidak menemukan data. Menyelaraskan nama rute di tabel desain dengan struktur `routes` di dalam kode `MaterialApp` juga membutuhkan ketelitian agar proses perpindahan *pushNamed* tidak gagal saat tombol ditekan.

---