# Quiz Pertemuan 13

**Soal 1:** Komponen test case: ID, Skenario, Kondisi Awal, Langkah, Expected Result, Actual Result, Status. Expected result adalah hasil yang diharapkan/didefinisikan sebelum pengujian, sedangkan actual result adalah hasil nyata yang terjadi di layar saat pengujian dijalankan.

**Soal 2:** 
- *Static analysis*: Memeriksa kode tanpa menjalankannya (contoh: `flutter analyze`).
- *Unit test*: Menguji fungsi/class secara terisolasi tanpa UI.
- *Widget test*: Menguji komponen UI (widget) dan interaksinya secara simulasi.
- *Integration test*: Menguji alur aplikasi secara keseluruhan di perangkat nyata.
- *Manual functional test*: Pengujian yang dilakukan manusia langsung melihat layar.

**Soal 3:** 
- `pumpWidget`: Memasang/membangun widget di lingkungan test.
- `find`: Mencari widget di layar (berdasarkan teks/tipe).
- `tap`: Mensimulasikan ketukan jari pada widget.
- `pump`: Membangun ulang UI setelah perubahan state.
- `expect`: Melakukan *assertion* (memastikan hasil sesuai harapan).

**Soal 4:** Langkah *debugging*: 1) Reproduksi bug dengan menekan tombol dua kali cepat. 2) Cek log/analisis kode fungsi `_simpan`. 3) Hipotesis: tombol tidak dinonaktifkan saat loading. 4) Perbaiki dengan menambahkan state `_isLoading` pada `onPressed`. 5) Uji ulang.

**Soal 5:** Test yang lulus harus dijalankan kembali (regresi) karena perbaikan pada satu fitur (misal validasi) bisa saja merusak fitur lain (misal fungsi simpan). Dengan regresi, kita memastikan tidak ada fitur lama yang rusak akibat kode baru.

**Soal 6:** Menghapus *assertion* agar test lulus adalah praktik curang. Ini menutupi *bug* asli, membuat aplikasi rentan *crash*, dan memberikan rasa aman yang palsu. Tujuan testing adalah menemukan kesalahan, bukan memanipulasi hasil agar terlihat bagus.