# Tugas 6: Navigasi dan Interaksi

Tugas ini mengimplementasikan alur navigasi (*route* bernama), pengiriman data antarlayar, dan form validasi beserta *feedback* (SnackBar) untuk aplikasi Lab PC Monitor.

**Refleksi**
Bagian yang paling sulit dipertahankan konsistensinya adalah sinkronisasi nama *route* antara diagram Mermaid, peta `routes` di `MaterialApp`, dan pemanggilan `pushNamed`. Selain itu, memastikan *controller* di-*dispose* sering terlupa saat fokus pada visual form, sehingga membutuhkan ketelitian ekstra. Memvalidasi tipe data *arguments* dengan `is` juga memerlukan pembiasaan agar layar tujuan tidak terhenti karena error saat data null.

**Deklarasi penggunaan AI:** AI Assistant — membantu merumuskan struktur awal navigation flow, logika validasi form, dan peletakan feedback; hasilnya ditinjau kembali, disesuaikan dengan dokumen Tugas 4 dan 5, lalu dirumuskan ulang oleh penulis.
