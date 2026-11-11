`List<String>` adalah daftar yang dapat menyimpan beberapa nilai bertipe teks (`String`). Variabel `daftarSurat` awalnya kosong dan nantinya menampung jenis surat yang ditambahkan.

Parameter `String jenis` adalah teks yang diterima fungsi `tambahSurat` saat dipanggil. Properti `isEmpty` memeriksa apakah teks tersebut kosong. Jika kosong, program mencetak pesan kesalahan lalu menjalankan `return` untuk menghentikan fungsi sehingga data tidak diteruskan ke proses penambahan.

Method `add(jenis)` menambahkan jenis surat ke dalam daftar. Pada fungsi `tampilkanSurat`, perulangan `for` mengakses setiap elemen berdasarkan indeks dari awal sampai akhir daftar. Nomor `i + 1` digunakan agar urutan yang tampil dimulai dari angka 1.

Jika validasi `isEmpty` dihapus, nilai kosong dapat ikut tersimpan dan membuat daftar berisi data yang tidak berguna. Perlu diingat bahwa teks yang hanya berisi spasi tidak dianggap kosong oleh `isEmpty`; pemeriksaan yang lebih baik dapat menggunakan `jenis.trim().isEmpty`.
