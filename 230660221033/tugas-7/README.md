# Tugas 7: MVP Awal dengan Data Lokal
**Nama:** Yelly Ambarwaty  
**NIM:** 230660221033  

Dokumen dan kode di repositori ini mencakup hasil pengerjaan Tugas 7 untuk aplikasi CeriaReads, yang meliputi perancangan model data serta implementasi fungsi operasi CRUD (Create, Read, Update, Delete) berbasis state lokal pada Flutter.

## Refleksi
Bagian yang paling sulit dipertahankan konsistensinya adalah memastikan setiap perubahan data dari antarmuka pengguna, seperti operasi edit (Update) dan pembatalan (Delete), diikat oleh metode `setState()` secara tepat sasaran agar status UI selalu sinkron tanpa mengalami keterlambatan *render*. Kesulitan ini muncul karena pencarian indeks objek pengganti (*Update*) rentan meleset jika disandarkan pada urutan *list*; sehingga kewajiban menggunakan pengenal `id` unik yang bersifat final (*timestamp*) menjadi keharusan struktural yang butuh ketelitian. 

---