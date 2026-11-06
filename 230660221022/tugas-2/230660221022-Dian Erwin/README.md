# Tugas 2 — Modul Hitung Nilai

**Nama:** Dian Erwin
**NIM:** 230660221022
**Kelas:** SI-VIIA
**Skema:** Penilaian praktikum lab komputer

---

## Hasil Keluaran Program

Jalankan `dart hitung_nilai.dart`, lalu salin hasilnya ke bawah ini:

```text
=== Penilaian Praktikum Lab Komputer ===
- Kehadiran: Bobot 10%, Skor 9
- Tugas Praktikum: Bobot 30%, Skor 26
- Laporan: Bobot 20%, Skor 17
- Ujian Praktik: Bobot 25%, Skor 21
- Proyek Mini: Bobot 15%, Skor 12
----------------------------------------
Nilai Akhir    : 85.0
Predikat Akhir : B
```

## Refleksi

Sintaks yang paling sering saya salahgunakan adalah konversi tipe data, terutama saat mengakses nilai dari koleksi `Map` yang memiliki *value* bertipe `Object`. Kesalahan konkret yang pernah terjadi adalah munculnya error `type 'int' is not a subtype of type 'double'` saat proses perhitungan karena operator pembagian (`/`) di Dart selalu menghasilkan `double`, tetapi saya mencoba menyimpannya dalam variabel `int`. Hal ini terjadi karena Dart sangat ketat terhadap keamanan tipe data (*strongly typed*), dan saya memperbaikinya dengan secara eksplisit menggunakan *casting* `as int` pada nilai `Map` lalu merangkainya dengan *method* `.toDouble()` untuk kalkulasi akhir.

---
Bantuan AI: Claude, hanya untuk menyiapkan kerangka file; AI Assistant untuk menyempurnakan logika fungsi dan refleksi tipe data.
