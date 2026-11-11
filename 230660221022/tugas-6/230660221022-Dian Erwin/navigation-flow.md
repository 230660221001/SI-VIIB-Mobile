# Navigation Flow: Lab PC Monitor

**Daftar Route**
- `/` (Layar Utama / Daftar PC)
  - Kebutuhan: F-01 (Melihat daftar PC dan statusnya)
  - Initial Route: Ya, karena ini adalah titik awal utama teknisi memantau seluruh perangkat lab (Must have).
- `/detail` (Detail PC)
  - Kebutuhan: F-01 (Melihat detail spesifikasi dari PC yang dipilih)
- `/form` (Form Pelaporan)
  - Kebutuhan: F-02 (Melaporkan kendala atau kerusakan PC)

**Diagram Navigation Flow**
```mermaid
flowchart TD
    A[Layar Utama / Daftar PC<br>route: '/'] -->|Ketuk Kartu PC<br>pushNamed + argumen| B(Detail PC<br>route: '/detail')
    A -->|Ketuk FAB Lapor<br>pushNamed| C(Form Pelaporan<br>route: '/form')
    B -->|Tombol Kembali<br>pop| A
    C -->|Simpan Valid<br>pop + SnackBar| A
```
