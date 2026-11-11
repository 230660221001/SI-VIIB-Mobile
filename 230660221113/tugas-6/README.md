# Tugas 6 — Navigation Flow dan Interaksi FasKampus

## 1. Deskripsi Proyek

FasKampus merupakan aplikasi berbasis Flutter yang dirancang untuk membantu pengguna mengenal dan melihat informasi fasilitas kampus. Pada Tugas 6 ini, aplikasi dikembangkan dengan menambahkan alur navigasi ant halaman, interaksi pengguna, form, dan feedback sesuai kebutuhan aplikasi.

Tugas ini merupakan pengembangan dari rancangan halaman yang telah dibuat pada Tugas 5.

## 2. Tujuan Pengerjaan

Tujuan pengerjaan tugas ini adalah:

- Menghubungkan halaman utama dengan halaman detail.
- Menerapkan navigasi menggunakan `Navigator.push()` dan `Navigator.pop()`.
- Menambahkan interaksi yang dapat dilakukan oleh pengguna.
- Menerapkan form dan validasi input jika diperlukan.
- Menampilkan feedback setelah pengguna melakukan tindakan tertentu.
- Memastikan alur aplikasi dapat berjalan dengan baik.

## 3. Teknologi yang Digunakan

- **Flutter** — framework untuk membangun antarmuka aplikasi.
- **Dart** — bahasa pemrograman yang digunakan dalam pengembangan aplikasi.
- **Material Design** — pedoman desain komponen antarmuka Flutter.

## 4. Fitur Aplikasi

Fitur yang dikembangkan dalam tugas ini meliputi:

1. **Halaman Utama**  
   Menampilkan informasi dan daftar fasilitas kampus yang dapat dipilih oleh pengguna.

2. **Halaman Detail Fasilitas**  
   Menampilkan informasi lebih lanjut mengenai fasilitas yang dipilih dari halaman utama.

3. **Navigasi Antarhalaman**  
   Memungkinkan pengguna membuka halaman detail dan kembali ke halaman sebelumnya.

4. **Interaksi Pengguna**  
   Menyediakan tindakan melalui komponen antarmuka, seperti tombol atau pilihan fasilitas.

5. **Feedback Pengguna**  
   Memberikan pesan atau respons terhadap tindakan yang dilakukan pengguna sesuai fitur yang diimplementasikan.

6. **Form dan Validasi**  
   Jika diterapkan, form digunakan untuk menerima masukan pengguna dan memeriksa kelengkapan data sebelum diproses.

## 5. Alur Navigasi

Alur navigasi aplikasi FasKampus adalah sebagai berikut:

```text
Halaman Utama
      |
      v
Pilih Fasilitas
      |
      v
Halaman Detail Fasilitas
      |
      v
Tombol Kembali
      |
      v
Halaman Utama
```

Alur ini dibuat agar pengguna dapat melihat informasi fasilitas dan kembali ke halaman utama dengan mudah.

## 6. Struktur File

Struktur file utama proyek disesuaikan dengan implementasi yang digunakan:

```text
fas_kampus/
├── lib/
│   └── halaman_utama.dart
├── catatan-keputusan-navigasi.md
└── README.md
```

Keterangan:

- `lib/halaman_utama.dart` — berisi kode utama aplikasi FasKampus.
- `catatan-keputusan-navigasi.md` — berisi penjelasan mengenai keputusan desain dan alur navigasi.
- `README.md` — berisi dokumentasi proyek dan petunjuk menjalankan aplikasi.

Jika halaman detail atau file lainnya dipisahkan ke dalam file tersendiri, tambahkan file tersebut ke struktur di atas.

## 7. Cara Menjalankan Aplikasi

Pastikan Flutter sudah terpasang dan dapat dijalankan melalui terminal.

1. Buka terminal pada folder proyek FasKampus.
2. Jalankan perintah berikut untuk mengambil dependensi:

   ```bash
   flutter pub get
   ```

3. Jalankan aplikasi melalui browser Chrome:

   ```bash
   flutter run -d chrome
   ```

4. Coba pilih salah satu fasilitas pada halaman utama untuk membuka halaman detail.
5. Gunakan tombol kembali untuk memastikan navigasi berfungsi dengan benar.
6. Uji interaksi, form, dan feedback yang tersedia pada aplikasi.

## 8. Pengujian

Pengujian dilakukan secara manual dengan memeriksa beberapa hal berikut:

- Halaman utama dapat ditampilkan.
- Fasilitas dapat dipilih oleh pengguna.
- Halaman detail dapat dibuka.
- Tombol kembali dapat digunakan untuk kembali ke halaman utama.
- Tombol atau komponen interaktif memberikan respons sesuai fungsinya.
- Form dan validasi berjalan sesuai rancangan apabila fitur tersebut diterapkan.
- Feedback muncul ketika tindakan tertentu dilakukan apabila fitur tersebut diterapkan.

## 9. Dokumentasi

Dokumentasi tugas dapat dilengkapi dengan tangkapan layar berikut:

- `screenshot-alur.png` — tangkapan layar yang menunjukkan halaman detail terbuka melalui navigasi dari halaman utama.
- `screenshot-feedback.png` — tangkapan layar yang menunjukkan feedback setelah pengguna melakukan tindakan.

Simpan kedua gambar pada folder dokumentasi yang digunakan dalam pengumpulan tugas, lalu sesuaikan lokasi gambar jika ingin menampilkannya langsung di README.

## 10. Kesimpulan

Melalui Tugas 6 ini, aplikasi FasKampus dikembangkan dengan memperhatikan hubungan antarhalaman dan interaksi pengguna. Penerapan navigasi membantu pengguna berpindah halaman, sedangkan form, validasi, dan feedback mendukung proses interaksi sesuai fitur yang diterapkan. Dengan demikian, aplikasi menjadi lebih interaktif dan memiliki alur penggunaan yang lebih jelas.

