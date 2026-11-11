# Tugas 6 - Navigasi dan Interaksi Mobile

**Nama:** Nazwa  
**Domain SI:** Pengaduan Fasilitas Kampus  

## Deskripsi Singkat
Tugas ini berisi implementasi alur navigasi dan interaksi aplikasi Pengaduan Fasilitas Kampus, meliputi *navigation flow* dengan Mermaid, pemetaan *route* bernama (`Navigator.pushNamed` & `Navigator.pop`), pengiriman data antarlayar melalui `arguments`, pembuatan *form* lengkap dengan validasi dan pembersihan *controller* (`dispose`), serta umpan balik interaksi pengguna (*SnackBar*).

## Refleksi
Bagian yang paling sulit dipertahankan konsistensinya adalah menyelaraskan penamaan *route* dan tipe data *arguments* antara diagram *navigation flow* dengan kode Flutter agar tidak terjadi error saat halaman dibuka. Selain itu, memastikan urutan fungsi saat tombol dikirim bekerja secara presisi—mulai dari pemicuan validasi form, penayangan *SnackBar*, hingga fungsi `pop` kembali ke layar utama—membutuhkan ketelitian alur yang cukup ekstra. Namun, penerapan pola *route* bernama sangat membantu mengorganisasi struktur navigasi aplikasi menjadi lebih rapi dan mudah dilacak.

## Deklarasi Penggunaan AI
Deklarasi penggunaan AI: Gemini — membantu menyusun dokumen *navigation flow*, meracik skrip navigasi dan validasi form `form-interaksi.dart`, serta membuat tabel catatan keputusan navigasi; seluruh hasilnya disesuaikan dan diverifikasi kembali oleh penulis.