flowchart TD
    S(["Mulai: mahasiswa membuka aplikasi"]) --> A["Halaman Daftar Laporan"]
    A --> B["Ketuk tombol Buat Laporan"]
    B --> C["Halaman Form: isi judul, kategori, lokasi, deskripsi"]
    C --> D["Ambil foto kerusakan dengan kamera"]
    D --> E["Ketuk Kirim Laporan"]
    E --> F{"Semua isian wajib terisi?"}
    F -- "Tidak" --> G["Tampilkan pesan kesalahan pada isian yang kosong"]
    G --> C
    F -- "Ya" --> H{"Koneksi internet tersedia?"}
    H -- "Tidak" --> I["Simpan sebagai draf dan tampilkan pesan Disimpan sebagai draf"]
    I --> J["Saat koneksi kembali, buka Halaman Draf lalu ketuk Kirim"]
    J --> H
    H -- "Ya" --> K["Kirim laporan ke sistem pengaduan"]
    K --> L["Tampilkan konfirmasi laporan terkirim"]
    L --> M["Laporan baru tampil di daftar dengan status Menunggu"]
    M --> T(["Tujuan tercapai: laporan terkirim dan dapat dipantau"])