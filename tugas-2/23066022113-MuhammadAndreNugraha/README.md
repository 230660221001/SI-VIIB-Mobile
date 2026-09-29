# Tugas 2 — Modul Hitung Nilai

## Identitas

* **Nama:** Muhammad Andre Nugraha
* **NIM:** [Isi NIM]
* **Program Studi:** Sistem Informasi
* **Mata Kuliah:** Pemrograman Aplikasi Bergerak
* **Project:** FasKampus

---

## 1. Deskripsi

Tugas ini merupakan latihan penggunaan dasar pemrograman Dart yang dipelajari pada Pertemuan 2. Program menggunakan `List<Map<String, Object>>` untuk menyimpan komponen penilaian, kemudian menggunakan fungsi, perulangan, operasi aritmetika, dan percabangan untuk menghitung rata-rata dan menentukan predikat.

## 2. Komponen Penilaian

| No | Komponen  | Bobot | Skor |
| -: | --------- | ----: | ---: |
|  1 | Tugas     |    30 |   28 |
|  2 | Praktikum |    25 |   24 |
|  3 | Kuis      |    10 |    9 |
|  4 | UTS       |    15 |   13 |
|  5 | UAS       |    20 |   18 |

Total bobot seluruh komponen adalah **100%**.

## 3. Fungsi yang Digunakan

Program memiliki dua fungsi utama:

### `hitungRataRata()`

Fungsi ini menerima `List<Map<String, Object>>` dan menjumlahkan seluruh skor menggunakan perulangan `for-in`, kemudian membaginya dengan jumlah komponen untuk mendapatkan nilai rata-rata.

### `predikat()`

Fungsi ini menggunakan percabangan `if`, `else if`, dan `else` untuk menentukan predikat berdasarkan nilai rata-rata.

Aturan predikat yang digunakan:

* Nilai >= 86 → A
* Nilai 76–85.99 → B
* Nilai 61–75.99 → C
* Nilai < 61 → Perlu perbaikan

## 4. Cara Menjalankan

Buka terminal pada folder yang berisi file `hitung_nilai.dart`, kemudian jalankan:

```bash
dart hitung_nilai.dart
```

## 5. Hasil Output

```text
=== MODUL HITUNG NILAI ===
Mata Kuliah: Pemrograman Aplikasi Bergerak

Daftar Komponen Penilaian:
- Tugas | Bobot: 30% | Skor: 28
- Praktikum | Bobot: 25% | Skor: 24
- Kuis | Bobot: 10% | Skor: 9
- UTS | Bobot: 15% | Skor: 13
- UAS | Bobot: 20% | Skor: 18

Rata-rata Skor: 18.40
Predikat Akhir: Perlu perbaikan
```

## 6. Refleksi

Sintaks dasar Dart yang paling sering saya salahgunakan adalah tipe data pada `Map`, terutama ketika mengambil nilai dari suatu key. Saya perlu memahami bahwa nilai yang diambil dari `Map<String, Object>` masih bertipe `Object`, sehingga perlu disesuaikan dengan tipe data yang digunakan seperti `String` atau `int`. Dari latihan ini saya menjadi lebih memahami hubungan antara tipe data, perulangan, fungsi, dan percabangan dalam Dart.
