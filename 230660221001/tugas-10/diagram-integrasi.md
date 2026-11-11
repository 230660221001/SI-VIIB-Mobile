# Diagram Alur Integrasi Data

```mermaid
flowchart LR
    A[Halaman Pesanan] --> B[IntegrasiService]
    B --> C[GET /users]
    B --> D[GET /posts]
    C --> E[DataPengguna]
    D --> F[DataPesanan]
    E --> G[Gabungkan by userId]
    F --> G
    G --> H[List DataPesananRingkas]
    H --> A