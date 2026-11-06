# Information Architecture (IA)

## Inventaris Layar
Berdasarkan tabel pemetaan kebutuhan ke antarmuka dari Tugas 4:

1. **Halaman Utama (Daftar PC)** — Memenuhi F-01 (Melihat daftar PC) - *Must*
2. **Halaman Form Pelaporan** — Memenuhi F-02 (Mengisi form laporan) & F-03 (Melampirkan foto) - *Must/Should*
3. **Halaman Riwayat Laporan** — Memenuhi F-04 (Melihat riwayat pelaporan) - *Should*
4. **Dashboard Guru Lab** — Memenuhi F-05 (Melihat daftar laporan) - *Must*
5. **Halaman Detail Laporan** — Memenuhi F-06 (Mengubah status PC) - *Must*
6. **Halaman Tambah PC** — Memenuhi F-07 (Menambah master PC baru) - *Could*

## Peta Layar (Siswa Pelapor)
Fokus aplikasi saat ini adalah alur Siswa (Dandi), sehingga layar utamanya adalah Halaman Utama (Daftar PC).

```mermaid
flowchart TD
    Utama[Halaman Utama: Daftar PC
(F-01)]
    Utama --> Form[Halaman Form Pelaporan
(F-02, F-03)]
    Utama --> Riwayat[Halaman Riwayat Laporan
(F-04)]
```

## Penjelasan Pemilihan Layar Utama
Halaman Utama (Daftar PC) dipilih sebagai titik masuk utama bagi Siswa (Persona Dandi) karena sebelum melaporkan kerusakan, siswa perlu memverifikasi apakah PC yang digunakannya memang terdaftar dan memastikan status terkininya. Halaman ini memenuhi fitur *Must have* (F-01) dan langsung menyediakan akses cepat menuju fitur inti lainnya, yaitu "Lapor Kerusakan" melalui tombol aksi (FAB).
