# Information Architecture — Akademik PKBM Al Qosimmiyah

## 1. Inventaris Layar

| ID Kebutuhan | Kebutuhan Pengguna | Prioritas | Nama Layar |
|:---|:---|:---:|:---|
| F-01 | Melihat ringkasan informasi akademik | Must Have | Beranda |
| F-02 | Melihat nilai akademik berdasarkan mata pelajaran | Must Have | Nilai Akademik |
| F-03 | Melihat jadwal pelajaran berdasarkan hari dan waktu | Must Have | Jadwal Pelajaran |
| F-04 | Melihat jadwal ujian berdasarkan tanggal dan mata pelajaran | Must Have | Jadwal Ujian |

## 2. Diagram Information Architecture

flowchart TD
    A["Halaman Utama<br/>Beranda Akademik"]

    A --> B["Halaman Nilai Akademik<br/>Daftar nilai mata pelajaran"]
    A --> C["Halaman Jadwal Pelajaran<br/>Daftar jadwal pembelajaran"]
    A --> D["Halaman Jadwal Ujian<br/>Daftar jadwal ujian"]

    B --> E["Detail Nilai<br/>Nilai dan hasil belajar"]
    C --> F["Detail Pelajaran<br/>Mata pelajaran, hari, dan jam"]
    D --> G["Detail Ujian<br/>Tanggal, waktu, dan mata pelajaran"]

    classDef halaman fill:#EDE9FE,stroke:#A78BFA,color:#222222,stroke-width:1.5px;
    class A,B,C,D,E,F,G halaman;

## 3. Alasan Pemilihan Layar Utama

Layar utama yang dipilih adalah **Beranda Akademik** karena menjadi halaman pertama yang diakses oleh warga belajar untuk memperoleh gambaran umum mengenai informasi akademik. Layar ini memenuhi kebutuhan **F-01 (Must Have)**, yaitu melihat ringkasan informasi akademik, serta menjadi titik awal untuk mengakses halaman Nilai Akademik, Jadwal Pelajaran, dan Jadwal Ujian.