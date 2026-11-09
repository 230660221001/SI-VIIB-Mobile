# Model Data — Pendataan Bencana BPBD

**Mata Kuliah:** Pengembangan Aplikasi Bergerak (PAB)  
**NIM:** 230660221088  
**Nama:** Muhammad Panji Adhitya  
**Kelas:** SI-VIIB  

## 1. Entitas Utama: `KejadianBencana`

Entitas ini digunakan untuk mencatat kejadian yang diterima petugas BPBD melalui jalur selain formulir masyarakat. Entitas menjadi sumber data utama operasi CRUD pada Tugas 7 dan diturunkan dari kebutuhan F-04 serta F-06.

| Field | Tipe Dart | Wajib? | Sumber nilai | Kebutuhan | Alasan |
|---|---|---:|---|---|---|
| `id` | `String` | Ya | Sistem | F-04, F-06 | Identitas unik agar data yang tepat dapat ditemukan saat update dan delete. Dibuat dengan `DateTime.now().microsecondsSinceEpoch.toString()`. |
| `jenis` | `String` | Ya | Form petugas | F-04 | Menunjukkan jenis kejadian bencana yang dicatat. |
| `lokasi` | `String` | Ya | Form petugas | F-04 | Menunjukkan lokasi atau kecamatan kejadian. |
| `tanggal` | `String` | Ya | Form petugas | F-04 | Menyimpan tanggal dan waktu kejadian sesuai informasi yang diterima. |
| `deskripsi` | `String` | Ya | Form petugas | F-04 | Menjelaskan kondisi atau informasi awal mengenai kejadian. |
| `kontak` | `String?` | Tidak | Form petugas | F-04 | Kontak sumber informasi bersifat opsional karena tidak selalu tersedia. |
| `statusPenanganan` | `String` | Ya | Sistem saat Create; pilihan petugas saat Update | F-06 | Menunjukkan tahap tindak lanjut: `Pemantauan`, `Penanganan`, atau `Selesai`. |

### Bentuk model

```dart
class KejadianBencana {
  const KejadianBencana({
    required this.id,
    required this.jenis,
    required this.lokasi,
    required this.tanggal,
    required this.statusPenanganan,
    required this.deskripsi,
    this.kontak,
  });

  final String id;
  final String jenis;
  final String lokasi;
  final String tanggal;
  final String statusPenanganan;
  final String deskripsi;
  final String? kontak;

  @override
  String toString() =>
      'KejadianBencana(id: $id, jenis: $jenis, lokasi: $lokasi, '
      'tanggal: $tanggal, status: $statusPenanganan)';
}
```

Semua field dibuat `final` agar objek tidak diubah langsung. Saat Update, aplikasi membuat objek baru dengan nilai terbaru dan `id` yang sama, kemudian menggantikan objek lama pada daftar.

## 2. Entitas Pendukung: `LaporanBencana`

`LaporanBencana` digunakan untuk menampilkan contoh laporan masyarakat pada bagian **Laporan Terbaru** dashboard. Pada prototipe saat ini datanya masih statis (`const`) dan bersifat demonstrasi. Entitas ini ditampilkan untuk mendukung F-03 dan detail read-only untuk F-05, tetapi tidak menjadi target CRUD Tugas 7.

| Field | Tipe Dart | Sumber nilai | Kebutuhan | Alasan |
|---|---|---|---|---|
| `jenis` | `String` | Data contoh statis | F-03, F-05 | Nama jenis bencana yang dilaporkan. |
| `lokasi` | `String` | Data contoh statis | F-03, F-05 | Lokasi laporan masyarakat. |
| `tanggal` | `String` | Data contoh statis | F-03, F-05 | Waktu kejadian yang ditampilkan. |
| `deskripsi` | `String` | Data contoh statis | F-05 | Informasi rinci untuk layar detail laporan. |
| `status` | `String` | Data contoh statis | F-03, F-05 | Status pemeriksaan laporan. |
| `kontak` | `String?` | Data contoh statis (opsional) | F-05 | Informasi kontak pelapor jika tersedia. |

## 3. Hubungan Model dengan Kebutuhan

| Kebutuhan | Entitas | Operasi data pada Tugas 7 |
|---|---|---|
| F-04 — Petugas mencatat kejadian dari jalur lain | `KejadianBencana` | Create dan Read |
| F-06 — Petugas memperbarui status penanganan kejadian | `KejadianBencana` | Read dan Update |
| F-03 — Petugas melihat laporan masyarakat | `LaporanBencana` | Read pada data contoh statis; belum menjadi CRUD Tugas 7 |
| F-05 — Petugas memeriksa detail laporan | `LaporanBencana` | Read pada detail read-only; proses verifikasi penuh belum diimplementasikan dalam tugas ini |

## 4. Batas Penyimpanan

Daftar `KejadianBencana` dikelola sebagai `List<KejadianBencana>` di state halaman dashboard dan dibagikan melalui kelas `PenyimpananSementara` selama aplikasi masih berjalan. 
