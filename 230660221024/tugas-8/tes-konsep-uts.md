# Tes Konsep UTS — Ridho Akmal Aulia 230660221024

## Soal 1 — Konsep Aplikasi Bergerak dalam SI
1. **Karakteristik: Portabilitas (Mudah dibawa).**
   **Contoh penerapan:** Anggota organisasi bisa melakukan check-in absensi langsung dari ponsel di lokasi kegiatan (seperti aula atau lapangan) tanpa perlu membawa laptop atau mengantri di depan panitia yang memegang kertas absen.
2. **Karakteristik: Interaksi Sentuh (Touch interaction).**
   **Contoh penerapan:** Antarmuka aplikasi didesain dengan tombol check-in yang besar dan mudah ditekan menggunakan jempol, sehingga anggota bisa melakukan absensi dengan cepat meskipun sedang berdiri atau berjalan.
3. **Karakteristik: Sesi Penggunaan Singkat.**
   **Contoh penerapan:** Anggota hanya perlu membuka aplikasi, memilih kegiatan yang sedang berlangsung, lalu menekan tombol absen. Proses selesai dalam hitungan detik karena tujuannya hanya mencatat kehadiran, berbeda dengan aplikasi desktop yang butuh waktu buka-tutup lebih lama.

## Soal 2 — Dasar Pemrograman Dart
- **`List<String> daftarKegiatan = []`**: Mendeklarasikan variabel bernama `daftarKegiatan` yang bertipe List (array) dan hanya bisa menampung data teks (String).
- **Parameter `String jenis`**: Menerima input nilai berupa teks saat fungsi dipanggil (misal isinya "Rapat Rutin").
- **`jenis.isEmpty`**: Mengecek apakah string yang dimasukkan kosong atau tidak ada isinya.
- **`return` pada kondisi error**: Menghentikan eksekusi fungsi saat itu juga jika terjadi error (kosong), sehingga kode di bawahnya (seperti proses simpan) tidak akan dijalankan.
- **`daftarKegiatan.add(jenis)`**: Memasukkan data string baru ke dalam urutan paling belakang pada List.
- **Perulangan `for`**: Mengulang proses cetak data dari indeks ke-0 sampai indeks terakhir agar seluruh isi List bisa ditampilkan satu per satu.
- **Kesalahan umum bila validasi isEmpty dihapus**: Aplikasi akan menyimpan data kosong (string tanpa karakter) ke dalam List, yang menyebabkan data di layar menjadi tidak valid atau aplikasi bisa *crash* (error) saat memproses data kosong tersebut.

## Soal 3 — Struktur Flutter dan Widget
- **`MaterialApp`**: Membungkus seluruh aplikasi dan menyediakan tema desain Material (warna, font).
- **`Scaffold`**: Menyediakan kerangka dasar halaman (seperti kanvas kosong) yang memiliki slot untuk AppBar dan body.
- **`AppBar`**: Bilah judul di bagian paling atas halaman aplikasi.
- **`Column`**: Menyusun widget anaknya (Text dan ListView) secara vertikal (dari atas ke bawah).
- **`Text`**: Menampilkan teks statis seperti "Pilih jenis surat".
- **`ListView.builder`**: Menampilkan daftar data yang bisa digulir (scroll) dan hanya merender item yang terlihat di layar agar aplikasi tetap ringan.
- **Masalah bila ListView.builder di dalam Column tanpa Expanded**: Akan terjadi **RenderFlex Overflow** (garis kuning/hitam). 
- **Penyebab**: Column tidak memiliki batas tinggi maksimal, sementara ListView ingin memanjang tanpa batas, sehingga Flutter bingung mengatur ruangnya.
- **Perbaikan**: Bungkus `ListView.builder` dengan widget `Expanded(child: ListView.builder(...))` agar ListView mengambil sisa ruang yang tersedia di dalam Column.

## Soal 4 — Analisis Kebutuhan dan User Flow
**Klasifikasi dan prioritas:**

| No. | Permintaan | Fungsional/Nonfungsional | Prioritas MoSCoW | Alasan |
|:---:|:-----------|:-------------------------|:----------------:|:-------|
| 1 | Mengajukan surat keterangan aktif | Fungsional | **Must have** | Tanpa fitur ini, aplikasi tidak bisa melakukan tugas utamanya (menggantikan antrian manual). |
| 2 | Melihat status pengajuan | Fungsional | **Must have** | Pengguna butuh tahu sejauh mana suratnya diproses agar tidak kebingungan. |
| 3 | Notifikasi saat surat siap | Nonfungsional (Kegunaan/Feedback) | **Could have** | Sangat membantu, tetapi pengguna tetap bisa mengecek status secara manual (F-02) jika notifikasi belum ada. Bisa ditunda. |

**User flow untuk kebutuhan Must:**
1. Mulai: Mahasiswa membuka aplikasi.
2. Halaman Utama: Mahasiswa melihat daftar jenis surat.
3. Mahasiswa memilih "Surat Keterangan Aktif Kuliah".
4. Mahasiswa mengisi form data diri.
5. Sistem memvalidasi data. Jika gagal, kembali ke form (menampilkan error).
6. Jika valid, sistem menyimpan pengajuan dengan status "Menunggu".
7. Tujuan Tercapai: Halaman konfirmasi pengajuan berhasil dibuat.

## Soal 5 — UI/UX Mobile
1. **Prinsip: Hierarki Visual.**
   **Keputusan desain:** Membuat teks Nama Surat menggunakan font yang lebih besar dan tebal (titleMedium), sedangkan teks status menggunakan ukuran lebih kecil.
   **Alasan:** Agar mata pengguna langsung tertuju pada informasi utama saat pertama kali melihat layar, tanpa perlu membaca detail kecil lainnya.
2. **Prinsip: Target Sentuh Memadai.**
   **Keputusan desain:** Menggunakan `ListTile` untuk setiap item surat dan `FilledButton` untuk tombol ajukan dengan ukuran yang cukup besar (minimal 48x48 dp).
   **Alasan:** Jari manusia lebih besar dari kursor mouse. Tombol yang besar mengurangi risiko salah tekan saat pengguna berinteraksi di layar ponsel.
3. **Prinsip: Feedback.**
   **Keputusan desain:** Menambahkan efek `splashColor` (warna biru berkedip) saat item surat diketuk, dan menampilkan `SnackBar` setelah pengajuan dikirim.
   **Alasan:** Memberikan respons instan bahwa aplikasi mendeteksi ketukan pengguna dan memproses aksinya, sehingga aplikasi tidak terasa "macet" atau diam.

## Soal 6 — Navigasi dan Interaksi
- **Metode navigasi dan kapan digunakan:**
  - `push`: Menavigasi ke halaman baru tanpa nama (menggunakan `MaterialPageRoute`), biasanya saat butuh mengirim data langsung. (Pada tugas kita lebih sering pakai `pushNamed`).
  - `pushNamed`: Berpindah halaman berdasarkan nama route (misal `'/detail'`). Digunakan agar kode navigasi terpusat dan rapi.
  - `pop`: Kembali ke halaman sebelumnya dengan menghapus tumpukan halaman teratas dari *stack*.
- **Pengiriman data jenis surat ke halaman form:** Menggunakan parameter `arguments` pada `Navigator.pushNamed`. Di halaman form, data ditangkap dengan `ModalRoute.of(context)?.settings.arguments` lalu dicek tipenya (`is String` atau `is Model`).
- **Feedback setelah form dikirim:** Menampilkan `SnackBar` di bagian bawah layar (contoh: *"Pengajuan berhasil dikirim"*), lalu memanggil `Navigator.pop` untuk kembali ke halaman daftar.

## Soal 7 — Model Data dan State
- **Mengapa setiap field bersifat final**: Agar data tidak bisa diubah secara tidak sengaja (immutable). Jika ingin mengubah (misal status berubah), kita harus membuat objek baru dengan data yang diperbarui. Ini membuat aliran data lebih aman dan mudah dilacak.
- **Mengapa id wajib ada**: Sebagai kunci unik untuk membedakan satu data dengan data lain. Jika ada 2 pengajuan dengan nama yang sama, ID memastikan kita mengedit atau menghapus pengajuan yang tepat.
- **Perbedaan StatelessWidget dan StatefulWidget**: `StatelessWidget` bersifat statis (tidak berubah). `StatefulWidget` memiliki `State` yang bisa berubah-ubah dan memicu render ulang layar.
- **Halaman daftar menggunakan**: `StatefulWidget`.
- **Alasan**: Karena data daftar pengajuan akan bertambah (Create) atau berkurang (Delete), layar harus bisa diperbarui (re-render) secara dinamis.
- **Fungsi setState**: Memberi tahu framework Flutter bahwa ada perubahan data pada state, sehingga Flutter akan memanggil ulang fungsi `build()` untuk memperbarui tampilan layar.
- **Apa yang terjadi bila data ditambah tanpa setState**: Data di dalam List sebenarnya bertambah di memori, tetapi layar UI tidak akan berubah (data baru tidak muncul di layar).

## Soal 8 — CRUD Lokal
| Operasi | Method List / mekanisme |
|:--------|:------------------------|
| Create  | `daftar.add(objekBaru)` |
| Read    | `ListView.builder` membaca `daftar[index]` |
| Update  | `daftar[index] = objekBaru` (dicari dulu pakai `indexWhere`) |
| Delete  | `daftar.removeWhere((item) => item.id == id)` |

- **Mengapa id digunakan sebagai kunci update dan delete**: Karena ID bersifat unik dan permanen pada objek. Index bisa berubah jika ada data yang dihapus atau diurutkan ulang.
- **Konsekuensi bila index digunakan sebagai kunci**: Jika kita menghapus data di indeks ke-0, maka data di indeks ke-1 akan bergeser menjadi indeks ke-0. Jika pengguna menekan "hapus" pada data yang salah karena indeksnya sudah bergeser, data yang salah akan terhapus.

## Soal 9 — Persistensi Data Lokal
- **Perbedaan in-memory dan persistensi**: In-memory (List) hanya menyimpan data di RAM selama aplikasi berjalan dan akan hilang saat ditutup. Persistensi (`shared_preferences`) menyimpan data ke memori fisik perangkat sehingga data tetap ada meskipun aplikasi ditutup atau ponsel di-restart.
- **Mengapa operasi shared_preferences asinkron (Future)**: Karena proses baca/tulis ke memori perangkat butuh waktu (walau singkat). Menggunakan `Future` mencegah aplikasi membeku (freeze) saat menunggu proses penyimpanan selesai.
- **Apa yang terjadi bila await diabaikan**: Kode di bawahnya akan langsung dieksekusi tanpa menunggu proses simpan selesai. Bisa jadi data gagal tersimpan, atau UI menampilkan data yang belum sepenuhnya dimuat (race condition).
- **Contoh situasi in-memory sudah cukup**: Menyimpan daftar *filter* sementara atau status buka-tutup menu di halaman aplikasi.
- **Contoh situasi persistensi mutlak diperlukan**: Menyimpan data riwayat absensi atau data profil pengguna yang harus tetap ada saat besok aplikasi dibuka kembali.

## Soal 10 — Integrasi Konsep Lintas Pertemuan
1. **Arsitektur:** Aplikasi mobile (Flutter) berjalan di ponsel pengguna, mengambil/mengirim data via HTTP Request (JSON) ke Backend SI (misal Node.js/PHP). Backend terhubung ke Database (MySQL). Aplikasi mobile juga bisa menyimpan *cache* data lokal sementara agar bisa diakses offline.
2. **Kebutuhan & Alur:** Kebutuhan Must: (1) Anggota bisa melihat daftar kegiatan, (2) Anggota bisa check-in. Alur: Buka aplikasi -> Login -> Lihat daftar kegiatan -> Pilih kegiatan -> Tekan tombol check-in -> Dapat notifikasi berhasil.
3. **Struktur Komponen:** Halaman Katalog menggunakan `Scaffold` + `ListView.builder`. Halaman Form menggunakan `Form` + `TextFormField`. Navigasi antarhalaman menggunakan `Navigator.pushNamed`.
4. **Data & State:** Model `Buku`: `id` (String), `judul` (String), `penulis` (String), `status` (String). Create (meminjam) dikelola dengan menambahkan objek baru ke `List<Buku>` di dalam `setState`. Read (riwayat) dikelola dengan menampilkan data dari List menggunakan `ListView.builder`.