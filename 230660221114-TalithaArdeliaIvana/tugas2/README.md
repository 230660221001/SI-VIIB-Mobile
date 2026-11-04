# Tugas 2 Modul Hitung Nilai

**Nama:** Talitha Ardelia Ivana
**NIM:** 230660221114 
**Kelas:** SI-VIIB  

## Deskripsi Program

Program Dart ini menghitung total skor mahasiswa berdasarkan beberapa komponen penilaian, yaitu tugas, praktikum, kehadiran, Ujian Tengah Semester, dan Ujian Akhir Semester. Program menggunakan `List<Map<String, Object>>` untuk menyimpan data, perulangan `for` untuk menampilkan dan menjumlahkan skor, fungsi untuk menghitung total, serta percabangan `if-else` untuk menentukan predikat akhir.

## Komponen Penilaian

| Komponen | Bobot | Skor |
|---|---:|---:|
| Tugas | 20 | 18 |
| Praktikum | 10 | 10 |
| Kehadiran | 10 | 10 |
| Ujian Tengah Semester | 30 | 30 |
| Ujian Akhir Semester | 20 | 20 |
| **Total** | **90** | **88** |

## Hasil Keluaran Program

```text
====================================
Mata Kuliah: Pemrograman Aplikasi Bergerak
====================================
Nama Mahasiswa : Rian Rianto
NIM            : 230660221004
Kelas          : SI-VIIB
====================================

Daftar Komponen Penilaian:
- Tugas: Bobot = 20, Skor = 18
- Praktikum: Bobot = 10, Skor = 10
- Kehadiran: Bobot = 10, Skor = 10
- Ujian Tengah Semester: Bobot = 30, Skor = 30
- Ujian Akhir Semester: Bobot = 20, Skor = 20

Hasil Akhir:
Total Skor : 88.0
Predikat Akhir : A (Sangat Baik)
====================================
```

## Cara Menjalankan

1. Pastikan Dart SDK sudah terpasang.
2. Buka terminal pada folder tempat file `hitung_nilai.dart` disimpan.
3. Jalankan perintah:

   ```bash
   dart run hitung_nilai.dart
   ```

## Refleksi

Sintaks Dart yang masih perlu saya kuasai adalah penggunaan `Map` dan type casting saat mengambil nilai dari map. Karena nilai pada `Map<String, Object>` memiliki tipe umum `Object`, nilai tersebut perlu dikonversi ke tipe yang sesuai, misalnya menggunakan `as int`, sebelum digunakan dalam perhitungan. Melalui tugas ini, saya berlatih menggunakan `List`, `Map`, perulangan, fungsi, dan percabangan untuk mengolah serta menampilkan hasil penilaian.

## Pernyataan Penggunaan AI

Saya menggunakan ChatGPT sebagai bantuan untuk menyesuaikan struktur kode, merapikan keluaran program, dan menyusun dokumentasi tugas. Saya tetap perlu memeriksa serta memahami kode sebelum mengumpulkannya.
