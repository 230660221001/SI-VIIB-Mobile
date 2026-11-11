# Tugas 7 — MVP Awal dengan Data Lokal

- **Nama:** Ridho Akmal Aulia
- **NIM:** 230660221024
- **Kelas:** SI-VIIB
- **Domain Sistem:** Aplikasi Absensi Organisasi Mahasiswa

## Deskripsi Singkat

Tugas ini mengimplementasikan fitur CRUD (Create, Read, Update, Delete) pada data lokal (in-memory) untuk aplikasi Absensi Organisasi Mahasiswa. Data kegiatan disimpan dalam `List<DataKegiatan>` pada `State`. Pengguna dapat menambah kegiatan baru (Create) melalui form, melihat daftar kegiatan (Read), mengubah status sesi absensi (Update), dan menghapus kegiatan (Delete) melalui menu popup dengan konfirmasi `AlertDialog`.

## Berkas Tugas

- `model-data.md` — Definisi entitas, field, dan sumber nilai.
- `crud-lokal.dart` — Kode implementasi CRUD di Flutter.
- `screenshot-daftar.png` — Bukti daftar berisi data hasil tambah (Create & Read).
- `screenshot-hapus.png` — Bukti dialog konfirmasi hapus muncul (Delete).
- `catatan-keputusan-data.md` — Alasan pemilihan field, ID, dan operasi CRUD.
- `README.md` — Dokumentasi ini.

## Refleksi (3 Kalimat)

Bagian yang paling sulit dipertahankan konsistensinya adalah memastikan setiap perubahan pada `List` data benar-benar dibungkus dengan `setState` agar UI langsung ter-render ulang. Selain itu, penggunaan ID unik dari *timestamp* sangat krusial saat mengubah atau menghapus data agar tidak salah sasaran jika ada nama kegiatan yang sama. Dari proses ini, saya belajar bahwa pengelolaan state yang tepat adalah kunci agar aplikasi terasa responsif dan data yang ditampilkan selalu akurat.

## Deklarasi Penggunaan AI

Deklarasi penggunaan AI: AI coding assistant — membantu menyusun struktur state `List`, logika `indexWhere` untuk update, dan `removeWhere` untuk delete; seluruh alur dan kode ditinjau ulang oleh penulis.