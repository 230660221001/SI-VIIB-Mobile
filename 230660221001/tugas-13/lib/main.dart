import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing BSM',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
      home: const HalamanFormPesanan(),
    );
  }
}

class HalamanFormPesanan extends StatefulWidget {
  const HalamanFormPesanan({super.key});

  @override
  State<HalamanFormPesanan> createState() => _HalamanFormPesananState();
}

class _HalamanFormPesananState extends State<HalamanFormPesanan> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _jumlahController = TextEditingController();
  
  bool _sedangMenyimpan = false;
  String _status = 'Menunggu input...';

  @override
  void dispose() {
    _namaController.dispose();
    _jumlahController.dispose();
    super.dispose();
  }

  String? _validasiNama(String? value) {
    final nama = value?.trim() ?? '';
    if (nama.isEmpty) return 'Nama pemesan wajib diisi';
    if (nama.length > 50) return 'Nama maksimal 50 karakter';
    return null;
  }

  String? _validasiJumlah(String? value) {
    final jumlah = value?.trim() ?? '';
    if (jumlah.isEmpty) return 'Jumlah karung wajib diisi';
    final parsed = int.tryParse(jumlah);
    if (parsed == null) return 'Jumlah harus berupa angka';
    if (parsed <= 0) return 'Jumlah minimal 1 karung';
    return null;
  }

  Future<void> _simpanPesanan() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      setState(() => _status = 'Input tidak valid. Periksa kembali form.');
      return;
    }

    // Mencegah pemrosesan ganda (Fix Bug)
    if (_sedangMenyimpan) return;

    setState(() {
      _sedangMenyimpan = true;
      _status = 'Menyimpan pesanan...';
    });

    // Simulasi delay network
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    setState(() {
      _sedangMenyimpan = false;
      _status = 'Pesanan Berhasil Disimpan!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Pesanan BSM')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(labelText: 'Nama Pemesan', border: OutlineInputBorder()),
              validator: _validasiNama,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _jumlahController,
              decoration: const InputDecoration(labelText: 'Jumlah Karung Beras', border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
              validator: _validasiJumlah,
            ),
            const SizedBox(height: 24),
            FilledButton(
              // Tombol dinonaktifkan saat _sedangMenyimpan bernilai true
              onPressed: _sedangMenyimpan ? null : _simpanPesanan,
              child: Text(_sedangMenyimpan ? 'Menyimpan...' : 'Simpan Pesanan'),
            ),
            const SizedBox(height: 20),
            Text('Status: $_status', style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}