Struktur widget tersebut digunakan untuk membuat halaman aplikasi yang menampilkan judul halaman, petunjuk kepada pengguna, dan daftar jenis surat yang dapat dipilih. Setiap widget memiliki fungsi berbeda dalam membangun tampilan aplikasi Flutter.

## Fungsi setiap widget

1. MaterialApp

   MaterialApp merupakan widget utama yang menyediakan struktur dasar aplikasi dengan desain Material Design. Widget ini dapat mengatur tema, navigasi, dan halaman awal aplikasi.

   Alasan: penggunaan MaterialApp memudahkan pengembang membangun aplikasi dengan komponen tampilan yang konsisten sesuai standar desain Flutter.

2. Scaffold

   Scaffold menyediakan kerangka dasar halaman, seperti AppBar, body, FloatingActionButton, dan Drawer.

   Alasan: widget ini memudahkan pengembang menyusun bagian-bagian utama halaman aplikasi, misalnya halaman daftar surat yang memiliki bilah judul dan area konten.

3. AppBar

   AppBar merupakan bilah bagian atas halaman yang biasanya menampilkan judul atau tombol navigasi. Pada kode tersebut, AppBar menampilkan judul Daftar Surat melalui Text('Daftar Surat').

   Alasan: judul membantu pengguna mengetahui halaman yang sedang dibuka.

4. Column

   Column digunakan untuk menyusun beberapa widget anak secara vertikal, dari atas ke bawah. Pada kode tersebut, Column menempatkan teks petunjuk di atas daftar surat.

   Alasan: susunan vertikal membuat informasi dan pilihan surat lebih mudah dibaca secara berurutan.

5. Text

   Text digunakan untuk menampilkan teks pada layar. Dalam kode tersebut, Text('Pilih jenis surat') memberikan petunjuk kepada pengguna agar memilih jenis surat yang dibutuhkan.

   Alasan: petunjuk ini membantu pengguna memahami tindakan yang perlu dilakukan sebelum mengajukan surat.

6. ListView.builder

   ListView.builder digunakan untuk menampilkan daftar widget yang dapat digulir (scrollable). Widget ini membangun item daftar sesuai kebutuhan, sehingga cocok untuk daftar surat yang jumlahnya banyak atau berubah-ubah.

   Alasan: mahasiswa dapat melihat berbagai pilihan surat tanpa harus menampilkan seluruh item sekaligus dalam satu area yang terbatas.

## Masalah jika ListView.builder berada langsung di dalam Column

Salah satu masalah yang dapat terjadi adalah layout error karena tinggi ListView.builder tidak dibatasi. Secara default, Column memberikan ruang vertikal berdasarkan kebutuhan anak-anaknya, sedangkan ListView.builder ingin menggunakan ruang untuk daftar yang dapat digulir. Jika batas tinggi yang sesuai tidak tersedia, Flutter dapat menampilkan error seperti “Vertical viewport was given unbounded height”.

Masalah ini terjadi karena ListView.builder membutuhkan batas ukuran tinggi agar Flutter dapat menentukan area daftar yang dapat digulir.

Cara memperbaikinya: bungkus ListView.builder menggunakan widget Expanded, sehingga daftar menggunakan sisa ruang yang tersedia di dalam Column.

### Contoh perbaikannya:

```js
MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text('Daftar Surat'),
    ),
    body: Column(
      children: [
        Text('Pilih jenis surat'),
        Expanded(
          child: ListView.builder(
            itemCount: daftarSurat.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(daftarSurat[index]),
              );
            },
          ),
        ),
      ],
    ),
  ),
);
```

Pada contoh tersebut, Expanded membuat ListView.builder mengisi sisa tinggi yang tersedia setelah widget Text ditampilkan. Dengan demikian, daftar surat dapat digulir tanpa menyebabkan masalah tinggi yang tidak terbatas.

setiap widget memiliki peran dalam membangun antarmuka Flutter. Expanded diperlukan pada struktur ini agar ListView.builder memperoleh batas tinggi yang jelas dan dapat menampilkan daftar surat secara normal.
