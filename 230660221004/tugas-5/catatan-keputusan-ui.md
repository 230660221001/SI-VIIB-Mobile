# Catatan Keputusan UI/UX — PresentGo

**Nama:** <isi nama>
**NIM:** 230660221004

| Keputusan | Pilihan Anda | Alasan |
|---|---|---|
| Warna benih | `Color(0xFF17C3B2)` (teal/mint) via `ColorScheme.fromSeed` | Warna teal memberi kontras yang jelas terhadap status oranye (terlambat) dan abu (izin), serta terasa lebih tenang dan profesional untuk konteks absensi kerja dibanding ungu bawaan Material. Dipilih ulang berdasarkan referensi visual yang lebih bersih dan modern, tetap konsisten dipakai di seluruh layar (prinsip konsistensi). |
| Ringkasan kehadiran | Kartu bergradien dengan `Stack` + `CircularProgressIndicator` menampilkan persentase kehadiran, bukan daftar kartu terpisah | Mengacu pada F-02/F-03 dan kendala persona Karyawan Lapangan yang hanya punya waktu singkat membuka aplikasi; satu kartu besar dengan angka persentase bisa dipindai sekilas tanpa membaca detail, memenuhi prinsip hierarki visual. |
| Bentuk status | `Chip` berwarna dengan ternary (hijau/oranye/abu) mengikuti kondisi Hadir/Terlambat/Izin | Mengacu pada persona Staf HRD (Tugas 4) yang perlu memantau kehadiran banyak karyawan sekaligus; warna memungkinkan status dibedakan tanpa membaca teks satu per satu (prinsip hierarki visual dan keterbacaan). |
| Posisi aksi utama | `FloatingActionButton.extended` di kanan bawah dengan label "Absen Sekarang" | Mengacu pada F-02 dan kendala persona Karyawan Lapangan yang mengurus absen di sela waktu kerja (5–10 menit); tombol besar dan selalu terlihat tanpa menggulir memenuhi prinsip target sentuh memadai. |
| Hierarki teks | Nama pengguna memakai `titleMedium` tebal, tanggal memakai `bodySmall` redup, judul "Kehadiran Bulan Ini" tebal putih di atas kartu gradien, judul "Riwayat Terbaru" memakai `titleMedium` tebal | Mengikuti prinsip hierarki visual: sapaan dan ringkasan kehadiran yang paling relevan bagi Karyawan Lapangan ditonjolkan lebih besar dan berwarna dibanding keterangan pendukung seperti tanggal. |
| Keadaan kosong | `Icon` abu-abu + teks "Belum ada riwayat bulan ini" lewat `Center` menggantikan daftar riwayat | Mencegah layar putih kosong saat data belum tersedia (mis. karyawan baru), sesuai prinsip feedback — pengguna tetap tahu aplikasi berjalan normal, bukan rusak. |
