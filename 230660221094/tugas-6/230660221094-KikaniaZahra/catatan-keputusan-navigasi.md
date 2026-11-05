# Catatan Keputusan Navigasi SIPUSKAM

## 1. Pemilihan Named Routes

Aplikasi menggunakan named routes pada `MaterialApp` agar perpindahan halaman memiliki nama rute yang jelas dan terpusat. Rute yang digunakan adalah `/`, `/detail-buku`, dan `/tambah-buku`.

## 2. Pengiriman Argumen

Data buku dikirim dari halaman utama menuju halaman detail melalui argumen navigasi. Pendekatan ini memungkinkan halaman detail menampilkan informasi sesuai dengan buku yang dipilih pengguna.

## 3. Penanganan Argumen Tidak Valid

Halaman detail perlu memeriksa tipe dan keberadaan argumen sebelum menggunakannya. Pemeriksaan ini membantu mencegah akses terhadap data yang tidak tersedia atau tidak sesuai dengan tipe yang diharapkan.

## 4. Validasi Form

Form tambah buku menggunakan `Form`, `GlobalKey<FormState>`, dan fungsi `validator` untuk memastikan setiap kolom wajib telah diisi sesuai ketentuan. Data hanya diproses apabila validasi berhasil.

## 5. Pengelolaan Controller

Setiap `TextEditingController` yang digunakan untuk input form perlu dibersihkan melalui metode `dispose()` agar sumber daya yang tidak lagi digunakan dapat dilepaskan.

## 6. Pengembalian Hasil dan Umpan Balik

Setelah data dinyatakan valid, halaman form menggunakan `Navigator.pop()` untuk mengembalikan data buku kepada halaman sebelumnya. Halaman utama kemudian dapat menampilkan `SnackBar` sebagai umpan balik kepada pengguna setelah penambahan berhasil.

## 7. Konsistensi Implementasi

Nama rute, alur pada `navigation-flow.md`, kode pada `form-interaksi.dart`, dan dokumentasi pada file ini harus saling sesuai. Jika implementasi kode berubah, diagram dan catatan keputusan perlu diperbarui agar tetap menggambarkan perilaku aplikasi yang sebenarnya.