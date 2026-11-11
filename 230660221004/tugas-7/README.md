# Tugas 7 — MVP Awal dengan Data Lokal (PresentGo)

**Nama:** <isi nama>
**NIM:** 230660221004

## Deskripsi Tugas

Dokumen ini menyusun model data dan implementasi CRUD lokal untuk entitas Pengajuan Izin pada PresentGo, melanjutkan domain absensi organisasi PT Kencana Makmur Lestari dan kebutuhan F-05 dari Tugas 4. Isinya mencakup model-data.md (daftar entitas, field, dan sumber nilai), implementasi `crud-lokal.dart` (Create, Read, Update, Delete dengan `setState` dan `id` unik), dua tangkapan layar bukti Create/Read dan Delete berjalan, serta catatan keputusan data.

## Refleksi

Bagian yang paling sulit dipertahankan konsistensinya adalah menentukan satu entitas yang benar-benar membutuhkan siklus CRUD penuh: data kehadiran (F-02/F-03/F-04) sebenarnya hanya dicatat dan dibaca sistem tanpa pernah diubah atau dihapus pengguna, sehingga Pengajuan Izin (F-05) dipilih karena pengguna memang perlu mengoreksi atau membatalkan pengajuannya sebelum diproses HRD. Menulis `Update` juga lebih rumit dari dugaan awal karena form yang sama dipakai untuk Create dan Update, sehingga perlu parameter opsional `awal` pada dialog untuk membedakan kedua mode tanpa menduplikasi kode. Menentukan kapan `id` dibuat (hanya sekali saat Create, bukan setiap kali objek disalin pada Update) juga sempat keliru sebelum diperbaiki agar operasi Delete tetap mengacu pada data yang benar.

## Deklarasi Penggunaan AI

Deklarasi penggunaan AI: Claude (Anthropic) — membantu menyusun draf model data, implementasi CRUD lokal (Create, Read, Update, Delete dengan id unik), dan catatan keputusan data berdasarkan domain dan dokumen kebutuhan PresentGo yang sudah ditentukan penulis; keputusan akhir dan implementasi dirumuskan ulang oleh penulis.
