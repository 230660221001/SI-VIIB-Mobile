# Tugas 7 — MVP Awal dengan Data Lokal

## Deskripsi Singkat

SIPORA (Sistem Informasi Pengajuan Observasi dan Riset Akademik) merupakan rancangan aplikasi yang membantu mahasiswa mengelola pengajuan surat observasi dan penelitian akademik. Pada Tugas 7, pengembangan difokuskan pada implementasi Minimum Viable Product (MVP) awal dengan pengelolaan data lokal menggunakan Flutter.

Implementasi dilakukan melalui file `crud-lokal.dart` dengan model data `PengajuanSurat` dan `AnggotaPengajuan`. Fitur yang dikembangkan meliputi penambahan pengajuan melalui formulir (*Create*), penampilan daftar dan detail pengajuan (*Read*), perubahan informasi pengajuan (*Update*), serta penghapusan pengajuan melalui dialog konfirmasi (*Delete*). Setiap pengajuan memiliki ID sebagai identitas unik yang digunakan dalam proses pembaruan dan penghapusan data.

Data disimpan dalam list pada `State` sehingga perubahan dapat ditampilkan langsung pada antarmuka menggunakan `setState`. Pada tahap ini, data belum disimpan secara permanen dan dapat hilang ketika state aplikasi dibuat ulang.

## Refleksi

Bagian yang paling sulit adalah menjaga konsistensi antara kebutuhan pengguna, field pada model data, dan operasi CRUD agar setiap informasi yang dibutuhkan dapat dikelola dengan benar. Konsistensi tersebut perlu diperhatikan karena perubahan pada model harus sesuai dengan data yang dikirim formulir, ditampilkan pada daftar dan detail, serta digunakan kembali ketika pengajuan diperbarui atau dihapus. Melalui pengerjaan ini, saya memahami pentingnya menentukan struktur data dan identitas unik sejak awal agar pengelolaan data lokal berjalan secara teratur dan sesuai dengan kebutuhan aplikasi.

## Deklarasi Penggunaan AI

Dalam pengerjaan Tugas 7, saya menggunakan ChatGPT sebagai *coding assistant* untuk membantu memahami konsep model data, implementasi CRUD lokal, serta pemeriksaan kesesuaian kode dengan ketentuan tugas. Saran yang diberikan digunakan sebagai bahan pembelajaran dan ditinjau kembali dengan menyesuaikannya terhadap kebutuhan aplikasi SIPORA serta materi perkuliahan. Tanggung jawab atas pemahaman, pemeriksaan, pengujian, dan hasil akhir kode tetap berada pada saya sebagai mahasiswa.