import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

// --- MODEL DATA ---
class DataKegiatan {
  const DataKegiatan({
    required this.id,
    required this.nama,
    required this.tanggal,
    required this.status,
  });

  final int id;
  final String nama;
  final String tanggal;
  final String status;

  // Deserialisasi JSON ke Model
  factory DataKegiatan.fromJson(Map<String, dynamic> json) {
    return DataKegiatan(
      id: json['id'] as int? ?? 0,
      nama:
          json['title'] as String? ??
          'Tanpa Nama', // jsonplaceholder pakai 'title'
      tanggal: json['body'] as String? ?? '-', // jsonplaceholder pakai 'body'
      status: json['status'] as String? ?? 'Dibuka',
    );
  }

  // Serialisasi Model ke JSON
  Map<String, dynamic> toJson() {
    return {'title': nama, 'body': tanggal, 'status': status, 'userId': 1};
  }
}

// --- SERVICE API ---
class KegiatanService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const Duration _timeout = Duration(seconds: 10);

  // GET: Ambil daftar kegiatan
  static Future<List<DataKegiatan>> ambilDaftar() async {
    final url = Uri.parse('$_baseUrl/posts?_limit=10');
    try {
      final response = await http.get(url).timeout(_timeout);
      if (response.statusCode == 200) {
        final List<dynamic> dataMentah =
            jsonDecode(response.body) as List<dynamic>;
        return dataMentah
            .map((item) => DataKegiatan.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Server error (HTTP ${response.statusCode})');
      }
    } on TimeoutException {
      throw Exception('Koneksi time out. Periksa internet Anda.');
    } catch (e) {
      throw Exception('Gagal memuat data: $e');
    }
  }

  // POST: Tambah kegiatan baru
  static Future<DataKegiatan> tambahKegiatan({
    required String nama,
    required String tanggal,
  }) async {
    final url = Uri.parse('$_baseUrl/posts');
    final dataBaru = DataKegiatan(
      id: 0,
      nama: nama,
      tanggal: tanggal,
      status: 'Dibuka',
    );
    try {
      final response = await http
          .post(
            url,
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
            body: jsonEncode(dataBaru.toJson()),
          )
          .timeout(_timeout);

      if (response.statusCode == 201 || response.statusCode == 200) {
        return DataKegiatan.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        );
      } else {
        throw Exception('Gagal mengirim (HTTP ${response.statusCode})');
      }
    } on TimeoutException {
      throw Exception('Waktu pengiriman habis.');
    } catch (e) {
      throw Exception('Gagal mengirim data: $e');
    }
  }
}
