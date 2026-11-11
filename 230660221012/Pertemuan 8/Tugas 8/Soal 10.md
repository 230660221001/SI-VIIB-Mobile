Untuk memenuhi kebutuhan unit perpustakaan kampus, aplikasi mobile peminjaman buku dirancang untuk memudahkan mahasiswa mencari buku, melakukan peminjaman, dan melihat riwayat peminjaman. Aplikasi mengintegrasikan konsep arsitektur sistem informasi, analisis kebutuhan, navigasi Flutter, model data, dan pengelolaan state.
1. Arsitektur Aplikasi

    Arsitektur aplikasi terdiri dari tiga bagian utama, yaitu aplikasi mobile (frontend), penyimpanan lokal, dan backend Sistem Informasi (server).

    Hubungan ketiganya dapat digambarkan sebagai berikut:
    ```mermaid
    flowchart TD
        A[Aplikasi mobile] --> B[Penyimpanan Lokal]
        B --> A[Aplikasi mobile]
        A[Aplikasi mobile] --> C[Backend Sistem Informasi]
        C --> A[Aplikasi mobile]
    ```
    Penjelasan setiap bagian:
    - Aplikasi Mobile (Flutter): Berfungsi sebagai antarmuka yang digunakan mahasiswa untuk mencari buku, mengisi formulir peminjaman, dan melihat riwayat transaksi.
    - Penyimpanan Lokal: Digunakan untuk menyimpan data sementara atau cache agar beberapa informasi dapat diakses lebih cepat tanpa harus selalu mengambil data dari server.
    - Backend Sistem Informasi: Bertugas mengelola data utama, seperti informasi buku, ketersediaan stok, identitas mahasiswa, dan transaksi peminjaman.

    `Alasan:` Ketiga bagian tersebut saling berhubungan karena aplikasi mobile membutuhkan backend untuk mendapatkan informasi buku dan memproses transaksi. Penyimpanan lokal membantu meningkatkan kenyamanan penggunaan aplikasi, sedangkan backend menjadi pusat pengelolaan data agar informasi peminjaman tetap konsisten.

2. Kebutuhan dan Alur Pengguna

    Dua kebutuhan utama (Must Have) yang harus tersedia dalam aplikasi adalah:

    a. Must Have 1 – Melihat Katalog Buku

        Mahasiswa dapat melihat daftar buku yang tersedia di perpustakaan, termasuk judul buku, nama penulis, kategori, dan status ketersediaan.

        Alasan: Fitur katalog merupakan kebutuhan utama karena mahasiswa harus mengetahui buku yang tersedia sebelum melakukan peminjaman.

    b. Must Have 2 – Melakukan Peminjaman Buku

        Mahasiswa dapat memilih buku, mengisi formulir peminjaman, dan mengirimkan permohonan peminjaman melalui aplikasi.

        Alasan: Fitur ini merupakan fungsi utama aplikasi karena tujuan pengembangan sistem adalah mempermudah proses peminjaman buku tanpa harus melakukan pencatatan secara manual.

    Alur pengguna (User Flow):
    ```mermaid
    flowchart TD
        A([Membuka Aplikasi]) --> B[Halaman Beranda]
        B --> C[Melihat Katalog Buku]
        C --> D[Memilih Buku]
        D --> E[Melihat Detail Buku]
        E --> F{Buku Tersedia?}
        F -->|Tidak| C
        F -->|Ya| G[Memilih Pinjam Buku]
        G --> H[Mengisi Form Peminjaman]
        H --> I[Menekan Tombol Kirim]
        I --> J{Data Valid?}
        J -->|Tidak| H
        J -->|Ya| K[Backend Memproses Pengajuan]
        K --> L[Menampilkan Status Pengajuan]
        L --> M([Tugas Selesai])
    ```
    `Alasan:` Alur tersebut dibuat secara berurutan agar pengguna dapat mengetahui ketersediaan buku terlebih dahulu sebelum mengajukan peminjaman. Validasi formulir juga diperlukan untuk menghindari data yang tidak lengkap atau tidak sesuai.

3. Struktur Komponen dan Navigasi

    Aplikasi menggunakan beberapa halaman utama yang dibangun menggunakan widget Flutter.

    1. Halaman Katalog Buku

        Halaman ini digunakan untuk menampilkan seluruh buku yang tersedia di perpustakaan.

        Struktur widget yang digunakan:
        ```js
        Scaffold(
        appBar: AppBar(
            title: Text('Katalog Buku'),
        ),
        body: ListView.builder(
            itemCount: daftarBuku.length,
            itemBuilder: (context, index) {
            return ListTile(
                title: Text(daftarBuku[index].judul),
                subtitle: Text(daftarBuku[index].penulis),
                trailing: Icon(Icons.arrow_forward),
            );
            },
        ),
        );
        ```
        Widget yang digunakan:
        - Scaffold: kerangka utama halaman.
        - AppBar: menampilkan judul halaman.
        - ListView.builder: menampilkan daftar buku secara dinamis.
        - ListTile: menampilkan informasi setiap buku.

        `Alasan:` ListView.builder dipilih karena jumlah buku dapat berubah-ubah. Widget ini mempermudah penampilan data dalam bentuk daftar tanpa harus membuat widget untuk setiap buku secara manual.

    2. Halaman Form Peminjaman

        Halaman ini digunakan untuk mengisi data peminjaman buku yang telah dipilih.

        Struktur widget yang digunakan:
        ```js
        Scaffold(
        appBar: AppBar(
            title: Text('Form Peminjaman'),
        ),
        body: Form(
            child: Column(
            children: [
                TextFormField(
                decoration: InputDecoration(
                    labelText: 'Nama Peminjam',
                ),
                ),
                TextFormField(
                decoration: InputDecoration(
                    labelText: 'NIM',
                ),
                ),
                ElevatedButton(
                onPressed: () {
                    // Proses peminjaman
                },
                child: Text('Ajukan Peminjaman'),
                ),
            ],
            ),
        ),
        );
        ```
        Widget yang digunakan:
        - Form: mengelompokkan input peminjaman.
        - TextFormField: menerima input nama dan NIM mahasiswa.
        - Column: menyusun komponen secara vertikal.
        - ElevatedButton: mengirimkan pengajuan peminjaman.

        Alasan: Widget Form dan TextFormField digunakan agar proses pengisian data lebih terstruktur dan dapat dilengkapi dengan validasi sebelum pengajuan dikirimkan.

    3. Navigasi Antarhalaman

        Navigasi antarhalaman dapat menggunakan Navigator.push() untuk berpindah ke halaman form peminjaman dan Navigator.pop() untuk kembali ke halaman sebelumnya.

        Contoh kode:
        ```js
        // Berpindah ke halaman form
        Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FormPeminjamanPage(
            buku: buku,
            ),
        ),
        );

        // Kembali ke halaman sebelumnya
        Navigator.pop(context);
        ```
        `Alasan:` Navigator.push() digunakan untuk membuka halaman baru sekaligus mengirimkan data buku yang dipilih. Sementara itu, Navigator.pop() digunakan agar pengguna dapat kembali ke halaman katalog tanpa harus membuka ulang aplikasi.
    
4. Data dan State
    1. Definisi Model Data Buku

        Model data Buku digunakan untuk merepresentasikan informasi setiap buku yang terdapat dalam katalog perpustakaan.

        Contoh definisi model menggunakan Dart:
        ```js
        class Buku {
        final int id;
        final String judul;
        final String penulis;
        final String kategori;
        final bool tersedia;

        Buku({
            required this.id,
            required this.judul,
            required this.penulis,
            required this.kategori,
            required this.tersedia,
        });
        }
        ```
        Penjelasan setiap field:
        | Field | Tipe data | Keterangan |
        |:--------|:--------|:--------|
        | ID | int | Identitas unik setiap buku |
        | Judul | String | Judul buku |
        | Penulis | String | Nama penulis buku |
        | Kategori | String | Kategori atau jenis buku |
        | Tersedia | bool | Status ketersediaan buku |

        Alasan: Model Buku dibuat untuk mengelompokkan informasi buku dalam satu objek sehingga data lebih terstruktur, mudah dipanggil, dan dapat digunakan kembali pada halaman katalog maupun form peminjaman.

    2. Pengelolaan Create (Meminjam Buku)

        Create merupakan operasi untuk menambahkan data peminjaman baru ke dalam daftar riwayat peminjaman.

        Contoh implementasi menggunakan StatefulWidget:
        ```js
        List<Buku> daftarBuku = [];
        List<Peminjaman> riwayatPeminjaman = [];

        void tambahPeminjaman(Peminjaman data) {
        setState(() {
            riwayatPeminjaman.add(data);
        });
        }
        ```
        Ketika mahasiswa mengirimkan formulir peminjaman, data peminjaman akan ditambahkan ke dalam riwayatPeminjaman.

        Alasan: Operasi add() digunakan untuk memasukkan transaksi baru ke dalam daftar. Sementara itu, setState() digunakan agar tampilan aplikasi diperbarui dan data peminjaman terbaru dapat langsung terlihat.

        Dalam aplikasi sebenarnya, data juga harus dikirim ke backend agar transaksi tercatat secara terpusat dan dapat diproses oleh petugas perpustakaan.

    3. Pengelolaan Read (Melihat Riwayat Peminjaman)

        Read merupakan operasi untuk membaca dan menampilkan data peminjaman yang sudah tersimpan.

        Contoh implementasi:
        ```js
        ListView.builder(
        itemCount: riwayatPeminjaman.length,
        itemBuilder: (context, index) {
            final data = riwayatPeminjaman[index];

            return ListTile(
            title: Text(data.judulBuku),
            subtitle: Text(data.status),
            );
        },
        );
        ```
        Data riwayat peminjaman ditampilkan menggunakan ListView.builder berdasarkan jumlah data yang tersedia di dalam riwayatPeminjaman.

        Alasan: ListView.builder digunakan agar seluruh riwayat peminjaman dapat ditampilkan secara dinamis. Dengan demikian, mahasiswa dapat mengetahui buku yang pernah diajukan dan status peminjamannya.

        Perlu diperhatikan bahwa pada aplikasi yang terhubung dengan backend, riwayat peminjaman sebaiknya diambil dari server, sedangkan state digunakan untuk menampung hasil data agar dapat ditampilkan pada antarmuka.


**Kesimpulan**

Aplikasi mobile peminjaman buku dirancang menggunakan Flutter dengan mengintegrasikan frontend, penyimpanan lokal, dan backend Sistem Informasi. Dua kebutuhan utama aplikasi adalah melihat katalog dan melakukan peminjaman buku. Navigasi menggunakan Navigator.push() dan Navigator.pop(), sedangkan pengelolaan data menggunakan model Buku dan state pada StatefulWidget.

Operasi Create digunakan untuk menambahkan transaksi peminjaman, sedangkan Read digunakan untuk menampilkan riwayat peminjaman. Dengan rancangan tersebut, aplikasi diharapkan dapat mempermudah mahasiswa dalam mencari dan meminjam buku serta membantu perpustakaan mengelola transaksi secara lebih terstruktur.