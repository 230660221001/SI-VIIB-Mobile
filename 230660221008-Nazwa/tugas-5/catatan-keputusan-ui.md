# Catatan Keputusan UI/UX - Pengaduan Fasilitas Kampus

Berikut adalah tabel keputusan perancangan antarmuka pada Halaman Utama aplikasi Pengaduan Fasilitas Kampus berdasarkan prinsip antarmuka mobile, persona (Felix & Pak Kirill), dan kebutuhan pengguna:

| Keputusan | Pilihan Reka Bentuk | Alasan (Merujuk Kebutuhan / Persona / Prinsip UI) |
|:----------|:--------------------|:---------------------------------------------------|
| **Warna Benih (Theme Seed)** | `Colors.indigo` (`ColorScheme.fromSeed`) | Memberikan kesan profesional, tenang, dan terpercaya untuk aplikasi resmi kampus, serta selaras dengan standar Material Design 3. |
| **Bentuk Status** | `Chip` dengan warna dinamis (Hijau = Selesai, Oranye = Diproses, Merah = Menunggu) | Menerapkan prinsip *feedback visual* instan agar Felix dan Pak Kirill dapat langsung membedakan urgensi dan progres perbaikan tanpa perlu membaca detail teks terlebih dahulu. |
| **Posisi Aksi Utama** | `FloatingActionButton.extended` di pojok kanan bawah | Menerapkan prinsip target sentuh yang memadai dan keterlihatan (*visibility*) tinggi, memisahkan aksi utama "Buat Laporan" dari daftar gulir agar mudah dijangkau jempol saat mobilitas tinggi. |
| **Hierarki Teks** | Judul fasilitas tebal (16px, bold), kategori & pelapor lebih kecil/redup (12px) | Menerapkan prinsip *hierarki visual* agar perhatian utama pengguna langsung tertuju pada objek fasilitas yang rusak terlebih dahulu sebelum membaca rincian kendala. |