# SIPORA — Sistem Informasi Pengajuan Surat Observasi dan Riset Akademik

SIPORA (Sistem Informasi Pengajuan Surat Observasi dan Riset Akademik) merupakan aplikasi mobile berbasis Flutter yang dirancang sebagai implementasi pembelajaran **Pemrograman Aplikasi Bergerak**. Aplikasi ini menyediakan tampilan informasi pengajuan surat secara sederhana, terstruktur, dan mudah dipahami oleh pengguna.

Project ini dikembangkan sebagai bagian dari tugas perkuliahan dengan menerapkan konsep dasar **Flutter, Dart, widget, layout, dan struktur antarmuka aplikasi mobile**.

---

## 1. Informasi Project

| Keterangan         | Detail                           |
| ------------------ | -------------------------------- |
| Nama Aplikasi      | SIPORA                           |
| Kepanjangan        | Sistem Informasi Pengajuan Surat Observasi dan Riset Akademik|
| Platform           | Mobile / Web melalui Flutter     |
| Framework          | Flutter                          |
| Bahasa Pemrograman | Dart                             |
| Konsep Utama       | Widget-based UI                  |
| Jenis Data         | Data statis                      |
| Status             | Tugas Perkuliahan                |

---

## 2. Tujuan

Project ini bertujuan untuk menerapkan konsep dasar pengembangan aplikasi menggunakan Flutter, khususnya dalam:

* Membuat struktur aplikasi menggunakan widget Flutter.
* Menerapkan `MaterialApp` dan `Scaffold`.
* Mengatur layout menggunakan `Column`, `Row`, `Expanded`, `Padding`, dan `Container`.
* Menampilkan data menggunakan `ListView.builder`.
* Membuat widget helper untuk mengurangi pengulangan kode.
* Menerapkan tema dan konsistensi visual menggunakan `ThemeData`.
* Menampilkan informasi pengajuan surat dalam bentuk antarmuka yang terstruktur.

---

## 3. Fitur

### Dashboard Pengguna

Halaman utama menampilkan informasi pengguna serta ringkasan pengajuan surat.

### Ringkasan Pengajuan

Aplikasi menampilkan jumlah:

* Total pengajuan
* Pengajuan yang sedang diproses
* Pengajuan yang telah selesai

### Riwayat Pengajuan

Daftar pengajuan ditampilkan secara dinamis menggunakan `ListView.builder`.

Setiap data pengajuan memiliki informasi:

* Jenis surat
* Tujuan pengajuan
* Status pengajuan

### Status Pengajuan

Status pengajuan dibedakan secara visual berdasarkan jenis status:

| Status    | Keterangan Visual |
| --------- | ----------------- |
| Diproses  | Oranye            |
| Disetujui | Hijau             |
| Selesai   | Biru              |
| Ditolak   | Merah             |

---

## 4. Teknologi yang Digunakan

Project ini menggunakan teknologi berikut:

* **Flutter** sebagai framework pengembangan aplikasi.
* **Dart** sebagai bahasa pemrograman.
* **Material 3** sebagai dasar komponen antarmuka.
* **ListView.builder** untuk menampilkan daftar data.
* **ThemeData** untuk pengaturan tema aplikasi.

---

## 5. Struktur Widget

Struktur utama widget pada halaman aplikasi adalah:

```text
MaterialApp
└── Scaffold
    ├── AppBar
    │   └── Text("SIPORA")
    │
    └── SafeArea
        └── Padding
            └── Column
                ├── Header Pengguna
                │   └── Row
                │       ├── Container
                │       │   └── Icon
                │       └── Expanded
                │           └── Column
                │               ├── Text
                │               └── Text
                │
                ├── Ringkasan Pengajuan
                │   └── Row
                │       ├── Summary Card
                │       ├── Summary Card
                │       └── Summary Card
                │
                ├── Judul Daftar
                │   └── Row
                │       ├── Text
                │       └── Text
                │
                └── Expanded
                    └── ListView.builder
                        └── Pengajuan Card
                            ├── Icon
                            ├── Informasi Pengajuan
                            │   └── Column
                            │       ├── Text
                            │       └── Text
                            └── Status
```

Dokumentasi visual widget tree tersedia pada:

```text
widget-tree.png
```

Source Mermaid untuk diagram tersedia pada:

```text
widget-tree.mmd
```

---

## 6. Struktur Folder

Struktur dasar project:

```text
lib/
├── main.dart
└── halaman_aplikasi.dart

test/
└── widget_test.dart

widget-tree.mmd
widget-tree.png
README.md
pubspec.yaml
```

---

## 7. Data Pengajuan

Pada tahap ini, data masih menggunakan data statis dalam bentuk:

```dart
List<Map<String, String>>
```

Contoh data yang digunakan:

```text
Jenis Surat       Tujuan                    Status
---------------------------------------------------------
Surat Observasi   PT Maju Jaya              Diproses
Surat Penelitian  Universitas ABC           Disetujui
Surat Observasi   CV Teknologi Nusantara    Selesai
Surat Penelitian  PT Digital Indonesia      Ditolak
```

Penggunaan data statis dilakukan untuk memfokuskan implementasi pada pemahaman struktur widget, layout, dan penyajian informasi dalam aplikasi Flutter.

---

## 8. Cara Menjalankan Project

Pastikan Flutter dan Dart telah terpasang pada komputer.

### Clone atau buka project

Masuk ke direktori project melalui terminal:

```bash
cd nama-folder-project
```

### Install dependency

```bash
flutter pub get
```

### Periksa konfigurasi Flutter

```bash
flutter doctor
```

### Jalankan aplikasi

Untuk menjalankan melalui Chrome:

```bash
flutter run -d chrome
```

Jika menggunakan perangkat atau emulator Android yang telah terhubung:

```bash
flutter devices
```

kemudian:

```bash
flutter run
```

---

## 9. Pengujian

Project menyediakan file:

```text
test/widget_test.dart
```

Pengujian dapat dijalankan menggunakan:

```bash
flutter test
```

Pengujian digunakan untuk memastikan widget utama aplikasi dapat dibuat dan ditampilkan dengan benar.

---

## 10. Dokumentasi

Dokumentasi struktur widget aplikasi tersedia dalam dua format:

* `widget-tree.png` — hasil visualisasi widget tree.

Diagram tersebut menggambarkan hubungan hierarkis antar-widget pada halaman utama SIPORA.

---

## 11. Pengembangan Selanjutnya

Versi saat ini masih menggunakan data statis. Pengembangan berikutnya dapat diarahkan pada:

1. Implementasi navigasi antarhalaman.
2. Form pengajuan surat.
3. Penyimpanan data pengajuan.
4. Integrasi database atau API.
5. Fitur autentikasi pengguna.
6. Detail status pengajuan.
7. Pengelolaan data secara dinamis.

Pengembangan tersebut dilakukan secara bertahap sesuai kebutuhan sistem dan materi pembelajaran pada pertemuan berikutnya.

---

## 12. Kesimpulan

SIPORA merupakan implementasi aplikasi Flutter sederhana yang berfokus pada penerapan konsep dasar **widget, layout, data collection, dan penyajian informasi**. Melalui project ini, struktur antarmuka aplikasi dibangun menggunakan widget Flutter secara hierarkis dan terorganisasi sehingga dapat menjadi dasar untuk pengembangan fitur aplikasi pada tahap selanjutnya.

---

**Project:** SIPORA — Sistem Informasi Pengajuan Surat Observasi dan Riset Akademik
**Framework:** Flutter
**Language:** Dart
**Purpose:** Tugas Perkuliahan Pemrograman Aplikasi Bergerak
