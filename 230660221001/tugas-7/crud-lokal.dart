import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistem Penjualan Beras BSM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HalamanDaftarPesanan(),
    );
  }
}

// ============================================================================
// MODEL DATA — DataPesanan
// ============================================================================
class DataPesanan {
  const DataPesanan({
    required this.id,
    required this.namaPemesan,
    required this.jenisBeras,
    required this.jumlahKg,
    required this.alamat,
    required this.status,
    this.nomorResi,
  });

  final String id;
  final String namaPemesan;
  final String jenisBeras;
  final int jumlahKg;
  final String alamat;
  final String status;
  final String? nomorResi;

  @override
  String toString() =>
      'Pesanan $jenisBeras ($jumlahKg kg) — $namaPemesan [$status]';

  /// Membuat salinan objek dengan field baru — digunakan pada Update.
  DataPesanan salinDengan({
    String? status,
    String? nomorResi,
  }) {
    return DataPesanan(
      id: id,
      namaPemesan: namaPemesan,
      jenisBeras: jenisBeras,
      jumlahKg: jumlahKg,
      alamat: alamat,
      status: status ?? this.status,
      nomorResi: nomorResi ?? this.nomorResi,
    );
  }

  /// Konversi ke Map untuk persistensi JSON.
  Map<String, dynamic> toMap() => {
        'id': id,
        'namaPemesan': namaPemesan,
        'jenisBeras': jenisBeras,
        'jumlahKg': jumlahKg,
        'alamat': alamat,
        'status': status,
        'nomorResi': nomorResi,
      };

  /// Konstruksi dari Map hasil decode JSON.
  factory DataPesanan.fromMap(Map<String, dynamic> map) {
    return DataPesanan(
      id: map['id'] as String,
      namaPemesan: map['namaPemesan'] as String,
      jenisBeras: map['jenisBeras'] as String,
      jumlahKg: map['jumlahKg'] as int,
      alamat: map['alamat'] as String,
      status: map['status'] as String,
      nomorResi: map['nomorResi'] as String?,
    );
  }
}

// ============================================================================
// LAYAR DAFTAR PESANAN — StatefulWidget (source of truth)
// ============================================================================
class HalamanDaftarPesanan extends StatefulWidget {
  const HalamanDaftarPesanan({super.key});

  @override
  State<HalamanDaftarPesanan> createState() => _HalamanDaftarPesananState();
}

class _HalamanDaftarPesananState extends State<HalamanDaftarPesanan> {
  final List<DataPesanan> _daftarPesanan = [];
  static const String _kunciPenyimpanan = 'daftar_pesanan_bsm';

  @override
  void initState() {
    super.initState();
    _muatDariPenyimpanan();
  }

  // ==========================================================================
  // PERSISTENSI — Muat data dari penyimpanan
  // ==========================================================================
  Future<void> _muatDariPenyimpanan() async {
    final prefs = await SharedPreferences.getInstance();
    final teks = prefs.getString(_kunciPenyimpanan);
    if (teks == null) return;

    final data = jsonDecode(teks) as List<dynamic>;
    setState(() {
      _daftarPesanan.clear();
      _daftarPesanan.addAll(
        data.map((item) => DataPesanan.fromMap(item as Map<String, dynamic>)),
      );
    });
  }

  // ==========================================================================
  // PERSISTENSI — Simpan data ke penyimpanan
  // ==========================================================================
  Future<void> _simpanKePenyimpanan() async {
    final prefs = await SharedPreferences.getInstance();
    final teks = jsonEncode(
      _daftarPesanan.map((p) => p.toMap()).toList(),
    );
    await prefs.setString(_kunciPenyimpanan, teks);
  }

  // ==========================================================================
  // CREATE — Tambah pesanan dari form
  // ==========================================================================
  void _tambahPesanan(DataPesanan pesanan) {
    setState(() {
      _daftarPesanan.add(pesanan);
    });
    _simpanKePenyimpanan();
  }

  // ==========================================================================
  // UPDATE — Ubah status pesanan dan/atau nomor resi
  // ==========================================================================
  void _ubahStatus(String id, String statusBaru, {String? nomorResi}) {
    setState(() {
      final index = _daftarPesanan.indexWhere((p) => p.id == id);
      if (index != -1) {
        _daftarPesanan[index] = _daftarPesanan[index].salinDengan(
          status: statusBaru,
          nomorResi: nomorResi,
        );
      }
    });
    _simpanKePenyimpanan();
  }

  // ==========================================================================
  // DELETE — Hapus pesanan dengan konfirmasi AlertDialog
  // ==========================================================================
  Future<void> _konfirmasiHapus(DataPesanan pesanan) async {
    final yakin = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Batalkan pesanan?'),
        content: Text(
          'Pesanan ${pesanan.jenisBeras} (${pesanan.jumlahKg} kg) '
          'atas nama ${pesanan.namaPemesan} akan dihapus.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (yakin == true) {
      setState(() {
        _daftarPesanan.removeWhere((p) => p.id == pesanan.id);
      });
      _simpanKePenyimpanan();
    }
  }

  // ==========================================================================
  // NAVIGASI — Buka form tambah pesanan
  // ==========================================================================
  void _bukaFormTambah() {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => FormTambahPesanan(onKirim: _tambahPesanan),
      ),
    );
  }

  // ==========================================================================
  // NAVIGASI — Buka detail pesanan
  // ==========================================================================
  void _bukaDetail(DataPesanan pesanan) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => DetailPesanan(
          pesanan: pesanan,
          onUbahStatus: (status, {nomorResi}) =>
              _ubahStatus(pesanan.id, status, nomorResi: nomorResi),
          onHapus: () => _konfirmasiHapus(pesanan),
        ),
      ),
    );
  }

  // ==========================================================================
  // READ — Tampilan daftar dari state
  // ==========================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pesanan Beras'),
        centerTitle: true,
      ),
      body: _daftarPesanan.isEmpty
          ? const KeadaanKosong()
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _daftarPesanan.length,
              itemBuilder: (context, index) {
                final pesanan = _daftarPesanan[index];
                return KartuPesanan(
                  pesanan: pesanan,
                  onTap: () => _bukaDetail(pesanan),
                  onHapus: () => _konfirmasiHapus(pesanan),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _bukaFormTambah,
        icon: const Icon(Icons.add_shopping_cart),
        label: const Text('Pesan Beras'),
      ),
    );
  }
}

// ============================================================================
// WIDGET — Kartu pesanan (satu item daftar)
// ============================================================================
class KartuPesanan extends StatelessWidget {
  const KartuPesanan({
    super.key,
    required this.pesanan,
    required this.onTap,
    required this.onHapus,
  });

  final DataPesanan pesanan;
  final VoidCallback onTap;
  final VoidCallback onHapus;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: const Icon(Icons.rice_bowl_outlined),
        title: Text(pesanan.jenisBeras, style: textTheme.titleMedium),
        subtitle: Text(
          '${pesanan.namaPemesan} • ${pesanan.jumlahKg} kg'
          '${pesanan.nomorResi != null ? '\nResi: ${pesanan.nomorResi}' : ''}',
          style: textTheme.bodySmall,
        ),
        trailing: ChipStatus(status: pesanan.status),
        onTap: onTap,
        // Aksi hapus cepat dari daftar (konfirmasi tetap muncul)
        onLongPress: onHapus,
      ),
    );
  }
}

// ============================================================================
// WIDGET — Chip status berwarna
// ============================================================================
class ChipStatus extends StatelessWidget {
  const ChipStatus({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final (Color latar, Color teks) = switch (status) {
      'menunggu' => (colorScheme.secondaryContainer, colorScheme.onSecondaryContainer),
      'diproses' => (colorScheme.tertiaryContainer, colorScheme.onTertiaryContainer),
      'dikirim' => (colorScheme.primaryContainer, colorScheme.onPrimaryContainer),
      'selesai' => (colorScheme.surfaceContainerHighest, colorScheme.onSurface),
      _ => (colorScheme.errorContainer, colorScheme.onErrorContainer),
    };
    return Chip(
      label: Text(status),
      backgroundColor: latar,
      labelStyle: TextStyle(color: teks, fontWeight: FontWeight.w600),
      visualDensity: VisualDensity.compact,
    );
  }
}

// ============================================================================
// WIDGET — Keadaan kosong
// ============================================================================
class KeadaanKosong extends StatelessWidget {
  const KeadaanKosong({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.inbox_outlined, size: 56, color: colorScheme.outline),
          const SizedBox(height: 12),
          Text('Belum ada pesanan', style: textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            'Tekan tombol "Pesan Beras" untuk membuat pesanan pertama.',
            style: textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// LAYAR — Form Tambah Pesanan (Create)
// ============================================================================
class FormTambahPesanan extends StatefulWidget {
  const FormTambahPesanan({super.key, required this.onKirim});

  final void Function(DataPesanan pesanan) onKirim;

  @override
  State<FormTambahPesanan> createState() => _FormTambahPesananState();
}

class _FormTambahPesananState extends State<FormTambahPesanan> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _jenisController = TextEditingController();
  final _jumlahController = TextEditingController();
  final _alamatController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _jenisController.dispose();
    _jumlahController.dispose();
    _alamatController.dispose();
    super.dispose();
  }

  void _kirim() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    widget.onKirim(
      DataPesanan(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        namaPemesan: _namaController.text.trim(),
        jenisBeras: _jenisController.text.trim(),
        jumlahKg: int.parse(_jumlahController.text.trim()),
        alamat: _alamatController.text.trim(),
        status: 'menunggu',
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Pesanan "${_jenisController.text.trim()}" disimpan.')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Pesanan Baru')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Pemesan',
                hintText: 'cth. Rani',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_outline),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Nama pemesan wajib diisi.';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _jenisController,
              decoration: const InputDecoration(
                labelText: 'Jenis Beras',
                hintText: 'cth. Pandan Wangi',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.rice_bowl_outlined),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Jenis beras wajib diisi.';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _jumlahController,
              decoration: const InputDecoration(
                labelText: 'Jumlah (kg)',
                hintText: 'cth. 25',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.scale_outlined),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Jumlah wajib diisi.';
                }
                final angka = int.tryParse(value.trim());
                if (angka == null || angka <= 0) {
                  return 'Jumlah harus angka positif.';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _alamatController,
              decoration: const InputDecoration(
                labelText: 'Alamat Pengiriman',
                hintText: 'cth. Jl. Raya Sumedang No. 12',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_on_outlined),
              ),
              maxLines: 3,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Alamat wajib diisi.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: _kirim,
              icon: const Icon(Icons.send_outlined),
              label: const Text('Simpan Pesanan'),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Batal'),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// LAYAR — Detail Pesanan (Update + Delete)
// ============================================================================
class DetailPesanan extends StatelessWidget {
  const DetailPesanan({
    super.key,
    required this.pesanan,
    required this.onUbahStatus,
    required this.onHapus,
  });

  final DataPesanan pesanan;
  final void Function(String status, {String? nomorResi}) onUbahStatus;
  final Future<void> Function() onHapus;

  void _ubahStatus(BuildContext context, String status) {
    onUbahStatus(status);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Status menjadi "$status".')),
    );
    Navigator.pop(context);
  }

  Future<void> _mintaHapus(BuildContext context) async {
    await onHapus();
    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Pesanan')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.rice_bowl_outlined),
              title: Text(pesanan.jenisBeras, style: textTheme.titleMedium),
              subtitle: Text('${pesanan.jumlahKg} kg'),
              trailing: ChipStatus(status: pesanan.status),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama Pemesan', style: textTheme.titleSmall),
                  const SizedBox(height: 4),
                  Text(pesanan.namaPemesan),
                  const SizedBox(height: 12),
                  Text('Alamat Pengiriman', style: textTheme.titleSmall),
                  const SizedBox(height: 4),
                  Text(pesanan.alamat),
                  const SizedBox(height: 12),
                  Text('Nomor Resi', style: textTheme.titleSmall),
                  const SizedBox(height: 4),
                  Text(pesanan.nomorResi ?? 'Belum ada'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('Ubah Status:', style: textTheme.titleSmall),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              FilledButton.tonal(
                onPressed: () => _ubahStatus(context, 'diproses'),
                child: const Text('Diproses'),
              ),
              FilledButton.tonal(
                onPressed: () => _ubahStatus(context, 'dikirim'),
                child: const Text('Dikirim'),
              ),
              FilledButton.tonal(
                onPressed: () => _ubahStatus(context, 'selesai'),
                child: const Text('Selesai'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            onPressed: () => _mintaHapus(context),
            icon: const Icon(Icons.delete_outline),
            label: const Text('Batalkan Pesanan'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
          ),
        ],
      ),
    );
  }
}