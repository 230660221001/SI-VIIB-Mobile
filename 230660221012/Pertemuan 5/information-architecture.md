# Information Architecture (IA): Aplikasi E-Book

## 1. Inventaris Layar (Screen Inventory)

Berdasarkan rancangan antarmuka awal, berikut adalah inventaris layar yang ada dan yang dikembangkan untuk mendukung fungsionalitas aplikasi e-book:

- **Layar Utama (Home / Explore Screen):** Layar pusat yang memuat salam personalisasi (_"Read your favorite Book"_), tombol profil pengguna, bilah pencarian (_Search books_), filter kategori (_All books_, _Adventure_, _Action_, _Romance_), serta kurasi daftar buku seperti **Top books** dan **Others**.
- **Layar Detail Buku (Book Detail Screen):** Layar yang menampilkan informasi komprehensif mengenai suatu buku (contoh: _Colorful Life_), meliputi sampul buku, rating bintang, nama penulis (_Writer_), serta ringkasan/sinopsis isi cerita.
- **Layar Profil (Profile Screen):** Layar pendukung yang diakses melalui ikon profil di pojok kanan atas layar utama untuk mengelola akun pengguna.
- **Layar Pencarian (Search Screen):** Layar pendukung yang menampilkan hasil pencarian atau filter buku berdasarkan kata kunci.
- **Layar Perpustakaan / Rak Buku (Library / Shelf Screen):** Layar pendukung yang diakses melalui ikon kotak di navigasi bawah untuk melihat buku yang disimpan atau sedang dibaca[cite: 1].
- **Layar Komunitas / Pesan (Community / Chat Screen):** Layar pendukung yang diakses melalui ikon obrolan di navigasi bawah untuk berdiskusi dengan sesama pembaca[cite: 1].

---

## 2. Diagram Arsitektur Informasi (Mermaid Diagram)

```mermaid
graph TD
    A[Layar Utama / Home Screen] --> B[Layar Profil]
    A --> C[Layar Pencarian]
    A --> D[Layar Detail Buku]
    D --> E[Layar Membaca / Reader Screen]

    %% Navigasi Bawah (Bottom Navigation)
    A -.-> F[Layar Perpustakaan / Library]
    A -.-> G[Layar Komunitas / Chat]


## 3. Penjelasan Pemilihan Layar Utama
Layar Utama (Home Screen) dipilih sebagai pusat navigasi utama aplikasi e-book ini karena beberapa alasan strategis:
* Pusat Penemuan Konten (Content Discovery): Begitu membuka aplikasi, pengguna langsung diperlihatkan berbagai rekomendasi buku (Top books) dan kategori genre (Adventure, Action, dll.) untuk meminimalkan friction atau kebingungan pengguna dalam mencari bacaan[cite: 1].

* Akses Cepat ke Fitur Utama: Bilah pencarian (Search books) diletakkan secara menonjol di bagian atas agar pengguna yang memiliki intensi spesifik bisa langsung mencari buku impian mereka dengan cepat[cite: 1].

* Konsistensi Navigasi: Penggunaan bottom navigation bar (ikon Rumah, Kotak/Rak, dan Pesan) memberikan kemudahan akses secara global bagi pengguna untuk berpindah antar menu utama dari mana saja di dalam aplikasi[cite: 1].
```
