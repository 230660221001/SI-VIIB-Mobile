# Tugas 5: Prototype UI/UX — CeriaReads
**Nama:** Yelly Ambarwaty  
**NIM:** 230660221033  
**Kelas:** SI-VIIB  

Dokumen dan implementasi pada folder ini berisi perancangan Information Architecture (IA), Wireframe low-fidelity, catatan keputusan UI/UX, serta berkas kode Flutter `halaman-utama.dart` untuk aplikasi **CeriaReads (Panti Baca Ceria)**.

## Refleksi
Bagian yang paling sulit dipertahankan konsistensinya adalah menyelaraskan batas-batas area pada wireframe low-fidelity dengan komponen widget nyata di Flutter agar tetap memenuhi catatan keputusan hierarki visual yang telah ditetapkan. Hal ini terjadi karena saat menerjemahkan sketsa kasar ke dalam kode Dart, terdapat penyesuaian spasi dan batas margin yang harus diperhitungkan secara presisi agar tidak memicu pesan *RenderFlex overflow*. Namun, dengan memanfaatkan tema terpusat `ThemeData` serta pengujian kondisi *empty state*, konsistensi antarmuka antara rancangan dan kode berhasil dijaga dengan baik.

---
Deklarasi penggunaan AI: Gemini — membantu menyusun draf struktur layout Flutter dan optimasi skema warna Material 3; seluruh keputusan desain dan isi dokumen dirumuskan ulang oleh penulis.