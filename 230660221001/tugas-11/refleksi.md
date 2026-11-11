# Refleksi Tugas 11

Tantangan terbesar pada fitur perangkat ini adalah menangani perbedaan perilaku antara target web (Chrome) dan target perangkat fisik. Di web, pemilihan gambar tidak memerlukan permission eksplisit dan langsung membuka file browser, sehingga saya menggunakan `readAsBytes()` dan `Image.memory` agar preview bisa tampil. Hal terpenting yang saya pelajari adalah membedakan antara pengguna yang **membatalkan** aksi (`XFile` bernilai `null`) dan **error** sistem; membatalkan aksi bukanlah error, sehingga aplikasi tidak boleh menampilkan pesan merah yang menakutkan. Pemisahan logika ke dalam `FotoService` juga membuat kode UI jauh lebih bersih.

---
Deklarasi penggunaan AI: Claude — membantu menyusun penanganan state batal dan preview gambar berbasis bytes; kode, pengujian, dan penjelasan diverifikasi oleh penulis.