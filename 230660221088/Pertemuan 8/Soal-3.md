`MaterialApp` merupakan widget utama yang mengatur aplikasi dengan desain Material. `Scaffold` menyediakan kerangka halaman, seperti area `AppBar` dan `body`. `AppBar` menampilkan bagian atas halaman, misalnya judul “Daftar Surat”.

`Column` menyusun widget anak secara vertikal. `Text` menampilkan tulisan “Pilih jenis surat”, sedangkan `ListView.builder` menampilkan daftar surat secara efisien, terutama ketika jumlah item cukup banyak.

Masalah dapat terjadi karena `Column` tidak otomatis memberikan batas tinggi kepada `ListView.builder`. ListView membutuhkan batas tinggi untuk menentukan area gulir. Jika tidak mendapat batas tersebut, Flutter dapat menampilkan error layout karena tinggi viewport tidak terbatas.

Perbaikannya adalah membungkus `ListView.builder` dengan `Expanded` atau `Flexible`. Dengan demikian, daftar akan menggunakan sisa ruang yang tersedia di dalam `Column` dan dapat digulir dengan benar.
