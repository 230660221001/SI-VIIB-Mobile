# Validasi Input — Tugas 12

| Input | Aturan client | Pemeriksaan server | Pesan error |
|:------|:--------------|:-------------------|:------------|
| Nama Pemesan | Wajib diisi, maks 50 karakter | Tipe data string, tidak boleh mengandung script (XSS) | "Nama pemesan wajib diisi", "Nama maksimal 50 karakter" |
| Nomor HP | Wajib diisi, hanya angka, panjang 10-13 digit | Format regex server, keunikan jika perlu | "Nomor HP hanya boleh berisi angka" |
| Alamat | Wajib diisi, min 10 karakter | Panjang maksimal server, sanitasi karakter | "Alamat terlalu singkat, minimal 10 karakter" |
| Password | (Jika ada login) Wajib, min 8 karakter | Hashing (Bcrypt/Argon2) | "Password minimal 8 karakter" |
| File Bukti Transfer | Format .jpg/.png, maks 2MB | Validasi MIME-type, size limit | "Format file tidak didukung" |