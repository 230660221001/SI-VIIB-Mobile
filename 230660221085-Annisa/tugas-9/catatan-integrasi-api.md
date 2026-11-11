# Catatan Integrasi API — Tugas 9

- **NIM:** 230660221085
- **Base URL:** `https://jsonplaceholder.typicode.com`
- **Timeout:** 5 detik per permintaan
- **Library:** `http: ^1.2.0`

## 1. Endpoint yang Digunakan

| Metode | Endpoint                | Kegunaan                                  | Status yang Diterima |
| ------ | ----------------------- | ----------------------------------------- | -------------------- |
| `GET`  | `/posts`                | Mengambil daftar pengajuan (10 data pertama) | `200`             |
| `POST` | `/posts`                | Mengirim pengajuan baru                    | `200`, `201`        |

Header yang dikirim pada `POST`:

```http
Content-Type: application/json; charset=UTF-8
```

## 2. Struktur Model

### `DataPengajuan` (respons `GET` dan `POST`)

| Field      | Tipe   | Sumber                                        |
| ---------- | ------ | --------------------------------------------- |
| `id`       | `int`  | `json['id']`                                  |
| `ruang`    | `String` | Pemetaan data ruang ke konteks laboratorium   |
| `keterangan` | `String` | Pemetaan data keterangan ke konteks domain   |
| `pemohonId` | `int` | `json['userId']`                              |
| `status`   | `String` | Ditentukan dari `id` (`Disetujui` / `Ditolak` / `Menunggu`) |

### `DataPengajuanBaru` (body `POST`)

| Field Dart      | Field JSON | Keterangan                                   |
| --------------- | ---------- | -------------------------------------------- |
| `ruang`         | `title`    | Nama ruang yang dipinjam                     |
| `keterangan`    | `body`     | Keperluan pengajuan                          |
| `pemohonId`     | `userId`   | NIM pemohon (pada demoNilainya `1`)          |

## 3. Strategi Penanganan Error

| Situasi                        | Pesan ke pengguna                                | Lokasi                 |
| ------------------------------ | ------------------------------------------------ | ---------------------- |
| Timeout (> 5 detik)            | "Waktu tunggu habis (timeout)."                   | `service-api.dart`     |
| Jaringan gagal / DNS gagal     | "Gagal memuat data. Periksa koneksi internet."    | `service-api.dart`     |
| Jaringan gagal saat POST       | "Gagal mengirim data. Periksa koneksi internet."  | `service-api.dart`     |
| Status HTTP di luar 200/201    | "Server merespons status {kode}." / "Server menolak permintaan (HTTP {kode})." | `service-api.dart` |
| Body respons tidak dapat diparse | "Format data dari server tidak dikenali."       | `service-api.dart`     |

Seluruh pesan di atas dilempar sebagai `Exception` dengan awalan `Exception: `, lalu dibersihkan di
lapisan antarmuka (`halaman-api.dart`) dengan `replaceFirst('Exception: ', '')` sebelum ditampilkan.

## 4. Alur pada Antarmuka

1. `initState` → `_muatData()` dipanggil otomatis saat halaman dibuka.
2. `_sedangMemuat = true` → tampil `CircularProgressIndicator` (screenshot loading).
3. Sukses → `_daftar` diisi, `ListView.builder` menampilkan kartu pengajuan (screenshot sukses).
4. Gagal → `_pesanError` diisi, tampil ikon `cloud_off`, pesan error, dan tombol "Coba Lagi"
   (screenshot error).
5. Form POST memvalidasi input (nama ruang dan keterangan wajib diisi), menonaktifkan tombol kirim
   selama proses berlangsung untuk mencegah pengiriman ganda, dan menampilkan `SnackBar` berhasil
   atau gagal.
