# Diagram Alur Integrasi Data

```mermaid
flowchart TD
    A[Halaman Daftar Absensi] --> B[AbsensiService (Integrasi)]
    B -->|GET /users| C[Endpoint Pengguna]
    B -->|GET /posts| D[Endpoint Kegiatan]
    
    C --> E[Model DataAnggota]
    D --> F[Model DataAbsensi]
    
    E --> G[Proses Penggabungan]
    F --> G
    G -->|Identifier: userId| H[Model DataAbsensiRingkas]
    
    H --> I[Tampilan Daftar Absensi]
    