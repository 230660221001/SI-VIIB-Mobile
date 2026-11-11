Kode tersebut digunakan untuk menyimpan dan menampilkan daftar jenis surat yang diajukan mahasiswa.

## Berikut penjelasan fungsi setiap bagian kode beserta alasannya.

1. List<String> daftarSurat = [];

   List<String> merupakan struktur data berupa daftar yang hanya dapat menyimpan elemen bertipe String atau teks. Variabel daftarSurat digunakan untuk menyimpan jenis-jenis surat, sedangkan [] menunjukkan bahwa daftar tersebut awalnya kosong.

   Contoh: daftar dapat berisi "Surat Keterangan Aktif Kuliah", "Surat Keterangan Lulus", dan "Surat Pengantar".

2. Parameter String jenis

   Parameter String jenis digunakan untuk menerima masukan berupa teks ketika fungsi tambahSurat() dipanggil. Parameter ini menentukan jenis surat yang akan dimasukkan ke dalam daftar.

   Contoh: tambahSurat('Surat Keterangan Aktif Kuliah'); akan mengirimkan teks tersebut sebagai nilai parameter jenis.

3. isEmpty

   Properti isEmpty digunakan untuk memeriksa apakah sebuah teks kosong. Pada kode tersebut, jenis.isEmpty bernilai true jika variabel jenis tidak memiliki karakter.

   Alasan: validasi ini diperlukan agar sistem tidak menyimpan data jenis surat yang kosong, sehingga data pengajuan menjadi lebih jelas dan dapat digunakan.

4. return pada kondisi error

   Perintah return digunakan untuk menghentikan eksekusi fungsi saat kondisi tertentu terpenuhi. Dalam kode tersebut, jika jenis kosong, sistem menampilkan pesan kesalahan lalu menjalankan return.

   Alasan: tanpa return, program akan melanjutkan eksekusi ke perintah berikutnya sehingga data yang tidak valid berpotensi tetap ditambahkan ke daftar.

5. daftarSurat.add(jenis);

   Metode add() digunakan untuk menambahkan nilai jenis ke dalam daftar daftarSurat.

   Contoh: jika jenis berisi "Surat Pengantar", maka teks tersebut akan disimpan sebagai salah satu elemen dalam daftar. Penambahan ini dilakukan setelah data melewati validasi.

6. Perulangan for

   Perulangan for digunakan untuk mengakses setiap elemen dalam daftar berdasarkan indeksnya. Variabel i dimulai dari 0 dan bertambah selama nilainya lebih kecil dari daftarSurat.length, yaitu jumlah elemen dalam daftar.

   Pada perintah print('${i + 1}. ${daftarSurat[i]}');, i + 1 digunakan agar nomor yang ditampilkan dimulai dari 1, sedangkan daftarSurat[i] mengambil jenis surat sesuai indeksnya.

   Alasan: perulangan ini memudahkan sistem menampilkan seluruh daftar surat secara berurutan tanpa harus menulis perintah print() untuk setiap surat secara manual.

## Satu kesalahan umum jika validasi isEmpty dihapus

Jika validasi isEmpty dihapus, pengguna dapat menambahkan teks kosong ke dalam daftar surat. Akibatnya, daftar bisa memiliki entri tanpa nama jenis surat, misalnya:

```js
tambahSurat("");
tampilkanSurat();
```

Hasilnya dapat terlihat seperti berikut:

```js
1.
```

Hal ini membuat data menjadi tidak valid dan membingungkan pengguna maupun petugas administrasi karena terdapat entri surat tanpa keterangan jenis surat. Oleh karena itu, validasi isEmpty penting untuk menjaga kualitas data yang disimpan.
