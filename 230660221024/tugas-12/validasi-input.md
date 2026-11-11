# Validasi Input — Aplikasi Absensi

| Input | Aturan client | Pemeriksaan server | Pesan error |
|:------|:--------------|:-------------------|:------------|
| **Nama Anggota** | Wajib diisi, tidak boleh kosong | Cek tipe data String, panjang max 50 | "Nama wajib diisi" |
| **NIM** | Wajib diisi, hanya angka, panjang 12 | Cek regex angka, panjang 12 | "NIM harus 12 digit angka" |
| **Nama Kegiatan** | Wajib diisi, minimal 5 karakter | Cek tipe data, panjang max 100 | "Nama kegiatan minimal 5 karakter" |
| **Email** *(jika ada)* | Wajib mengandung '@' | Cek format email valid & unik | "Format email salah" |
| **Tanggal Kegiatan**| Wajib diisi, format DD/MM/YYYY | Cek rentang tanggal (tidak di masa lalu) | "Tanggal tidak valid" |