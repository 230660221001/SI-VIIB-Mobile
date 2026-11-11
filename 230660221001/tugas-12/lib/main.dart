import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Validasi & Keamanan BSM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
      home: const HalamanPesanan(),
    );
  }
}

class HalamanPesanan extends StatefulWidget {
  const HalamanPesanan({super.key});

  @override
  State<HalamanPesanan> createState() => _HalamanPesananState();
}

class _HalamanPesananState extends State<HalamanPesanan> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _noHpController = TextEditingController();
  final _alamatController = TextEditingController();

  final _secureStorage = const FlutterSecureStorage();
  String _pesanStatus = 'Silakan isi form pemesanan.';
  bool _sedangMemuat = false;

  @override
  void dispose() {
    _namaController.dispose();
    _noHpController.dispose();
    _alamatController.dispose();
    super.dispose();
  }

  // --- VALIDATOR 1: Nama Pemesan ---
  String? _validasiNama(String? value) {
    final nama = value?.trim() ?? '';
    if (nama.isEmpty) return 'Nama pemesan wajib diisi';
    if (nama.length > 50) return 'Nama maksimal 50 karakter';
    return null;
  }

  // --- VALIDATOR 2: Nomor HP ---
  String? _validasiNoHp(String? value) {
    final noHp = value?.trim() ?? '';
    if (noHp.isEmpty) return 'Nomor HP wajib diisi';
    if (!RegExp(r'^[0-9]+$').hasMatch(noHp)) return 'Nomor HP hanya boleh berisi angka';
    if (noHp.length < 10 || noHp.length > 13) return 'Panjang nomor HP harus 10-13 digit';
    return null;
  }

  // --- VALIDATOR 3: Alamat Pengiriman ---
  String? _validasiAlamat(String? value) {
    final alamat = value?.trim() ?? '';
    if (alamat.isEmpty) return 'Alamat wajib diisi';
    if (alamat.length < 10) return 'Alamat terlalu singkat, minimal 10 karakter';
    return null;
  }

  // --- PROSES SIMULASI KEAMANAN ---
  Future<void> _kirimPesanan() async {
    // Menjalankan semua validator
    if (!(_formKey.currentState?.validate() ?? false)) {
      setState(() {
        _pesanStatus = 'Input belum valid. Periksa kembali form Anda.';
      });
      return;
    }

    setState(() {
      _sedangMemuat = true;
      _pesanStatus = 'Memproses pesanan...';
    });

    try {
      // SIMULASI: Menyimpan token dengan aman (flutter_secure_storage)
      // Di aplikasi nyata, token didapat dari proses login API
      await _secureStorage.write(key: 'auth_token', value: 'simulasi_token_rahasia_bsm');
      
      // Simulasi delay jaringan HTTPS (karena API asli mungkin belum siap)
      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) return;
      setState(() {
        _pesanStatus = 'Pesanan Berhasil! Data valid dan dikirim via HTTPS.';
      });
    } catch (e) {
      // Menangani error tanpa membocorkan detail sistem
      if (!mounted) return;
      setState(() {
        _pesanStatus = 'Terjadi kesalahan sistem. Silakan coba lagi nanti.';
      });
    } finally {
      if (mounted) {
        setState(() {
          _sedangMemuat = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Pesanan BSM (Aman)')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const Text(
              'Formulir Pemesanan Beras',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Pemesan',
                border: OutlineInputBorder(),
              ),
              validator: _validasiNama,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _noHpController,
              decoration: const InputDecoration(
                labelText: 'Nomor HP (10-13 digit)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
              validator: _validasiNoHp,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _alamatController,
              decoration: const InputDecoration(
                labelText: 'Alamat Pengiriman Lengkap',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              validator: _validasiAlamat,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _sedangMemuat ? null : _kirimPesanan,
              child: _sedangMemuat 
                  ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                  : const Text('Kirim Pesanan'),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Status Sistem:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(_pesanStatus),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}