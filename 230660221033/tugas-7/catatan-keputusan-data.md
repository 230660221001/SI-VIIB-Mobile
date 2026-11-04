# Catatan Keputusan Data — CeriaReads

| Keputusan | Pilihan yang Diterapkan | Alasan (Merujuk Kebutuhan) |
|:---|:---|:---|
| **Field model** | `id`, `judulBuku`, `namaPeminjam`, `durasiHari`, `status`. | Field ini diwajibkan oleh F-02 (Form Pengajuan) dan F-03 (Melihat Status) agar data valid saat diproses oleh relawan. |
| **Kunci data (id)** | Dibuat unik menggunakan format waktu (*timestamp*). | Menjamin penghapusan (*Delete*) dan pembaruan (*Update*) mengenai objek yang tepat, tidak meleset akibat perubahan *index* *List*. |
| **Operasi CRUD per kebutuhan** | **Create:** Menyimpan form. **Read:** Daftar riwayat pinjaman. **Update:** Ubah nama/durasi. **Delete:** Batal pinjam. | Memenuhi F-01, F-02, dan F-03 secara utuh sehingga aplikasi dapat didemonstrasikan fungsinya secara nyata. |
| **Keputusan persistensi** | Saat ini data disimpan secara in-memory (memori sementara) dalam *State*. | Sesuai batas cakupan MVP awal untuk menonjolkan alur interaksi CRUD tanpa harus bergantung pada *package* eksternal tambahan. |