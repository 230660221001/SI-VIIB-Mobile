Dalam aplikasi pengajuan surat, penyimpanan data dapat dilakukan secara in-memory menggunakan List<PengajuanSurat> pada state atau menggunakan persistensi data dengan package shared_preferences. Keduanya memiliki perbedaan dalam cara menyimpan dan mempertahankan data.

1. **Perbedaan In-Memory dan Persistensi Menggunakan SharedPreferences**

    1. Penyimpanan In-Memory

        In-memory merupakan penyimpanan data sementara di dalam memori aplikasi selama aplikasi berjalan. Pada Flutter, penyimpanan ini dapat menggunakan List<PengajuanSurat> yang diletakkan di dalam State.

        Contoh kode:
        ```js
        List<PengajuanSurat> daftarPengajuan = [];

        void tambahPengajuan(PengajuanSurat data) {
        setState(() {
            daftarPengajuan.add(data);
        });
        }
        ```
        Data yang ditambahkan akan tersimpan selama aplikasi masih berjalan. Namun, ketika aplikasi ditutup secara penuh atau dijalankan ulang, data tersebut akan hilang karena hanya disimpan di memori sementara.

        Alasan: In-memory cocok digunakan untuk menyimpan data sementara karena proses membaca dan mengubah data relatif cepat serta tidak memerlukan proses penyimpanan ke media penyimpanan perangkat.

    2. Persistensi Menggunakan SharedPreferences

        Persistensi merupakan proses penyimpanan data agar tetap tersedia meskipun aplikasi ditutup atau perangkat dinyalakan ulang. Pada Flutter, salah satu package yang dapat digunakan adalah shared_preferences.

        Package ini digunakan untuk menyimpan data sederhana dalam bentuk pasangan key-value, seperti String, int, double, bool, dan List<String>.

        Contoh kode:
        ```js
        final prefs = await SharedPreferences.getInstance();

        await prefs.setString('nama', 'Andi');
        ```

        Untuk mengambil data:
        ```js
        final prefs = await SharedPreferences.getInstance();

        String? nama = prefs.getString('nama');
        ```
        Alasan: shared_preferences digunakan ketika data perlu dipertahankan setelah aplikasi ditutup. Dengan demikian, pengguna tidak perlu memasukkan kembali data yang sebelumnya sudah disimpan.

        Perbedaan keduanya dapat dilihat pada tabel berikut.
        | Index | In-Memory | NaSharedPreferencesma |
        |:--------|:--------|:--------|
        | Lokasi penyimpanan | Memori aplikasi (RAM) | Penyimpanan lokal perangkat |
        | Ketahanan data | Hilang ketika aplikasi dimulai ulang | Tetap tersedia setelah aplikasi ditutup |
        | Kecepatan akses | Relatif cepat | Melibatkan operasi penyimpanan asinkron |
        | Penggunaan | Data sementara | Data sederhana yang perlu dipertahankan |
        | Proses akses | RSinkron | Asinkron (Future) |

2. **Mengapa Operasi SharedPreferences Bersifat Asinkron (Future)?**

    Operasi shared_preferences bersifat asinkron karena proses membaca dan menyimpan data melibatkan komunikasi dengan media penyimpanan perangkat, yang membutuhkan waktu untuk diselesaikan.

    Flutter menggunakan Future untuk menunjukkan bahwa suatu operasi tidak langsung menghasilkan nilai, tetapi akan memberikan hasil setelah proses selesai.

    Contohnya:
    ```js
    Future<void> simpanData() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('nama', 'Andi');
    }
    ```
    Pada kode tersebut, terdapat dua penggunaan await:
    - await SharedPreferences.getInstance() digunakan untuk menunggu proses mendapatkan akses ke penyimpanan lokal sampai selesai.
    - await prefs.setString() digunakan untuk menunggu proses penyimpanan data sampai selesai.
    Alasan: Sifat asinkron membuat aplikasi tidak harus menghentikan seluruh proses antarmuka selama operasi penyimpanan berlangsung. Dengan demikian, aplikasi tetap dapat merespons interaksi pengguna ketika menunggu proses penyimpanan selesai.

3. **Apa yang Terjadi Jika Await Diabaikan Saat Menyimpan Data?**

    Jika kata kunci await diabaikan, proses penyimpanan akan berjalan tanpa ditunggu penyelesaiannya oleh kode berikutnya.

    Contoh:
    ```js
    Future<void> simpanData() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('nama', 'Andi');

    print('Data berhasil disimpan');
    }
    ```
    Pada contoh tersebut, pesan "Data berhasil disimpan" dapat ditampilkan sebelum proses penyimpanan benar-benar selesai.

    Akibatnya:
    1. Program tidak mengetahui secara langsung apakah proses penyimpanan sudah berhasil atau masih berlangsung.
    2. Jika terjadi kesalahan dalam penyimpanan, penanganan kesalahan menjadi lebih sulit.
    3. Kode berikutnya dapat berjalan sebelum proses penyimpanan selesai sehingga berpotensi menimbulkan ketidaksesuaian data.
    4. Jika aplikasi langsung ditutup, terdapat risiko proses penyimpanan belum selesai ketika aplikasi berhenti.

    Alasan: await diperlukan agar program menunggu penyelesaian operasi asinkron sebelum melanjutkan ke proses berikutnya. Hal ini penting terutama ketika data yang disimpan harus dipastikan tersedia sebelum digunakan kembali.

4. **Contoh Situasi Penggunaan In-Memory dan Persistensi**
    1. Situasi ketika In-Memory Sudah Cukup

        Contohnya, aplikasi pengajuan surat memiliki formulir pengajuan yang sedang diisi oleh pengguna. Data sementara yang dimasukkan dapat ditampung terlebih dahulu dalam List<PengajuanSurat> selama pengguna masih berada di halaman formulir.

        Jika pengguna membatalkan pengajuan dan data tidak perlu disimpan, penggunaan in-memory sudah cukup.

        Alasan: Data tersebut hanya dibutuhkan sementara selama proses pengisian formulir. Tidak ada kebutuhan untuk mempertahankannya setelah aplikasi ditutup sehingga penyimpanan permanen tidak diperlukan.

    2. Situasi ketika Persistensi Mutlak Diperlukan

        Contohnya, pengguna sudah mengirimkan pengajuan surat kepada pihak desa dan ingin melihat kembali riwayat pengajuan tersebut meskipun aplikasi sudah ditutup atau perangkat dimulai ulang.

        Dalam situasi ini, data pengajuan harus disimpan secara permanen menggunakan media penyimpanan lokal atau database.

        Alasan: Data pengajuan surat merupakan informasi penting yang harus tetap tersedia agar pengguna dan pihak desa dapat melihat status serta riwayat pengajuan. Jika hanya menggunakan in-memory, seluruh data dapat hilang ketika aplikasi ditutup.

        Perlu diperhatikan bahwa shared_preferences lebih sesuai untuk data sederhana, seperti pengaturan aplikasi atau preferensi pengguna. Untuk menyimpan banyak data pengajuan surat yang membutuhkan operasi CRUD, relasi, dan riwayat, database lokal seperti SQLite lebih tepat digunakan.

**Kesimpulan**

Penyimpanan in-memory menggunakan List<PengajuanSurat> hanya mempertahankan data selama aplikasi berjalan, sedangkan persistensi menggunakan shared_preferences memungkinkan data sederhana tetap tersimpan meskipun aplikasi ditutup. Operasi shared_preferences bersifat asinkron karena melibatkan proses akses penyimpanan perangkat sehingga menggunakan Future dan membutuhkan await agar proses dapat ditunggu sampai selesai. In-memory cukup untuk data sementara, sedangkan persistensi diperlukan untuk data yang harus tetap tersedia setelah aplikasi dijalankan ulang.