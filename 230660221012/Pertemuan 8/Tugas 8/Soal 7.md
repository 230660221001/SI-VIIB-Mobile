1. **Mengapa setiap field bersifat final?**

    Pada model data PengajuanSurat, semua field (id, jenis, tanggal, dan status) menggunakan kata kunci final. Dalam Dart, final berarti suatu variabel hanya dapat diberi nilai satu kali. Setelah nilainya ditetapkan, variabel tersebut tidak dapat diisi ulang dengan nilai lain.
    - id digunakan sebagai identitas unik untuk membedakan setiap pengajuan surat.
    - jenis menyimpan nama atau jenis surat yang diajukan mahasiswa.
    - tanggal menyimpan tanggal pengajuan surat.
    - status menyimpan kondisi pengajuan, seperti menunggu verifikasi, diproses, atau selesai.
    Penggunaan final membuat objek pengajuan lebih konsisten karena field tidak dapat diubah secara langsung setelah objek dibuat. Hal ini juga membantu mengurangi perubahan data yang tidak disengaja.

    Namun, jika status atau data pengajuan perlu diperbarui, objek baru dapat dibuat dengan nilai yang berbeda, kemudian objek lama diganti di dalam daftar. Jadi, penggunaan final tidak berarti data pengajuan tidak dapat diperbarui sama sekali.

2. **Mengapa id wajib ada?**

    Field id wajib ada karena setiap pengajuan membutuhkan identitas yang unik. Jika terdapat beberapa pengajuan dengan jenis surat yang sama, sistem tetap dapat membedakan masing-masing pengajuan berdasarkan ID-nya.

    Contohnya:
    | ID | Jenis surat | Status |
    |:---|:--------|:-------------|
    | S001 | Surat Keterangan Aktif Kuliah | Diproses |
    | S002 | Surat Keterangan Aktif Kuliah | Selesai |

    Walaupun jenis suratnya sama, kedua pengajuan tersebut merupakan data yang berbeda karena memiliki ID yang berbeda.

    Dengan demikian, id memudahkan sistem menemukan pengajuan tertentu, memperbarui status pengajuan yang tepat, menghapus data yang dipilih, dan menghindari kesalahan saat mengelola banyak pengajuan.

3. **Perbedaan StatelessWidget dan StatefulWidget**

    StatelessWidget adalah widget yang tidak memiliki state internal yang dapat berubah selama siklus hidup widget. Widget ini cocok untuk tampilan yang relatif tetap dan tidak perlu mengelola perubahan data secara langsung.

    StatefulWidget adalah widget yang memiliki objek State untuk menyimpan dan mengelola data yang dapat berubah. Widget ini cocok untuk halaman yang perlu memperbarui tampilannya ketika terjadi perubahan data.

    Untuk halaman daftar pengajuan surat, saya akan menggunakan StatefulWidget.

    Alasannya, daftar pengajuan dapat berubah ketika mahasiswa menambahkan pengajuan baru, menghapus pengajuan, atau memperbarui statusnya. Dengan StatefulWidget, perubahan tersebut dapat ditampilkan pada layar tanpa harus membuka ulang aplikasi.

    Sebaliknya, StatelessWidget lebih cocok untuk komponen yang hanya menampilkan data yang diberikan dari luar dan tidak mengelola perubahan state-nya sendiri.

4. **Fungsi setState dan akibat jika tidak digunakan**

    setState() adalah metode pada objek State yang memberi tahu Flutter bahwa terdapat perubahan pada state sehingga Flutter perlu membangun ulang tampilan (rebuild) untuk mencerminkan perubahan tersebut.

    Contoh penambahan data pada daftar pengajuan:
    ```js
    setState(() {
    daftarPengajuan.add(
        const PengajuanSurat(
        id: 'S003',
        jenis: 'Surat Pengantar',
        tanggal: '29-10-2026',
        status: 'Menunggu Verifikasi',
        ),
    );
    });
    ```
    Pada contoh tersebut, data baru ditambahkan ke dalam daftarPengajuan di dalam setState(). Setelah itu, Flutter memperbarui tampilan agar pengajuan baru dapat terlihat pada halaman daftar.

    Jika data ditambahkan tanpa setState(), data di dalam list sebenarnya dapat bertambah, tetapi Flutter tidak otomatis mengetahui bahwa tampilan perlu diperbarui. Akibatnya, pengajuan baru mungkin belum terlihat di layar, meskipun datanya sudah tersimpan dalam list. Tampilan biasanya baru berubah ketika terjadi rebuild karena proses lain.

    Oleh karena itu, perubahan state yang memengaruhi tampilan harus diberitahukan kepada Flutter menggunakan setState() agar data dan tampilan tetap sinkron.

### Kesimpulan
final menjaga nilai field objek agar tidak berubah secara langsung, sedangkan id berfungsi sebagai identitas unik setiap pengajuan. StatefulWidget lebih sesuai untuk halaman daftar pengajuan yang datanya dapat berubah. Sementara itu, setState() diperlukan agar Flutter mengetahui perubahan data dan memperbarui tampilan sesuai kondisi terbaru.