# 1.5 Catatan Keputusan UI/UX — Aplikasi RadiAct (UNSAP Radio)

Berikut adalah tabel alasan keputusan desain antarmuka (UI/UX) pada aplikasi mobile RadiAct:

| Keputusan | Pilihan Anda | Alasan (merujuk kebutuhan/persona/prinsip) |
| :--- | :--- | :--- |
| **Warna benih** | `Colors.amber` (Kuning Emas UNSAP Radio) | Menyesuaikan dengan *brand identity* dan logo resmi UKM UNSAP Radio yang didominasi warna kuning/amber, sehingga menciptakan konsistensi visual yang menarik dan mudah dikenali oleh pengurus/crew. |
| **Bentuk status** | `Chip` terpisah dengan tri-state warna (Hijau = Tayang, Biru = Progres, Merah = Terkendala) | Memudahkan crew radio (*persona user*) dalam melakukan scanning cepat terhadap status siaran/program tanpa perlu membaca teks secara detail. |
| **Posisi aksi utama** | `FloatingActionButton` melayang di tengah bawah (`centerFloat`) | Memudahkan aksesibilitas jempol crew saat memegang HP satu tangan untuk menambah jadwal baru secara cepat dan intuitif. |
| **Hierarki teks** | Penggunaan `titleMedium` tebal untuk Judul Program, `bodySmall` murni untuk Divisi/Tanggal, serta ukuran statistik besar pada Card Ringkasan | Memperjelas hierarki informasi (paling penting: Judul Program dan Ringkasan Angka) agar perhatian user langsung tertuju pada poin utama jadwal siaran. |