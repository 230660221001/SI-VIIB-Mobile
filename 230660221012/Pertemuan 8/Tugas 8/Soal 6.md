Pada aplikasi pengajuan surat mahasiswa, navigasi digunakan untuk berpindah antara tiga halaman, yaitu daftar surat, form pengajuan, dan detail status. Flutter menyediakan widget Navigator untuk mengatur perpindahan halaman dengan konsep navigation stack, yaitu halaman yang dibuka akan ditumpuk di atas halaman sebelumnya.
1. Implementasi navigasi menggunakan Navigator
    Terdapat tiga metode yang dapat digunakan, yaitu push(), pushNamed(), dan pop().

    1. Navigator.push()

        Metode ini digunakan untuk membuka halaman baru dengan memberikan objek Route secara langsung, biasanya menggunakan MaterialPageRoute.

        `Contoh:` ketika mahasiswa memilih salah satu jenis surat pada halaman daftar, aplikasi membuka form pengajuan dan mengirimkan data jenis surat yang dipilih.
        ```js
        Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FormPengajuanPage(
            jenisSurat: 'Surat Keterangan Aktif Kuliah',
            ),
        ),
        );
        ```
        Metode ini cocok digunakan ketika perpindahan halaman membutuhkan konfigurasi khusus atau pengiriman data secara langsung melalui konstruktor.
    
    2. Navigator.pushNamed()

        Metode ini digunakan untuk membuka halaman berdasarkan nama rute yang telah didaftarkan pada MaterialApp, misalnya /form atau /detail-status.

        `Contoh:` setelah pengajuan berhasil dikirim, aplikasi membuka halaman detail status dengan membawa data pengajuan.
        ```js
        Navigator.pushNamed(
        context,
        '/detail-status',
        arguments: dataPengajuan,
        );
        ```
        Metode ini cocok untuk aplikasi dengan beberapa halaman karena nama rute membuat navigasi lebih terstruktur dan mudah dikelola.

    3. Navigator.pop()

        Metode ini digunakan untuk menutup halaman yang sedang terbuka dan kembali ke halaman sebelumnya dalam navigation stack.

        `Contoh:` mahasiswa menekan tombol kembali pada halaman form pengajuan untuk kembali ke halaman daftar surat.
        ```js
        Navigator.pop(context);
        ```
        Metode ini membantu pengguna kembali ke halaman sebelumnya tanpa harus membuka ulang halaman tersebut dari awal.

2. Pengiriman data jenis surat dari halaman daftar ke form

    Data jenis surat dapat dikirim melalui dua cara, yaitu menggunakan parameter konstruktor ketika memakai Navigator.push() atau menggunakan arguments ketika memakai Navigator.pushNamed().

    Contoh menggunakan parameter konstruktor:
    ```js
    class FormPengajuanPage extends StatelessWidget {
    final String jenisSurat;

    const FormPengajuanPage({
        super.key,
        required this.jenisSurat,
    });

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(title: Text('Form Pengajuan')),
        body: Center(
            child: Text('Jenis surat: $jenisSurat'),
        ),
        );
    }
    }
    ```
    Ketika mahasiswa memilih surat “Surat Keterangan Aktif Kuliah”, nilai tersebut dikirim ke FormPengajuanPage melalui parameter jenisSurat. Form kemudian menampilkan jenis surat yang dipilih sehingga mahasiswa tidak perlu memilih atau mengetik ulang jenis surat tersebut.

    `Alasannya:` pengiriman data ant halaman membuat informasi yang dipilih pengguna tetap konsisten dan mengurangi risiko kesalahan input.

3. Pemberian feedback setelah form dikirim

    Setelah mahasiswa mengisi dan mengirim form, sistem perlu memberikan umpan balik (feedback) agar mahasiswa mengetahui apakah pengajuan berhasil atau gagal.

    Salah satu cara yang dapat digunakan adalah SnackBar untuk menampilkan pesan sementara setelah validasi berhasil.
    ```js
    if (_formKey.currentState!.validate()) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
        content: Text('Pengajuan surat berhasil dikirim'),
        ),
    );
    }
    ```
    Sebelum menampilkan pesan berhasil, sistem harus memvalidasi data yang diisi. Jika terdapat kolom wajib yang kosong, sistem menampilkan pesan validasi dan tidak melanjutkan pengiriman.

    Jika pengajuan berhasil disimpan, aplikasi juga dapat membuka halaman detail status menggunakan Navigator.pushNamed() agar mahasiswa dapat melihat status pengajuannya, misalnya “Menunggu Verifikasi”.

    `Alasannya:` feedback membantu pengguna memahami hasil tindakannya dan mengurangi ketidakpastian setelah menekan tombol kirim. Namun, pesan berhasil hanya boleh ditampilkan setelah sistem benar-benar memastikan pengajuan berhasil disimpan, bukan sekadar setelah tombol ditekan.

### Kesimpulan
Navigator.push() digunakan untuk membuka halaman baru dengan rute yang dibuat langsung, Navigator.pushNamed() digunakan untuk berpindah menggunakan nama rute yang telah didaftarkan, sedangkan Navigator.pop() digunakan untuk kembali ke halaman sebelumnya. Data jenis surat dikirim melalui konstruktor atau arguments, sementara feedback diberikan melalui validasi, SnackBar, dan halaman detail status. Kombinasi tersebut membuat alur pengajuan surat lebih terstruktur, informatif, dan mudah digunakan.