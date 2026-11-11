Analisis kebutuhan dilakukan untuk menentukan fitur yang harus tersedia dalam aplikasi pengajuan surat mahasiswa. Kebutuhan dibagi menjadi kebutuhan fungsional dan nonfungsional, kemudian ditentukan prioritasnya menggunakan metode MoSCoW.

1. Kebutuhan fungsional dan nonfungsional
    Kebutuhan fungsional menjelaskan layanan atau tindakan yang dapat dilakukan oleh sistem. Sementara itu, kebutuhan nonfungsional menjelaskan kualitas atau standar yang harus dipenuhi sistem, seperti keamanan, kemudahan penggunaan, dan kecepatan respons.
    
    | No. | Permintaan mahasiswa | Jenis kebutuhan | Penjelasan |
    |:---:|:--------|:-------------|:------------------|
    | 1 | Mengajukan surat keterangan aktif kuliah | Fungsional | Sistem menyediakan formulir untuk mengisi data dan mengirim pengajuan surat. |
    | 2 | Melihat status pengajuan | Fungsional | Sistem menampilkan status pengajuan, misalnya menunggu verifikasi, diproses, atau selesai. |
    | 3 | Menerima notifikasi saat surat siap diambil | Fungsional | Sistem mengirimkan pemberitahuan ketika surat telah selesai diproses. |

    Ketiga permintaan tersebut termasuk kebutuhan fungsional karena semuanya menjelaskan fitur atau layanan yang diharapkan tersedia di aplikasi. Kebutuhan nonfungsional belum disebutkan secara langsung dalam permintaan, tetapi tetap diperlukan untuk mendukung aplikasi, misalnya keamanan data mahasiswa, kemudahan penggunaan, dan waktu respons yang baik.

2. Prioritas menggunakan MoSCoW
    Metode MoSCoW membagi kebutuhan menjadi empat tingkat prioritas:
    - `Must`: wajib tersedia agar fungsi utama aplikasi dapat berjalan.
    - `Should`: penting, tetapi aplikasi masih dapat berfungsi tanpa fitur tersebut untuk sementara.
    - `Could`: fitur tambahan yang bermanfaat jika waktu dan sumber daya mencukupi.
    - `Won't`: tidak dikerjakan pada ruang lingkup pengembangan saat ini, tetapi dapat dipertimbangkan di masa depan.
    
    Berikut penentuan prioritas untuk ketiga kebutuhan tersebut.
    | Kebutuhan | Jenis | Prioritas | Alasan |
    |:------|:--------|:-------------|:------------------|
    | Mengajukan surat keterangan aktif kuliah | Fungsional | Must | Pengajuan surat merupakan fungsi utama aplikasi. Tanpa fitur ini, tujuan utama aplikasi tidak tercapai. |
    | Melihat status pengajuan | Fungsional | Must | Mahasiswa perlu mengetahui perkembangan pengajuannya tanpa harus datang atau bertanya langsung kepada petugas. |
    | Menerima notifikasi saat surat siap diambil | Fungsional | Should | Notifikasi mempermudah mahasiswa mengetahui bahwa surat sudah selesai. Namun, tanpa notifikasi, mahasiswa masih dapat memeriksa status melalui aplikasi. |

    Tidak ada kebutuhan yang secara eksplisit masuk kategori Could atau Won't dari tiga permintaan tersebut. Kedua kategori itu tidak harus digunakan jika memang tidak ada kebutuhan yang sesuai.

    Sebagai tambahan, kebutuhan nonfungsional seperti keamanan data mahasiswa dapat diprioritaskan sebagai Must, karena data pribadi harus dilindungi. Kemudahan penggunaan juga penting agar mahasiswa dapat mengajukan surat tanpa mengalami kesulitan.

3. User flow untuk kebutuhan Must
    Kebutuhan Must yang dipilih adalah mengajukan surat keterangan aktif kuliah dan melihat status pengajuan. Alur berikut menggambarkan proses mahasiswa mengajukan surat hingga memeriksa statusnya.
    ```mermaid
    flowchart TD
        D1["1. Mahasiswa membuka aplikasi"] --> D2["2. Login ke aplikasi"]
        D2 --> D3["3. Memilih menu Pengajuan Surat"]
        D3 --> D4["4. Memilih Surat Keterangan Aktif Kuliah"]
        D4 --> D5["5. Mengisi formulir dan mengirim pengajuan"]
        D5 --> D6["6. Sistem memvalidasi dan menyimpan pengajuan"]
        D6 --> D7["7. Mahasiswa membuka menu Status Pengajuan"]
        D7 --> D8["8. Sistem menampilkan status pengajuan"]
    ```
    Penjelasan user flow:
    1. Mahasiswa membuka aplikasi dan login agar sistem dapat mengenali identitas pemohon.
    2. Mahasiswa memilih menu pengajuan surat, kemudian menentukan jenis surat yang dibutuhkan.
    3. Mahasiswa mengisi formulir sesuai persyaratan dan mengirimkannya.
    4. Sistem memvalidasi data. Jika data tidak lengkap, sistem meminta mahasiswa memperbaikinya. Jika valid, sistem menyimpan pengajuan.
    5. Mahasiswa membuka menu status pengajuan untuk mengetahui perkembangan prosesnya.
    6. Sistem menampilkan status terbaru agar mahasiswa dapat memantau pengajuan tanpa perlu datang langsung ke loket administrasi.

    Fitur pengajuan surat dan pemeriksaan status ditetapkan sebagai Must karena keduanya mendukung proses utama aplikasi. Notifikasi ditetapkan sebagai Should karena meningkatkan kenyamanan, tetapi tidak menjadi satu-satunya cara untuk mengetahui bahwa surat telah selesai.