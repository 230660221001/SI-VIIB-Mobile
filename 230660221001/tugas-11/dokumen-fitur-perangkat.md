# Dokumen Fitur Perangkat — Tugas 11

## 1. Analisis Fitur
- **Fitur yang dipilih:** Kamera dan Galeri (`image_picker`).
- **Aktor:** Konsumen.
- **Tujuan pada proses bisnis:** Konsumen dapat mengunggah foto bukti transfer pembayaran beras dari galeri ponsel atau mengambil foto langsung, menggantikan proses manual mengirim foto via WhatsApp.
- **Data keluaran:** Objek `XFile` (berisi path/bytes gambar).
- **Permission:** 
  - Android: `READ_EXTERNAL_STORAGE`, `CAMERA` (pada `AndroidManifest.xml`).
  - iOS: `NSPhotoLibraryUsageDescription`, `NSCameraUsageDescription` (pada `Info.plist`).
- **Konsekuensi:** Jika permission ditolak, pengguna tidak dapat mengunggah foto. Jika dibatalkan, state sebelumnya tetap dipertahankan tanpa pesan error.

## 2. State Lifecycle
1. **Loading:** Indikator `LinearProgressIndicator` muncul saat menunggu file picker.
2. **Berhasil:** Preview gambar ditampilkan menggunakan `Image.memory` (karena kompatibel di web).
3. **Dibatalkan:** Jika `XFile` bernilai `null`, state loading berhenti dan gambar lama tetap ada (tidak memicu error).
4. **Error:** Jika package crash atau permission ditolak, pesan error ditampilkan pada layar.