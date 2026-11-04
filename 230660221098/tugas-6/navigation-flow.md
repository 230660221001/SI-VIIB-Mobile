## 1. Daftar Route

`initialRoute`: **`/`**

| Nama Route | Layar (IA Tugas 5)        | Kebutuhan yang Dipenuhi | Keterangan                                       |
| :--------- | :------------------------ | :---------------------- | :----------------------------------------------- |
| `/`        | Halaman Daftar Laporan    | F-02, F-05              | `initialRoute`; layar utama                      |
| `/detail`  | Halaman Detail Laporan    | F-03                    | Menerima data laporan lewat `arguments`          |
| `/form`    | Halaman Form Buat Laporan | F-01                    | Mengembalikan laporan baru lewat `Navigator.pop` |

## 2. Diagram Alur

```mermaid
flowchart TD
    A["/ Halaman Daftar Laporan<br>(initialRoute)"] -->|"pushNamed /form"| B["/form Halaman Form Buat Laporan"]
    B --> C{"Semua isian valid?"}
    C -- "Tidak" --> D["Pesan validator tampil pada field<br>tetap di /form"]
    D --> B
    C -- "Ya" --> E["pop dengan laporan baru<br>kembali ke /"]
    E --> F["Daftar menambah laporan<br>SnackBar: Laporan berhasil dikirim"]
    B -->|"pop tanpa kirim (panah AppBar)"| A
    A -->|"ketuk kartu: pushNamed /detail<br>arguments = data laporan"| G["/detail Halaman Detail Laporan"]
    G -->|"pop (tombol Kembali atau panah AppBar)"| A
```

## 3. Alasan `initialRoute`

karena memenuhi kebutuhan Must have F-02 dan F-05, yaitu melihat daftar laporan dan status terbarunya yang paling sering dibuka pengguna. Dari layar ini pengguna dapat menuju pembuatan laporan (F-01) dan detail laporan (F-03) dengan satu ketukan.
