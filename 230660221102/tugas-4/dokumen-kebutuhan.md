# Dokumen Kebutuhan — Mantra Attendance

## 1. Deskripsi Aplikasi

### Nama Aplikasi
Mantra Attendance

### Masalah Pengguna
Karyawan membutuhkan cara yang praktis untuk mencatat kehadiran dan melihat informasi absensi dalam aktivitas kerja sehari-hari. Dalam tugas ini, aplikasi dirancang sebagai media mobile untuk membantu proses pencatatan kehadiran karyawan serta memberikan informasi status dan riwayat absensi secara lebih mudah diakses.

### Alasan Menggunakan Mobile
Aplikasi dirancang dalam bentuk mobile karena proses absensi dilakukan oleh karyawan pada saat menjalankan aktivitas kerja dan membutuhkan akses yang praktis melalui perangkat yang digunakan sehari-hari. Selain itu, perangkat mobile memungkinkan pengguna mengakses fungsi absensi dan informasi kehadiran secara langsung tanpa harus bergantung pada perangkat komputer.

### Domain
Sistem Informasi Absensi Karyawan PT Mantra Group.

---

# 2. User Persona

## Persona 1 — Karyawan

### Nama / Role
**Raka — Karyawan PT Mantra Group**

### Goal
- Mencatat kehadiran dengan mudah.
- Mengetahui status kehadiran pada hari berjalan.
- Melihat riwayat absensi.
- Memastikan data check-in dan check-out tercatat.
- Mengetahui informasi hasil absensi.

### Constraints
- Membutuhkan proses absensi yang sederhana.
- Tidak ingin melalui banyak langkah untuk melakukan absensi.
- Membutuhkan informasi kehadiran yang mudah dipahami.
- Penggunaan aplikasi dilakukan pada waktu kerja.
- Tidak selalu menggunakan komputer saat melakukan absensi.

### Device / Context
- Smartphone.
- Digunakan pada awal dan akhir jam kerja.
- Digunakan ketika berada di lingkungan kerja.
- Membutuhkan tampilan yang sederhana.
- Digunakan secara mandiri oleh karyawan.

### Frequency
Digunakan setiap hari kerja, terutama ketika melakukan check-in dan check-out.

---

## Persona 2 — Admin

### Nama / Role
**Dina — Admin Absensi**

### Goal
- Memantau data kehadiran karyawan.
- Melihat rekap absensi.
- Memeriksa data kehadiran.
- Mengelola data absensi apabila terdapat kesalahan.
- Membantu memastikan informasi absensi tersedia.

### Constraints
- Membutuhkan data yang jelas dan mudah diperiksa.
- Data absensi harus dapat ditelusuri berdasarkan karyawan dan tanggal.
- Membutuhkan akses terhadap informasi yang relevan.
- Pengelolaan data harus dilakukan secara hati-hati.
- Tidak semua aktivitas administrasi harus dilakukan melalui perangkat mobile.

### Device / Context
- Smartphone atau perangkat kerja.
- Digunakan pada jam kerja.
- Digunakan untuk pemantauan dan pemeriksaan data.
- Membutuhkan tampilan informasi yang ringkas.
- Dapat digunakan ketika melakukan pengecekan data absensi.

### Frequency
Digunakan setiap hari kerja dan ketika diperlukan untuk memeriksa data absensi.

---

# 3. Functional Requirements

| ID | Functional Requirement | Actor |
|---|---|---|
| F-01 | Karyawan dapat masuk ke aplikasi menggunakan akun yang telah terdaftar sehingga dapat mengakses fitur sesuai perannya. | Karyawan |
| F-02 | Karyawan dapat melihat status kehadiran pada hari berjalan setelah berhasil masuk ke aplikasi. | Karyawan |
| F-03 | Karyawan dapat melakukan check-in ketika belum memiliki catatan kehadiran masuk pada hari berjalan. | Karyawan |
| F-04 | Karyawan dapat melakukan check-out ketika telah memiliki catatan check-in pada hari berjalan. | Karyawan |
| F-05 | Karyawan dapat melihat riwayat kehadiran berdasarkan data absensi yang telah tercatat. | Karyawan |
| F-06 | Karyawan dapat melihat informasi hasil atau status absensi setelah data kehadiran tercatat. | Karyawan |
| F-07 | Admin dapat melihat data kehadiran karyawan berdasarkan periode tertentu untuk melakukan pemantauan. | Admin |
| F-08 | Admin dapat memeriksa dan memperbarui data absensi apabila terdapat data yang perlu dikoreksi. | Admin |

---

# 4. Non-Functional Requirements

| ID | Kategori | Non-Functional Requirement | Indikator |
|---|---|---|---|
| NF-01 | Usability | Proses check-in dan check-out harus dapat dilakukan melalui alur yang sederhana. | Pengguna dapat menyelesaikan proses utama maksimal dalam 5 langkah dari halaman utama. |
| NF-02 | Performance | Aplikasi harus memberikan respons terhadap permintaan pengguna dalam waktu yang wajar. | Halaman atau informasi utama ditampilkan maksimal 3 detik pada kondisi jaringan normal. |
| NF-03 | Compatibility | Aplikasi harus dapat digunakan pada perangkat mobile yang umum digunakan pengguna. | Tampilan dan fungsi utama dapat berjalan pada perangkat Android yang mendukung aplikasi. |

---

# 5. MoSCoW Prioritization

## Must Have

| ID | Requirement | Alasan |
|---|---|---|
| F-01 | Login | Karyawan membutuhkan akses ke aplikasi sesuai akun dan perannya. |
| F-02 | Melihat status kehadiran | Karyawan perlu mengetahui apakah kehadirannya telah tercatat. |
| F-03 | Check-in | Check-in merupakan fungsi utama pencatatan awal kehadiran. |
| F-04 | Check-out | Check-out diperlukan untuk melengkapi pencatatan kehadiran harian. |
| F-05 | Riwayat kehadiran | Karyawan membutuhkan informasi untuk memeriksa catatan absensinya. |

## Should Have

| ID | Requirement | Alasan |
|---|---|---|
| F-06 | Melihat hasil/status absensi | Membantu karyawan memahami kondisi data kehadirannya. |
| F-07 | Pemantauan data oleh admin | Membantu admin melakukan pemantauan data kehadiran. |

## Could Have

| ID | Requirement | Alasan |
|---|---|---|
| F-08 | Koreksi data absensi oleh admin | Berguna untuk kebutuhan administrasi, tetapi bukan fungsi utama yang harus tersedia pada versi awal. |

## Won't Have

Tidak terdapat functional requirement yang dinyatakan sebagai Won't Have pada versi rancangan ini. Fitur di luar kebutuhan absensi, seperti penggajian, pengajuan cuti, dan pengelolaan sumber daya manusia secara keseluruhan tidak termasuk dalam ruang lingkup aplikasi.

---

# 6. User Flow

## User Goal

**Melakukan Check-in Kehadiran**

```mermaid
flowchart TD

    A(["Mulai"])
    B["Buka aplikasi Mantra Attendance"]
    C["Halaman Login"]
    D["Masukkan akun dan password"]
    E{"Akun valid?"}

    F["Tampilkan pesan akun tidak valid"]
    G["Kembali ke halaman Login"]

    H["Dashboard"]
    I["Pilih menu Check-in"]
    J["Periksa kondisi absensi"]
    K{"Dapat melakukan check-in?"}

    L["Tampilkan pesan check-in tidak dapat dilakukan"]
    M["Kembali ke Dashboard"]

    N["Kirim data check-in"]
    O["Tampilkan konfirmasi check-in berhasil"]
    P(["Selesai"])

    A --> B
    B --> C
    C --> D
    D --> E

    E -- "Tidak" --> F
    F --> G
    G --> C

    E -- "Ya" --> H
    H --> I
    I --> J
    J --> K

    K -- "Tidak" --> L
    L --> M
    M --> H

    K -- "Ya" --> N
    N --> O
    O --> P