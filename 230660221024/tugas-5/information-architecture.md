# Information Architecture — Aplikasi Absensi Organisasi Mahasiswa

## 1. Inventaris Layar

| Nama Layar | ID Kebutuhan yang Dipenuhi | Keterangan |
|:--|:--|:--|
| Halaman Utama (Daftar Kegiatan) | F-01, F-02 | Menampilkan daftar kegiatan dan status sesi absensi |
| Detail Kegiatan | F-03, F-04 | Menampilkan info lengkap kegiatan dan tombol check-in |
| Riwayat Kehadiran | F-04 | Menampilkan daftar kegiatan yang pernah dihadiri anggota |

## 2. Diagram IA

```mermaid
flowchart TD
    H["Halaman Utama:<br>Daftar Kegiatan (F-01, F-02)"]
    D["Detail Kegiatan:<br>Info & Tombol Check-in (F-03)"]
    R["Riwayat Kehadiran:<br>Daftar Kehadiran Saya (F-04)"]

    H -->|Pilih Kegiatan| D
    H -->|Lihat Riwayat| R