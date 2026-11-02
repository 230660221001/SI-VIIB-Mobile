# Tugas 7: MVP Awal dengan Data Lokal (CRUD)

Tugas ini mengimplementasikan konsep pengelolaan *state* (StatefulWidget & setState) serta Operasi CRUD (Create, Read, Update, Delete) secara *in-memory* tanpa menggunakan *package* eksternal untuk modul pelaporan Laboratorium Komputer.

**Refleksi**
Bagian yang paling sulit dipertahankan konsistensinya adalah memastikan *state* pada `HalamanDaftarLaporan` selalu sinkron dengan aksi penambahan data dari rute `FormPelaporan` karena perbedaan konteks widget. Merancang struktur awal pada dokumen model data agar benar-benar mencerminkan kebutuhan antarmuka menuntut iterasi berulang agar tidak ada *field* yang mubazir. Memastikan setiap mutasi list selalu dibungkus `setState` dan mencari index menggunakan pencocokan ID unik dibandingkan index urutan membutuhkan ketelitian ekstra agar kode terhindar dari *RangeError*.

**Deklarasi Penggunaan AI:** AI Assistant — membantu menata logika struktural form *return value* via navigator dan melengkapi draf kode `indexWhere` untuk fungsi pembaruan *state*; hasilnya disesuaikan dan di-review kembali dengan kebutuhan MVP.
