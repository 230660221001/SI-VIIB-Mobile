import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HalamanAbsensi(),
    ),
  );
}

// ==========================================
// 1. MODEL DATA
// ==========================================
class DataAnggota {
  const DataAnggota({required this.id, required this.nama});
  final int id;
  final String nama;

  factory DataAnggota.fromJson(Map<String, dynamic> json) {
    return DataAnggota(
      id: json['id'] as int? ?? 0,
      nama: json['name'] as String? ?? 'Tanpa Nama',
    );
  }
}

class DataAbsensi {
  const DataAbsensi({
    required this.id,
    required this.userId,
    required this.namaKegiatan,
    required this.status,
  });
  final int id;
  final int userId;
  final String namaKegiatan;
  final String status;

  factory DataAbsensi.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as int? ?? 0;
    return DataAbsensi(
      id: id,
      userId: json['userId'] as int? ?? 0,
      namaKegiatan: json['title'] as String? ?? 'Kegiatan Tanpa Nama',
      status: id.isEven ? 'Hadir' : 'Izin', // Simulasi status
    );
  }
}

class DataAbsensiRingkas {
  const DataAbsensiRingkas({
    required this.id,
    required this.namaAnggota,
    required this.namaKegiatan,
    required this.status,
  });
  final int id;
  final String namaAnggota;
  final String namaKegiatan;
  final String status;
}

// ==========================================
// 2. SERVICE LAYER (INTEGRASI)
// ==========================================
class AbsensiService {
  static const _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const _timeout = Duration(seconds: 10);

  static Future<List<DataAnggota>> _ambilAnggota() async {
    final response = await http
        .get(Uri.parse('$_baseUrl/users'))
        .timeout(_timeout);
    if (response.statusCode != 200)
      throw Exception('Gagal memuat data anggota.');
    final data = jsonDecode(response.body) as List<dynamic>;
    return data
        .map((item) => DataAnggota.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  static Future<List<DataAbsensi>> _ambilAbsensi() async {
    final response = await http
        .get(Uri.parse('$_baseUrl/posts?_limit=10'))
        .timeout(_timeout);
    if (response.statusCode != 200)
      throw Exception('Gagal memuat data absensi.');
    final data = jsonDecode(response.body) as List<dynamic>;
    return data
        .map((item) => DataAbsensi.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  static Future<List<DataAbsensiRingkas>> ambilDataTerintegrasi() async {
    // Future.wait menjalankan kedua request secara bersamaan
    final hasil = await Future.wait<Object>([_ambilAnggota(), _ambilAbsensi()]);

    final anggota = hasil[0] as List<DataAnggota>;
    final absensi = hasil[1] as List<DataAbsensi>;

    // Buat Map untuk pencarian anggota berdasarkan ID yang cepat
    final mapAnggota = {for (var a in anggota) a.id: a};

    // Gabungkan data
    return absensi.map((a) {
      final pemilik = mapAnggota[a.userId];
      return DataAbsensiRingkas(
        id: a.id,
        namaAnggota: pemilik?.nama ?? 'Anggota Tidak Ditemukan',
        namaKegiatan: a.namaKegiatan,
        status: a.status,
      );
    }).toList();
  }
}

// ==========================================
// 3. UI HALAMAN
// ==========================================
class HalamanAbsensi extends StatefulWidget {
  const HalamanAbsensi({super.key});

  @override
  State<HalamanAbsensi> createState() => _HalamanAbsensiState();
}

class _HalamanAbsensiState extends State<HalamanAbsensi> {
  bool _sedangMemuat = true;
  String? _pesanError;
  List<DataAbsensiRingkas> _daftar = [];

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
      final data = await AbsensiService.ambilDataTerintegrasi();
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
        title: const Text('Absensi Terintegrasi'),
        actions: [
          IconButton(onPressed: _muatData, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_sedangMemuat) return const Center(child: CircularProgressIndicator());

    if (_pesanError != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.cloud_off, size: 48, color: Colors.red),
            const SizedBox(height: 12),
            Text(_pesanError!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: _muatData,
              icon: const Icon(Icons.refresh),
              label: const Text('Coba Lagi'),
            ),
          ],
        ),
      );
    }

    if (_daftar.isEmpty) {
      return const Center(child: Text('Belum ada data absensi.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: _daftar.length,
      itemBuilder: (context, index) {
        final data = _daftar[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CircleAvatar(child: Text('${data.id}')),
            title: Text(
              data.namaAnggota,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(data.namaKegiatan),
            trailing: Chip(
              label: Text(
                data.status,
                style: TextStyle(
                  fontSize: 11,
                  color: data.status == 'Hadir'
                      ? Colors.green.shade800
                      : Colors.orange.shade800,
                ),
              ),
              backgroundColor: data.status == 'Hadir'
                  ? Colors.green.shade100
                  : Colors.orange.shade100,
            ),
          ),
        );
      },
    );
  }
}
