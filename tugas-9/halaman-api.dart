import 'package:flutter/material.dart';
import 'service_api.dart'; // Pastikan file service_api.dart ada di folder lib

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HalamanApi(),
  ));
}

class HalamanApi extends StatefulWidget {
  const HalamanApi({super.key});
  @override
  State<HalamanApi> createState() => _HalamanApiState();
}

class _HalamanApiState extends State<HalamanApi> {
  bool _sedangMemuat = false;
  String? _pesanError;
  List<DataPengajuan> _daftar = [];
  final _formKey = GlobalKey<FormState>();
  final _ruangController = TextEditingController();
  final _keteranganController = TextEditingController();
  bool _sedangMengirim = false;

  @override
  void initState() {
    super.initState();
    _muatData();
  }

  Future<void> _muatData() async {
    setState(() { _sedangMemuat = true; _pesanError = null; });
    try {
      final hasil = await LaboratoriumService.ambilDaftar();
      if (!mounted) return;
      setState(() { _daftar = hasil; _sedangMemuat = false; });
    } catch (e) {
      if (!mounted) return;
      setState(() { _pesanError = e.toString().replaceFirst('Exception: ', ''); _sedangMemuat = false; });
    }
  }

  Future<void> _kirimPengajuan() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _sedangMengirim = true);
    try {
      await LaboratoriumService.kirimPengajuan(DataPengajuanBaru(
        ruang: _ruangController.text.trim(),
        keterangan: _keteranganController.text.trim(),
        pemohonId: 1,
      ));
      if (!mounted) return;
      _ruangController.clear(); _keteranganController.clear();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pengajuan berhasil dikirim.')));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gagal: $e'), backgroundColor: Colors.red));
    } finally {
      if (mounted) setState(() => _sedangMengirim = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengajuan Laboratorium')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _ruangController,
                    decoration: const InputDecoration(labelText: 'Nama Ruang', border: OutlineInputBorder()),
                    validator: (v) => (v == null || v.trim().isEmpty) ? 'Wajib diisi' : null,
                    enabled: !_sedangMengirim,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _keteranganController,
                    decoration: const InputDecoration(labelText: 'Keterangan', border: OutlineInputBorder()),
                    validator: (v) => (v == null || v.trim().isEmpty) ? 'Wajib diisi' : null,
                    enabled: !_sedangMengirim,
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: _sedangMengirim ? null : _kirimPengajuan,
                      icon: _sedangMengirim ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.send),
                      label: Text(_sedangMengirim ? 'Mengirim...' : 'Kirim Pengajuan'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 1),
          Expanded(child: _bangunKonten()),
        ],
      ),
    );
  }

  Widget _bangunKonten() {
    if (_sedangMemuat) return const Center(child: CircularProgressIndicator());
    if (_pesanError != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.cloud_off, size: 48, color: Colors.red),
            const SizedBox(height: 12),
            Text('Gagal: $_pesanError', textAlign: TextAlign.center, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 16),
            FilledButton.icon(onPressed: _muatData, icon: const Icon(Icons.refresh), label: const Text('Coba Lagi')),
          ],
        ),
      );
    }
    if (_daftar.isEmpty) return const Center(child: Text('Belum ada data pengajuan.'));
    
    return ListView.builder(
      itemCount: _daftar.length,
      itemBuilder: (context, index) {
        final item = _daftar[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ListTile(
            leading: CircleAvatar(child: Text('${item.id}')),
            title: Text(item.ruang),
            subtitle: Text(item.keterangan),
            trailing: Chip(label: Text(item.status)),
          ),
        );
      },
    );
  }
}