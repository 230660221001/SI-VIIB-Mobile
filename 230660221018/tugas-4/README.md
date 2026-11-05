# SIPORA — Sistem Informasi Pengajuan Surat Observasi dan Riset Akademik

## Identitas

| Keterangan  | Detail                                     |
| ----------- | ------------------------------------------ |
| Nama        | Intan Kartika                              |
| NIM         | 230660221018                               |
| Kelas       | SI-VIIB                                    |
| Mata Kuliah | Pemrograman Aplikasi Bergerak              |
| Tugas       | Tugas 4 — Analisis Kebutuhan dan User Flow |
| Teknologi   | Flutter & Dart                             |

## Deskripsi Aplikasi

**SIPORA (Sistem Informasi Pengajuan Surat Observasi dan Riset Akademik)** merupakan rancangan aplikasi mobile yang membantu mahasiswa dalam mengajukan surat observasi dan riset akademik secara lebih terstruktur. Mahasiswa dapat mengisi data pengajuan, mengunggah dokumen pendukung, memantau status pengajuan, serta memperoleh surat yang telah selesai dalam bentuk soft file. Pada sisi petugas fakultas, sistem digunakan untuk memeriksa kelengkapan dokumen, memberikan catatan perbaikan apabila diperlukan, serta melakukan verifikasi dan pembaruan status pengajuan. Perancangan ini berfokus pada kebutuhan pengguna dan alur layanan agar proses administrasi akademik menjadi lebih jelas, transparan, dan mudah dipantau.

## Domain Sistem

**Domain:** Pengajuan Surat Observasi dan Riset Akademik

### Aktor

1. **Mahasiswa**
   Berperan sebagai pengaju surat observasi atau riset akademik. Mahasiswa mengisi pengajuan, melengkapi dokumen pendukung, memantau status, melakukan perbaikan apabila diperlukan, dan memperoleh surat yang telah disetujui.

2. **Petugas Fakultas**
   Berperan sebagai verifikator pengajuan. Petugas memeriksa data dan dokumen, memberikan catatan perbaikan apabila terdapat kekurangan, serta melakukan verifikasi dan pembaruan status pengajuan.

## Cakupan Fungsional

Alur utama SIPORA mencakup:

* Mahasiswa melakukan login ke sistem.
* Mahasiswa mengakses menu pengajuan.
* Mahasiswa memilih jenis surat observasi atau penelitian.
* Mahasiswa mengisi formulir pengajuan.
* Mahasiswa mengunggah dokumen pendukung.
* Mahasiswa mengirim pengajuan.
* Petugas fakultas memeriksa pengajuan dan kelengkapan dokumen.
* Petugas memberikan catatan apabila terdapat data atau dokumen yang perlu diperbaiki.
* Mahasiswa memperbaiki dan mengirim kembali pengajuan.
* Petugas melakukan verifikasi dan persetujuan.
* Mahasiswa memantau status pengajuan.
* Mahasiswa mengunduh surat keterangan yang telah selesai dalam bentuk soft file.

## Artefak Perancangan

Dokumen tugas ini terdiri atas beberapa artefak utama:

```text
tugas-4/
├── dokumen-kebutuhan.md
├── README.md
└── user-flow.png
```

### 1. `dokumen-kebutuhan.md`

Dokumen analisis kebutuhan yang memuat:

* Deskripsi aplikasi dan domain sistem.
* Persona pengguna.
* Kebutuhan fungsional.
* Kebutuhan nonfungsional.
* Prioritas kebutuhan menggunakan metode MoSCoW.
* Pemetaan kebutuhan terhadap halaman dan widget.
* User flow aplikasi.
* Deklarasi penggunaan AI.
* Refleksi.

### 2. `user-flow.png`

Diagram user flow menggambarkan interaksi utama antara **Mahasiswa** dan **Petugas Fakultas**, mulai dari proses login, pengajuan surat, pemeriksaan dokumen, perbaikan, verifikasi, hingga mahasiswa memperoleh surat yang telah disetujui.

Diagram juga memperlihatkan titik keputusan dan alur alternatif ketika pengajuan belum lengkap atau membutuhkan perbaikan.

## Prinsip Perancangan

Perancangan SIPORA memperhatikan beberapa prinsip utama:

* **User-centered:** alur disusun berdasarkan kebutuhan dan aktivitas pengguna.
* **Clarity:** setiap tahapan pengajuan memiliki tujuan dan keluaran yang jelas.
* **Transparency:** mahasiswa dapat mengetahui perkembangan status pengajuannya.
* **Efficiency:** proses administrasi dirancang agar lebih terstruktur dan mengurangi proses yang tidak diperlukan.
* **Traceability:** setiap pengajuan memiliki status yang dapat dipantau hingga proses selesai.

## Batasan Implementasi

Pada tahap perancangan tugas ini, fokus utama berada pada **analisis kebutuhan dan pemodelan alur pengguna**. Fitur seperti autentikasi yang terhubung ke server, database, penyimpanan dokumen secara nyata, API, serta penerbitan surat secara otomatis belum menjadi bagian dari implementasi pada tahap ini.

Data yang digunakan pada rancangan sebelumnya juga bersifat **statis**, sehingga digunakan untuk menggambarkan kebutuhan antarmuka dan alur aplikasi, bukan sebagai data operasional sebenarnya.

## Refleksi

Perancangan SIPORA membantu memahami bahwa sebuah aplikasi mobile perlu diawali dengan identifikasi kebutuhan pengguna agar fitur dan alurnya memiliki tujuan yang jelas. Penyusunan user flow membuat hubungan antara aktivitas mahasiswa dan proses verifikasi petugas fakultas menjadi lebih mudah dipahami, terutama pada kondisi pengajuan yang perlu diperbaiki. Tahap ini juga memberikan pemahaman bahwa rancangan yang baik tidak hanya berfokus pada tampilan, tetapi juga pada kejelasan proses, kebutuhan pengguna, dan kemungkinan kondisi yang terjadi selama layanan berlangsung.

## Deklarasi Penggunaan AI

Dalam penyusunan tugas ini, **Artificial Intelligence (AI)** digunakan sebagai alat bantu untuk memberikan masukan dalam penyusunan struktur dokumentasi, perumusan bahasa, pengembangan user flow, dan penyempurnaan penyajian artefak. Seluruh konsep, domain aplikasi, kebutuhan pengguna, aktor, serta keputusan perancangan tetap disesuaikan dan ditinjau berdasarkan konteks tugas yang dikerjakan.
