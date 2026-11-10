# Tes Konsep UTS — Rian Rianto (230660221004)

---

## Soal 1 — Konsep Aplikasi Bergerak dalam SI

**1. Mobilitas dan portabilitas (Mobility & Portability)**
Aplikasi bergerak dapat diakses melalui smartphone yang mudah dibawa ke mana saja dan digunakan kapan saja selama tersedia koneksi yang dibutuhkan.
*Contoh penerapan:* Mahasiswa dapat mengajukan surat keterangan melalui aplikasi mobile dari rumah, kos, atau saat berada di lingkungan kampus tanpa harus datang langsung ke loket administrasi.

**2. Pemanfaatan fitur perangkat (Device Integration)**
Aplikasi bergerak dapat memanfaatkan fitur bawaan smartphone, seperti kamera, GPS, notifikasi, dan penyimpanan lokal untuk mendukung kebutuhan pengguna.
*Contoh penerapan:* Mahasiswa dapat menggunakan kamera smartphone untuk memotret dan mengunggah dokumen persyaratan. Selain itu, aplikasi dapat mengirimkan notifikasi ketika pengajuan surat telah disetujui atau selesai diproses.

**3. Interaksi yang cepat dan personal (Personalized & Interactive Experience)**
Aplikasi bergerak memungkinkan interaksi yang lebih personal melalui antarmuka yang dirancang khusus untuk layar sentuh serta dukungan notifikasi langsung kepada pengguna.
*Contoh penerapan:* Mahasiswa dapat melihat status pengajuan surat secara langsung melalui aplikasi, menerima pemberitahuan ketika terdapat kekurangan dokumen, dan mendapatkan informasi ketika surat sudah dapat diunduh.

---

## Soal 2 — Dasar Pemrograman Dart

| Bagian kode | Fungsi |
|:--|:--|
| `List<String>` | Menyimpan kumpulan data berupa teks (`String`) dalam satu variabel. |
| Parameter `String jenis` | Menerima masukan berupa nama atau jenis surat. |
| `isEmpty` | Memeriksa apakah masukan kosong atau tidak. |
| `return` pada kondisi error | Menghentikan fungsi jika terjadi kesalahan, sehingga data tidak jadi ditambahkan. |
| `add()` | Menambahkan data baru ke dalam daftar surat. |
| Perulangan `for` | Menampilkan semua data surat satu per satu sesuai urutan. |

**Kesalahan jika validasi `isEmpty` dihapus:**
Pengguna dapat memasukkan data kosong. Akibatnya, data yang tidak valid tetap tersimpan dalam daftar surat dan dapat mengganggu pengelolaan data.

---

## Soal 3 — Struktur Flutter dan Widget

**A. Fungsi setiap widget**

| Widget | Fungsi |
|:--|:--|
| `MaterialApp` | Widget utama untuk menjalankan aplikasi Flutter dengan desain Material Design. |
| `Scaffold` | Menyediakan struktur dasar halaman aplikasi. |
| `AppBar` | Menampilkan bagian atas halaman, biasanya berisi judul. |
| `Column` | Menyusun widget secara vertikal (dari atas ke bawah). |
| `Text` | Menampilkan tulisan atau teks pada layar. |
| `ListView.builder` | Menampilkan daftar data secara berurutan dan efisien. |

**B. Masalah jika `ListView.builder` langsung ditempatkan di dalam `Column`**
Masalah yang dapat terjadi adalah *RenderFlex overflow* atau *unbounded height*, karena `ListView` membutuhkan batas tinggi, sedangkan `Column` tidak otomatis memberikan batas tinggi kepada `ListView`.

**C. Cara memperbaiki**
Gunakan widget `Expanded` untuk memberikan sisa ruang yang tersedia kepada `ListView`.

```dart
Column(
  children: [
    Text('Pilih jenis surat'),
    Expanded(
      child: ListView.builder(
        itemCount: daftarSurat.length,
        itemBuilder: (context, index) {
          return Text(daftarSurat[index]);
        },
      ),
    ),
  ],
)
```

---

## Soal 4 — Analisis Kebutuhan dan User Flow

**1. Klasifikasi kebutuhan dan prioritas MoSCoW**

| No. | Kebutuhan | Jenis | Prioritas | Alasan |
|:---:|:--|:--|:---:|:--|
| 1 | Mengajukan surat aktif kuliah | Fungsional | Must | Fungsi utama aplikasi. |
| 2 | Melihat status pengajuan | Fungsional | Must | Mahasiswa perlu mengetahui perkembangan pengajuan. |
| 3 | Menerima notifikasi saat surat siap diambil | Fungsional | Should | Memudahkan mahasiswa mengetahui surat selesai. |
| 4 | Notifikasi harus terkirim dengan cepat dan tepat waktu | Nonfungsional | Should | Agar mahasiswa tidak terlambat mengetahui informasi surat selesai. |
| 5 | Data pengajuan harus aman dan hanya dapat diakses oleh pihak berwenang | Nonfungsional | Must | Untuk menjaga kerahasiaan data mahasiswa. |

**2. User flow untuk kebutuhan Must**

1. Mahasiswa membuka aplikasi.
2. Mahasiswa melakukan login.
3. Mahasiswa memilih menu pengajuan surat.
4. Mahasiswa memilih surat keterangan aktif kuliah.
5. Mahasiswa mengisi formulir pengajuan.
6. Mahasiswa mengirim pengajuan.
7. Sistem menyimpan data pengajuan.
8. Mahasiswa membuka menu status pengajuan.
9. Sistem menampilkan status pengajuan.

**Kesimpulan:** Kebutuhan fungsional menjelaskan fitur yang harus tersedia, sedangkan kebutuhan nonfungsional menjelaskan kualitas atau kinerja aplikasi, seperti keamanan dan kecepatan notifikasi.

---

## Soal 5 — UI/UX Mobile

**1. Desain sederhana dan mudah dibaca (Simplicity)**
- *Keputusan desain:* Menggunakan tampilan daftar yang sederhana, teks jelas, dan informasi penting seperti nama surat serta status.
- *Alasan:* Layar smartphone terbatas sehingga tampilan harus mudah dibaca dan tidak terlalu penuh.

**2. Tombol mudah disentuh (Touch-Friendly)**
- *Keputusan desain:* Membuat tombol "Ajukan" cukup besar dan memberikan jarak antar tombol.
- *Alasan:* Memudahkan pengguna menekan tombol dengan jari tanpa salah memilih.

**3. Informasi mudah ditemukan (Efficiency)**
- *Keputusan desain:* Menampilkan status surat dengan warna berbeda dan menyediakan fitur pencarian.
- *Alasan:* Mahasiswa dapat menemukan jenis surat dan mengetahui statusnya dengan cepat meskipun terdapat 20 jenis surat.

---

## Soal 6 — Navigasi dan Interaksi

**1. Navigasi antarhalaman menggunakan Navigator**

| Metode | Kegunaan |
|:--|:--|
| `Navigator.pushNamed()` | Berpindah ke halaman baru berdasarkan nama route. |
| `Navigator.pop()` | Kembali ke halaman sebelumnya. |
| `Navigator.push()` | Alternatif navigasi menggunakan route langsung, tetapi tidak digunakan dalam pola praktikum ini. |

**2. Mengirim data jenis surat**
Data dikirim menggunakan `arguments` melalui `pushNamed()`.

Dari halaman daftar surat:

```dart
Navigator.pushNamed(
  context,
  '/form',
  arguments: jenisSurat,
);
```

Di halaman form, data diterima menggunakan `ModalRoute`:

```dart
final args = ModalRoute.of(context)?.settings.arguments;

if (args is String) {
  jenisSurat = args;
} else {
  jenisSurat = '';
}
```

Pengecekan `is String` memastikan tipe data benar, sedangkan `else` menangani kondisi jika data kosong atau tidak sesuai.

**3. Memberikan feedback setelah form dikirim**
Setelah mahasiswa menekan tombol kirim, aplikasi menampilkan pesan menggunakan `SnackBar`.

```dart
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('Pengajuan berhasil dikirim'),
  ),
);
```

Setelah itu, mahasiswa dapat diarahkan ke halaman detail status untuk melihat perkembangan pengajuan.

---

## Soal 7 — Model Data dan State

**1. Mengapa setiap field menggunakan `final`?**
Karena `final` membuat nilai data tidak bisa diubah setelah objek dibuat sehingga data lebih terjaga.

**2. Mengapa `id` wajib ada?**
Karena `id` digunakan sebagai identitas unik setiap pengajuan agar data tidak tertukar dan mudah dicari, diubah, atau dihapus.

**3. Perbedaan `StatelessWidget` dan `StatefulWidget`**
- `StatelessWidget` digunakan untuk tampilan yang tidak berubah.
- `StatefulWidget` digunakan untuk tampilan yang datanya bisa berubah.

Halaman daftar pengajuan sebaiknya menggunakan `StatefulWidget` karena jumlah dan status pengajuan bisa berubah.

**4. Fungsi `setState`**
`setState` digunakan untuk memperbarui tampilan ketika ada perubahan data.

```dart
setState(() {
  daftarSurat.add(pengajuanBaru);
});
```

Jika data ditambahkan tanpa `setState`, data memang masuk ke dalam daftar, tetapi tampilan tidak otomatis diperbarui.

---

## Soal 8 — CRUD Lokal

| Operasi | Method List / mekanisme | Fungsi |
|:--|:--|:--|
| Create | `add()` | Menambahkan pengajuan surat baru ke dalam daftar. |
| Read | `forEach()` atau `map()` | Menampilkan seluruh data pengajuan surat. |
| Update | `indexWhere()` dan `[]` | Mencari posisi data, lalu mengubahnya. |
| Delete | `removeWhere()` | Menghapus pengajuan surat dari daftar. |

```dart
// Create
daftarSurat.add(pengajuanBaru);

// Read
daftarSurat.forEach((surat) {
  print(surat.jenis);
});

// Update
int index = daftarSurat.indexWhere((s) => s.id == id);
daftarSurat[index] = pengajuanBaru;

// Delete
daftarSurat.removeWhere((s) => s.id == id);
```

**Mengapa menggunakan `id`, bukan index?**
`id` digunakan karena setiap pengajuan memiliki identitas unik dan tetap.

**Konsekuensi bila index digunakan sebagai kunci:**
Posisi data bisa berubah ketika ada data yang ditambahkan atau dihapus. Akibatnya, data yang diubah atau dihapus bisa salah sasaran.

---

## Soal 9 — Persistensi Data Lokal

**1. Perbedaan in-memory dan persistensi**
- *In-memory:* Data hanya disimpan sementara di dalam memori aplikasi. Jika aplikasi ditutup, data akan hilang.
- *Shared Preferences:* Data disimpan secara permanen di perangkat sehingga tetap tersedia meskipun aplikasi ditutup atau dibuka kembali.

**2. Mengapa `shared_preferences` bersifat asinkron (`Future`)?**
Karena proses penyimpanan membutuhkan waktu untuk mengakses penyimpanan perangkat. Oleh karena itu, proses dilakukan secara asinkron agar aplikasi tidak terhenti saat menyimpan data.

**3. Apa yang terjadi jika `await` diabaikan?**
Data belum tentu selesai disimpan ketika aplikasi melanjutkan proses berikutnya. Akibatnya, data berisiko belum tersimpan saat dibutuhkan.

**4. Contoh penggunaan**
- *In-memory sudah cukup:* Menyimpan data sementara saat mahasiswa mengisi formulir pengajuan surat.
- *Persistensi diperlukan:* Menyimpan data pengajuan surat agar tidak hilang ketika aplikasi ditutup dan dapat dibuka kembali.

---

## Soal 10 — Integrasi Konsep Lintas Pertemuan

**1. Arsitektur aplikasi**

Aplikasi mobile terhubung dengan penyimpanan lokal dan backend Sistem Informasi.

- *Aplikasi mobile:* Digunakan mahasiswa untuk melihat katalog dan meminjam buku.
- *Penyimpanan lokal:* Menyimpan data sementara atau riwayat peminjaman.
- *Backend SI:* Mengelola data buku, akun mahasiswa, dan transaksi peminjaman.

Alurnya: mahasiswa menggunakan aplikasi, aplikasi mengirim permintaan ke backend, kemudian data disimpan dan hasilnya ditampilkan kembali pada aplikasi.

**2. Kebutuhan dan alur pengguna**

Dua kebutuhan *Must have*:
1. Mahasiswa dapat melihat daftar buku yang tersedia.
2. Mahasiswa dapat melakukan peminjaman buku.

Alur pengguna:
1. Mahasiswa membuka aplikasi.
2. Mahasiswa melakukan login.
3. Mahasiswa membuka halaman katalog buku.
4. Mahasiswa memilih buku.
5. Mahasiswa menekan tombol pinjam.
6. Mahasiswa mengisi form peminjaman.
7. Mahasiswa menekan tombol kirim.
8. Sistem menyimpan data peminjaman.
9. Aplikasi menampilkan pesan bahwa peminjaman berhasil.

**3. Struktur komponen dan navigasi**

Struktur widget utama:

| Widget | Fungsi |
|:--|:--|
| `MaterialApp` | Menjalankan aplikasi. |
| `Scaffold` | Menyediakan struktur halaman. |
| `AppBar` | Menampilkan judul halaman. |
| `Column` | Menyusun komponen secara vertikal. |
| `ListView.builder` | Menampilkan daftar buku. |
| `TextField` | Menerima input pengguna. |
| `ElevatedButton` | Menjalankan proses peminjaman. |

Navigasi menggunakan `Navigator.push()` untuk berpindah dari halaman katalog ke halaman form peminjaman, sedangkan `Navigator.pop()` digunakan untuk kembali ke halaman sebelumnya.

**4. Data dan state**

Model data `Buku`:

```dart
class Buku {
  final String id;
  final String judul;
  final String penulis;
  final String kategori;
  final String status;

  Buku({
    required this.id,
    required this.judul,
    required this.penulis,
    required this.kategori,
    required this.status,
  });
}
```

Pengelolaan data dan state:
- *Create:* Menggunakan `add()` untuk menambahkan data peminjaman baru ke dalam daftar.
- *Read:* Menggunakan `forEach()` atau `ListView.builder` untuk menampilkan riwayat peminjaman.
- *State:* Menggunakan `StatefulWidget` dan `setState()` agar tampilan diperbarui ketika ada perubahan data.

---

Deklarasi penggunaan AI: Claude (Anthropic) — memberi masukan atas draf jawaban Soal 4 dan Soal 6 serta merapikan format file; isi jawaban dirumuskan ulang oleh penulis.
