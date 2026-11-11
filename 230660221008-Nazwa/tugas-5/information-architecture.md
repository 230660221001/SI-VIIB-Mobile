# Information Architecture - Pengaduan Fasilitas Kampus

## 1. Inventaris Layar
* **Halaman Utama (Daftar Laporan)**: Memenuhi F-01 (melihat daftar keluhan), F-03 (mencari laporan), dan menjadi titik masuk menuju form laporan baru.
* **Halaman Form Pengaduan**: Memenuhi F-02 (mengirim laporan kerusakan baru).
* **Halaman Detail Laporan**: Memenuhi F-04 (membaca detail lokasi) dan F-05 (mengubah status perbaikan).

## 2. Diagram Information Architecture

```mermaid
flowchart TD
    H["Layar Utama:<br>Daftar Laporan Fasilitas"] --> F["Form Pengaduan:<br>Input lokasi & kendala kerusakan"]
    H --> D["Detail Laporan:<br>Info lokasi spesifik & ubah status"]

## 3. Alasan Pemilihan Layar Utama
Layar Utama dipilih sebagai titik masuk utama aplikasi karena langsung memenuhi kebutuhan Must have paling kritis (F-01), yaitu menyajikan seluruh daftar keluhan fasilitas kampus secara terpusat agar Felix maupun Pak Kirill bisa langsung memantau status laporan tanpa langkah berbelit-belit.