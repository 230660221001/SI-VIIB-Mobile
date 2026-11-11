# Catatan Keputusan Navigasi — CeriaReads

| Keputusan | Pilihan yang Diterapkan | Alasan (Merujuk IA / Kebutuhan) |
|:---|:---|:---|
| **Nama route** | Menggunakan pola *path* standar: `/`, `/detail`, dan `/form`. | Memberikan hierarki url yang logis dan konsisten dengan *Information Architecture* (IA) di mana form peminjaman adalah turunan dari detail buku. |
| **Data antarlayar** | Mengirim objek data `buku` (`Map<String, dynamic>`) melalui *arguments*. | Halaman detail bersifat *read-only* untuk memenuhi F-03, sehingga cukup mengambil data dari kartu yang ditekan tanpa harus memanggil ulang data dari awal. |
| **Validator tiap field** | Field 'Nama' wajib diisi (tidak boleh kosong/spasi). Field 'Durasi' wajib diisi berupa angka bulat (1-7 hari). | Menjamin integritas data sebelum masuk ke sistem relawan (F-02), mencegah masuknya form kosong yang sering terjadi akibat ketidaksengajaan saat terburu-buru. |
| **Feedback tiap aksi** | Teks pesan *error* merah di bawah form jika tidak valid; `SnackBar` konfirmasi sukses berwarna hijau di bawah layar. | Menegaskan keberhasilan pengajuan kepada anggota (Persona Andi) agar ia yakin datanya terkirim dan tidak perlu menekan tombol berulang kali. |