# Catatan Keputusan Navigasi — PresentGo

**Nama:** <isi nama>
**NIM:** 230660221004

| Keputusan | Pilihan Anda | Alasan |
|---|---|---|
| Nama route | `/`, `/pengajuan-izin`, `/detail-absensi` — didaftarkan terpusat pada `MaterialApp.routes` | Satu sumber kebenaran untuk seluruh layar sehingga nama route di kode selalu sama dengan navigation-flow.md, menghindari kesalahan penulisan nama route yang case-sensitive. |
| Data antarlayar | Objek `AttendanceRecord` dikirim lewat `arguments` saat kartu riwayat diketuk, dibaca di Detail dengan pemeriksaan `is` dan cabang null | Mengacu pada F-04: pengguna perlu melihat detail riwayat yang sama persis dengan yang tampil di Beranda tanpa harus mengambil ulang data; layar Detail dibuat read-only karena persetujuan/perubahan status bukan wewenang Karyawan Lapangan. |
| Validator tiap field | Jenis izin dan Tanggal wajib diisi (tidak boleh kosong/spasi); Alasan wajib diisi dan minimal 5 karakter | Mengacu pada F-05 dan temuan Tugas 4 bahwa pengajuan izin yang tidak lengkap menyulitkan Staf HRD memverifikasi; validasi mencegah data kosong atau alasan yang tidak informatif terkirim. |
| Feedback tiap aksi | `SnackBar` "Pengajuan izin ... berhasil dikirim (simulasi)" setelah kirim valid; `SnackBar` "Absensi ... dicatat (simulasi)" setelah tombol absen ditekan; pesan validator merah di bawah field saat form belum valid | Mengikuti prinsip feedback: pengguna lapangan yang terburu-buru perlu kepastian bahwa aksinya tercatat tanpa harus menebak, dan tahu field mana yang perlu diperbaiki sebelum mengirim ulang. |
| Tombol kembali | `FilledButton`/`OutlinedButton` "Kembali" dipasang pada Detail Riwayat Absensi dan Form Pengajuan Izin (keduanya hasil push); Beranda tidak memiliki tombol kembali | Mencegah `Navigator.pop` pada Beranda (initialRoute) yang akan menutup aplikasi; tombol kembali hanya relevan pada layar yang memang dibuka melalui push. |
