# Information Architecture
## Aplikasi Akademik PKBM Al Qosimmiyah

### 1. Deskripsi
Information Architecture (IA) merupakan struktur informasi yang menggambarkan susunan halaman dan hubungan antarhalaman dalam aplikasi Akademik PKBM Al Qosimmiyah.

Aplikasi ini dirancang untuk membantu siswa atau warga belajar mengakses informasi akademik dengan mudah.

### 2. Aktor Pengguna
**Siswa / Warga Belajar**

Pengguna dapat melihat informasi nilai akademik, jadwal pelajaran, dan jadwal ujian.

### 3. Struktur Informasi

1. **Beranda Akademik**
   - Informasi utama akademik
   - Ringkasan nilai
   - Menu layanan akademik

2. **Nilai Akademik**
   - Daftar nilai mata pelajaran
   - Detail nilai dan hasil belajar

3. **Jadwal Pelajaran**
   - Daftar mata pelajaran
   - Hari dan jam pembelajaran
   - Informasi tutor

4. **Jadwal Ujian**
   - Tanggal ujian
   - Waktu ujian
   - Mata pelajaran yang diujikan

### 4. Diagram Information Architecture

flowchart TD
    A["Beranda Akademik"]

    A --> B["Nilai Akademik"]
    A --> C["Jadwal Pelajaran"]
    A --> D["Jadwal Ujian"]

    B --> E["Detail Nilai"]
    C --> F["Detail Pelajaran"]
    D --> G["Detail Ujian"]

    classDef halaman fill:#EDE9FE,stroke:#A78BFA,color:#222222,stroke-width:1.5px;
    class A,B,C,D,E,F,G halaman;


### 5. Alasan Pemilihan Struktur
Beranda Akademik dipilih sebagai halaman utama karena menjadi titik awal bagi siswa atau warga belajar untuk memperoleh informasi akademik. Dari halaman utama, pengguna dapat mengetahui ringkasan informasi dan menemukan layanan akademik seperti nilai, jadwal pelajaran, dan jadwal ujian dengan mudah.

Struktur dibuat sederhana agar pengguna tidak kesulitan menemukan informasi yang dibutuhkan.