# Tugas 8 — UTS: Tes Konsep dan Progress Project (PresentGo)

**Nama:** Rian Rianto
**NIM:** 230660221004
**Kelas:** SI-VIIB

## Deskripsi

Folder ini berisi pengumpulan UTS (M4): jawaban Tes Konsep Soal 1–10, laporan progress project, dan artefak M1–M3 PresentGo (aplikasi absensi PT Kencana Makmur Lestari) yang dibangun pada Tugas 4–7.

## Isi Folder

| Berkas | Isi | Sumber |
|:--|:--|:--|
| `tes-konsep-uts.md` | Jawaban Soal 1–10 | UTS |
| `laporan-progress-uts.md` | Laporan progress mengikuti template Bagian 8 | UTS |
| `kebutuhan.md`, `user-flow.png` | Dokumen kebutuhan dan user flow | Tugas 4 |
| `prototype-ui-ux/` | Information architecture, wireframe, layar utama, catatan keputusan UI | Tugas 5 |
| `navigation-flow.md` | Daftar route dan diagram navigation flow | Tugas 6 |
| `crud-lokal.dart` | Model data dan CRUD lokal Pengajuan Izin | Tugas 7 |
| `main-gabungan.dart` | Aplikasi demo: Beranda, Detail Riwayat, dan CRUD Pengajuan Izin dalam satu aplikasi | Tugas 6 + 7 |
| `screenshot-daftar.png`, `screenshot-form.png`, `screenshot-hapus.png` | Tangkapan layar aplikasi berjalan | UTS |

## Cara Menjalankan Demo

1. Di project hasil `flutter create`, ganti isi `lib/main.dart` dengan isi `main-gabungan.dart`.
2. Jalankan `flutter pub get`, lalu `flutter run -d chrome`.
3. Alur demo: Beranda → ketuk kartu riwayat (Detail) → kembali → "Kelola Izin" → tambah, ubah, dan hapus pengajuan dengan konfirmasi.

## Deklarasi Penggunaan AI

Deklarasi penggunaan AI: Claude (Anthropic) — membantu menyusun draf laporan progress, merapikan format dokumen, dan membangun kode project Minggu 1–7 berdasarkan domain yang ditentukan penulis; perbaikan kode, pengujian, dan penjelasan dilakukan serta diverifikasi oleh penulis. Jawaban Tes Konsep ditulis sendiri oleh penulis; AI hanya memberi masukan atas Soal 4 dan Soal 6 serta merapikan format.
