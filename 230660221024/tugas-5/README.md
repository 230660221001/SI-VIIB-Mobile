# Tugas 5 --- Prototype UI/UX

-   **Nama:** Ridho Akmal Aulia
-   **NIM:** 230660221024
-   **Kelas:** SI-VIIB
-   **Mata Kuliah:** Pemrograman Aplikasi Bergerak
-   **Domain Sistem:** Aplikasi Absensi Organisasi Mahasiswa

## Deskripsi Singkat

Tugas ini menerjemahkan dokumen kebutuhan pada Tugas 4 menjadi
*Information Architecture* (IA), wireframe low-fidelity, dan
implementasi layar utama menggunakan Flutter. Layar utama menampilkan
daftar kegiatan organisasi beserta status sesi absensi, yaitu
**Dibuka**, **Ditutup**, dan **Belum Dibuka**.

Implementasi menggunakan tema terpusat melalui `ThemeData`, kartu daftar
dengan kombinasi `Card` dan `ListTile`, indikator status berwarna, serta
tombol aksi utama `FloatingActionButton.extended`. Keadaan kosong
(*empty state*) juga disediakan agar layar tetap memberikan informasi
ketika belum ada kegiatan yang dapat ditampilkan.

## Tujuan Prototype

1.  Menggambarkan susunan dan hubungan antarhalaman melalui *Information
    Architecture*.
2.  Menyusun wireframe low-fidelity sebagai rancangan awal tata letak
    antarmuka.
3.  Menerapkan rancangan layar utama ke dalam kode Flutter.
4.  Menjaga konsistensi tampilan melalui penggunaan tema dan komponen UI
    yang terstruktur.
5.  Menampilkan informasi status sesi absensi secara jelas kepada
    pengguna.

## Berkas Tugas

  -----------------------------------------------------------------------
  Nama Berkas                         Keterangan
  ----------------------------------- -----------------------------------
  `information-architecture.md`       Inventaris layar dan diagram
                                      *Information Architecture*.

  `wireframe.png`                     Wireframe low-fidelity yang
                                      mencakup dua layar.

  `halaman-utama.dart`                Implementasi layar utama
                                      menggunakan Flutter.

  `screenshot-halaman.png`            Bukti tampilan aplikasi saat
                                      dijalankan di Chrome atau DartPad.

  `catatan-keputusan-ui.md`           Tabel keputusan desain UI beserta
                                      alasan pemilihannya.

  `README.md`                         Dokumentasi tugas, tujuan
                                      prototype, daftar berkas, refleksi,
                                      dan deklarasi penggunaan AI.
  -----------------------------------------------------------------------

## Refleksi

Bagian yang paling sulit dipertahankan konsistensinya adalah memastikan
warna status (`Chip`) pada kode benar-benar diambil dari
`Theme.of(context).colorScheme` dan bukan dari warna statis, karena hal
ini menuntut pemahaman yang lebih baik tentang Material 3. Selain itu,
menyeimbangkan penggunaan `Expanded` dan `ListView.builder` agar tidak
terjadi *RenderFlex overflow* membutuhkan ketelitian pada struktur
widget tree. Dari proses ini, saya belajar bahwa wireframe yang jelas
dan anotasi kebutuhan yang tepat sangat mempercepat proses penerjemahan
desain ke dalam kode Flutter.

## Deklarasi Penggunaan AI

AI coding assistant digunakan untuk membantu menerapkan
`ColorScheme.fromSeed`, menyusun widget `KartuKegiatan`, dan menerapkan
logika ternary pada `ChipStatus`. Seluruh kode, *Information
Architecture*, dan keputusan UI ditinjau serta disesuaikan oleh penulis.

## Catatan Sebelum Pengumpulan

-   Pastikan seluruh berkas yang tercantum pada bagian **Berkas Tugas**
    tersedia di folder Tugas 5.
-   Pastikan `halaman-utama.dart` dapat dijalankan pada project Flutter.
-   Ambil `screenshot-halaman.png` dari aplikasi yang benar-benar sudah
    dijalankan.
-   Periksa kembali kesesuaian wireframe, IA, catatan keputusan UI, dan
    implementasi Flutter.
