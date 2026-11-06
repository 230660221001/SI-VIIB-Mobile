# Catatan Keputusan Data & CRUD

| Keputusan | Pilihan Anda | Alasan (Merujuk Kebutuhan) |
|---|---|---|
| **Field Model** | `id`, `kodePC`, `kendala`, `tanggal`, `status` | Seluruh *field* merepresentasikan informasi yang dibutuhkan untuk F-01 (Melihat daftar), F-02 (Melapor), F-03 (Riwayat status), dan F-06 (Update status). |
| **Kunci Data (id)** | Waktu pembuatan (*millisecondsEpoch*) berupa `String` | Mengganti pencarian dengan *index* menjadi berbasis ID unik agar operasi Update (F-06) dan Delete selalu tepat sasaran meski urutan daftar berubah. |
| **Operasi CRUD per Kebutuhan** | Create (F-02), Read (F-01, F-03), Update (F-06), Delete (Opsional untuk kesalahan) | Memberikan kebebasan mutlak pada aplikasi untuk mencatat, melacak riwayat, dan memanipulasi informasi perangkat dari sisi *client/mobile* untuk mencapai status MVP. |
| **Keputusan Persistensi** | *In-memory List* (tanpa package) | Untuk memenuhi kriteria agar kode tetap bisa diuji coba di DartPad dengan lancar (tanpa `shared_preferences`) sesuai kebutuhan Tugas 7 Jalur 1, sambil tetap mempertahankan logika struktural state aplikasi. |
