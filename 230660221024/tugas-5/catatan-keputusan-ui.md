# Catatan Keputusan UI/UX — Tugas 5

| Keputusan | Pilihan | Alasan (Merujuk Kebutuhan/Persona/Prinsip) |
|:--|:--|:--|
| **Warna benih** | `Colors.indigo` | Memberikan kesan formal, akademis, dan dapat dipercaya, cocok untuk aplikasi organisasi mahasiswa (Persona 1 & 2). |
| **Bentuk status** | `Chip` berwarna dengan teks | Chip mudah dipindai secara visual. Warna dibedakan (Hijau/Biru untuk Dibuka, Merah untuk Ditutup) agar anggota langsung tahu status sesi tanpa membaca detail (F-02, Prinsip Feedback). |
| **Posisi aksi utama** | `FloatingActionButton.extended` di kanan bawah | Berada dalam jangkauan jempol (thumb zone) dan berukuran besar, memenuhi standar target sentuh minimal 48x48 dp (Prinsip Target Sentuh). |
| **Hierarki teks** | Sapaan `titleLarge`, Judul Kegiatan `titleMedium`, Detail `bodySmall` | Membedakan informasi penting (nama kegiatan) dari informasi sekunder (tanggal/lokasi). Memudahkan pemindaian cepat (F-01, Prinsip Hierarki Visual). |