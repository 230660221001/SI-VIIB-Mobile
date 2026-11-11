CRUD merupakan singkatan dari Create, Read, Update, dan Delete, yaitu empat operasi dasar yang digunakan untuk mengelola data dalam aplikasi. Pada Flutter, CRUD lokal dapat diterapkan menggunakan List untuk menyimpan data sementara di dalam aplikasi tanpa harus menggunakan database atau server.

## Berikut penjelasan setiap operasi CRUD beserta method List yang digunakan.
1. **Create (Menambahkan Data)**

    Create merupakan operasi untuk menambahkan data baru ke dalam daftar. Pada aplikasi pengajuan surat, operasi ini digunakan ketika pengguna mengisi formulir pengajuan surat, kemudian data tersebut disimpan ke dalam List.

    Method yang digunakan adalah:
    - add(): menambahkan satu data baru ke dalam daftar.
    - addAll(): menambahkan beberapa data sekaligus.
    Contoh kode:
    ```js
    List<Map<String, dynamic>> pengajuanSurat = [];

    pengajuanSurat.add({
    'id': 1,
    'nama': 'Andi',
    'jenisSurat': 'Surat Pengantar'
    });

    setState(() {});
    ```
    Alasan: Method add() digunakan karena data pengajuan surat yang baru harus dimasukkan ke dalam daftar agar dapat ditampilkan dan dikelola kembali. Penggunaan setState() bertujuan agar tampilan Flutter diperbarui setelah data berhasil ditambahkan.

2. **Read (Membaca atau Menampilkan Data)**

    Read merupakan operasi untuk membaca dan menampilkan data yang sudah tersimpan di dalam List. Pada aplikasi pengajuan surat, operasi ini digunakan untuk menampilkan seluruh data pengajuan surat kepada admin atau pengguna.

    Method yang digunakan antara lain:
    - ListView.builder: menampilkan data dalam bentuk daftar secara dinamis.
    - where(): mencari data berdasarkan kondisi tertentu.
    - firstWhere(): mencari data pertama yang sesuai dengan kondisi.
    Contoh kode:
    ```js
    ListView.builder(
    itemCount: pengajuanSurat.length,
    itemBuilder: (context, index) {
        return ListTile(
        title: Text(pengajuanSurat[index]['nama']),
        subtitle: Text(pengajuanSurat[index]['jenisSurat']),
        );
    },
    );
    ```
    Alasan: ListView.builder digunakan karena mampu menampilkan data berdasarkan jumlah elemen yang tersedia di dalam List. Dengan demikian, ketika jumlah pengajuan surat bertambah, daftar akan menyesuaikan secara otomatis tanpa harus membuat tampilan satu per satu.

3. **Update (Mengubah Data)**

    Update merupakan operasi untuk mengubah data yang sudah tersimpan. Pada aplikasi pengajuan surat, operasi ini dapat digunakan ketika pengguna ingin memperbaiki nama atau jenis surat yang sebelumnya sudah diajukan.

    Method yang digunakan:
    - indexWhere(): mencari posisi data berdasarkan kondisi tertentu.
    - []=: mengganti elemen pada posisi tertentu di dalam List.
    Contoh kode:
    ```js
    int index = pengajuanSurat.indexWhere(
    (item) => item['id'] == 1
    );

    if (index != -1) {
    pengajuanSurat[index] = {
        'id': 1,
        'nama': 'Budi',
        'jenisSurat': 'Surat Keterangan'
    };
    }

    setState(() {});
    ```
    Alasan: indexWhere() digunakan untuk menemukan data berdasarkan id yang dimiliki, sedangkan []= digunakan untuk mengganti data lama dengan data baru. setState() diperlukan agar perubahan data langsung terlihat pada tampilan aplikasi.

4. **Delete (Menghapus Data)**

    Delete merupakan operasi untuk menghapus data yang sudah tersimpan di dalam daftar. Pada aplikasi pengajuan surat, operasi ini dapat digunakan ketika pengguna atau admin ingin menghapus pengajuan surat yang sudah tidak diperlukan.

    Method yang digunakan:
    - remove(): menghapus elemen berdasarkan nilai objek.
    - removeAt(): menghapus elemen berdasarkan posisi index.
    - removeWhere(): menghapus elemen berdasarkan kondisi tertentu.
    Contoh kode:
    ```js
    pengajuanSurat.removeWhere(
    (item) => item['id'] == 1
    );

    setState(() {});
    ```
    Alasan: removeWhere() digunakan karena dapat menghapus data berdasarkan kondisi tertentu, dalam contoh ini berdasarkan id pengajuan surat. Cara ini lebih aman untuk memastikan data yang dihapus merupakan data yang dimaksud, bukan sekadar data yang berada pada posisi tertentu.

#
Mengapa id Digunakan sebagai Kunci Update dan Delete, Bukan Index Daftar?

id digunakan sebagai kunci dalam operasi update dan delete karena setiap data seharusnya memiliki identitas yang unik dan tetap. Dengan menggunakan id, aplikasi dapat menemukan dan mengelola data tertentu meskipun posisi data tersebut di dalam List berubah.

Sebaliknya, index merupakan nomor posisi data di dalam daftar, yang dapat berubah ketika ada penambahan atau penghapusan data.

Contohnya:
| Index | ID | Nama |
|:-----|:-----|:-----|
| 0 | 101 | Andi |
| 1 | 102 | Budi |
| 2 | 103 | Citra |

Jika data Andi dihapus, susunan daftar menjadi:
| Index | ID | Nama |
|:-----|:-----|:-----|
| 0 | 102 | Budi |
| 1 | 103 | Citra |

Terlihat bahwa index Budi berubah dari 1 menjadi 0 dan index Citra berubah dari 2 menjadi 1, sedangkan id masing-masing data tetap.

Konsekuensi jika menggunakan index sebagai kunci:
1. Kesalahan update: Jika posisi data berubah, aplikasi berisiko mengubah data yang salah karena index sebelumnya sudah tidak sesuai.
2. Kesalahan delete: Aplikasi dapat menghapus data lain yang menempati index tersebut setelah terjadi perubahan susunan daftar.
3. Ketergantungan pada urutan data: Operasi CRUD menjadi kurang aman karena keberhasilannya bergantung pada posisi data, bukan identitas sebenarnya.
4. Sulit menjaga konsistensi data: Ketika data sering ditambahkan atau dihapus, perubahan index dapat menyebabkan kesalahan dalam pengelolaan data.
Oleh karena itu, penggunaan id lebih disarankan karena identitas data bersifat unik dan tidak berubah meskipun urutan data di dalam List mengalami perubahan.

**Kesimpulan**

Operasi CRUD pada Flutter dapat dilakukan menggunakan List dengan method add() untuk menambahkan data, ListView.builder untuk menampilkan data, indexWhere() dan []= untuk mengubah data, serta removeWhere() untuk menghapus data. Penggunaan id sebagai kunci update dan delete lebih tepat dibandingkan index karena id bersifat unik dan tetap, sedangkan index dapat berubah ketika susunan data mengalami perubahan. Dengan demikian, pengelolaan data pengajuan surat menjadi lebih akurat dan mengurangi risiko kesalahan dalam aplikasi.