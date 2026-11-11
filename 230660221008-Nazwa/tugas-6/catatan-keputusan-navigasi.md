# Catatan Keputusan Navigasi dan Interaksi - Pengaduan Fasilitas Kampus

Berikut adalah tabel keputusan perancangan alur navigasi, pengiriman data, validasi form, dan umpan balik (*feedback*) pada aplikasi Pengaduan Fasilitas Kampus:

| Keputusan | Pilihan Reka Bentuk | Alasan (Merujuk IA / Kebutuhan / Prinsip UI) |
|:----------|:--------------------|:--------------------------------------------|
| **Nama Route** | Peta route bernama terpusat: `/` (Utama), `/form` (Form Pengaduan), `/detail` (Detail Laporan) | Menjaga satu sumber kebenaran (*single source of truth*) sesuai *Information Architecture* Tugas 5 dan mempermudah keterlacakan perpindahan layar tanpa *hardcode*. |
| **Data Antarlayar** | Pengiriman objek `LaporanFasilitas` melalui `arguments` pada `Navigator.pushNamed` secara *read-only* | Memenuhi kebutuhan F-04 agar halaman detail dapat menampilkan informasi spesifik fasilitas yang dipilih dari daftar tanpa mengubah state data utama. |
| **Validator Tiap Field** | Pemeriksaan `value == null \|\| value.trim().isEmpty` pada *field* Nama Fasilitas, Kategori, dan Detail Kendala | Memastikan kelengkapan data pengaduan sebelum dikirim ke sistem untuk mencegah pengiriman form kosong atau spasi murni. |
| **Feedback Tiap Aksi** | Pesan kesalahan merah di bawah *field* saat validasi gagal, serta `SnackBar` warna *indigo* setelah aksi kirim berhasil | Memberikan umpan balik visual yang jelas bagi pengguna (Felix/Pak Kirill) untuk mengetahui status validasi dan kepastian bahwa pengaduan telah tercatat. |