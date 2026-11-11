import 'package:flutter/material.dart';
import 'services/integrasi_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Integrasi Proses BSM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
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
  bool _sedangMemuat = true;
  String? _pesanError;
  List<DataPesananRingkas> _daftar = [];

  @override
  void initState() {
    super.initState();
    _muatData();
  }

  Future<void> _muatData() async {
    setState(() {
      _sedangMemuat = true;
      _pesanError = null;
    });

    try {
      final data = await IntegrasiService.ambilDataTerintegrasi();
      if (!mounted) return;
      setState(() {
        _daftar = data;
        _sedangMemuat = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _pesanError = e.toString().replaceFirst('Exception: ', '');
        _sedangMemuat = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesanan Beras BSM (Integrasi)'),
        actions: [
          IconButton(
            onPressed: _muatData,
            icon: const Icon(Icons.refresh),
            tooltip: 'Muat ulang',
          ),
        ],
      ),
      body: _bangunKonten(),
    );
  }

  Widget _bangunKonten() {
    // 1. Kondisi Loading
    if (_sedangMemuat) {
      return const Center(child: CircularProgressIndicator());
    }

    // 2. Kondisi Error
    if (_pesanError != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cloud_off, size: 48, color: Colors.redAccent),
              const SizedBox(height: 12),
              Text(_pesanError!, textAlign: TextAlign.center, style: const TextStyle(color: Colors.red)),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: _muatData,
                icon: const Icon(Icons.refresh),
                label: const Text('Coba Lagi'),
              ),
            ],
          ),
        ),
      );
    }

    // 3. Kondisi Kosong
    if (_daftar.isEmpty) {
      return const Center(child: Text('Belum ada data pesanan terintegrasi.'));
    }

    // 4. Kondisi Sukses
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _daftar.length,
      itemBuilder: (context, index) {
        final data = _daftar[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CircleAvatar(child: Text('${data.id}')),
            title: Text(data.namaPemesan),
            subtitle: Text(data.jenisBeras),
            trailing: Chip(
              label: Text(data.status),
              backgroundColor: data.status == 'Diproses' ? Colors.green.shade100 : Colors.orange.shade100,
            ),
          ),
        );
      },
    );
  }
}