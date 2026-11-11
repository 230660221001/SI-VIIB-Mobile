import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// ==========================================
// 1. MODEL DATA (Dipetakan dari DataPesanan BSM)
// ==========================================
class DataPesanan {
  const DataPesanan({
    required this.id,
    required this.namaPemesan,
    required this.alamat,
    required this.status,
  });

  final int id;
  final String namaPemesan;
  final String alamat;
  final String status;

  // Karena jsonplaceholder tidak punya field 'namaPemesan',
  // kita petakan: title -> namaPemesan, body -> alamat
  factory DataPesanan.fromJson(Map<String, dynamic> json) {
    return DataPesanan(
      id: json['id'] as int? ?? 0,
      namaPemesan: json['title'] as String? ?? 'Tanpa Nama',
      alamat: json['body'] as String? ?? 'Tanpa Alamat',
      status: 'menunggu', 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': namaPemesan,
      'body': alamat,
      'userId': 1, // Wajib untuk jsonplaceholder
    };
  }
}

// ==========================================
// 2. SERVICE LAYER (Pemisahan Logika Jaringan)
// ==========================================
class PesananService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const Duration _timeout = Duration(seconds: 10);

  // GET: Mengambil daftar pesanan
  static Future<List<DataPesanan>> ambilDaftarPesanan() async {
    final url = Uri.parse('$_baseUrl/posts?_limit=10');

    try {
      final response = await http.get(url).timeout(_timeout);

      if (response.statusCode == 200) {
        final List<dynamic> dataMentah = jsonDecode(response.body) as List<dynamic>;
        return dataMentah
            .map((item) => DataPesanan.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Server menolak permintaan (HTTP ${response.statusCode}).');
      }
    } on TimeoutException {
      throw Exception('Waktu tunggu habis. Periksa koneksi internet Anda.');
    } catch (e) {
      throw Exception('Gagal memuat data: $e');
    }
  }

  // POST: Mengirim pesanan baru
  static Future<DataPesanan> kirimPesanan({
    required String namaPemesan,
    required String alamat,
  }) async {
    final url = Uri.parse('$_baseUrl/posts');
    final dataBaru = DataPesanan(
      id: 0,
      namaPemesan: namaPemesan,
      alamat: alamat,
      status: 'menunggu',
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
        final Map<String, dynamic> jsonItem = jsonDecode(response.body) as Map<String, dynamic>;
        return DataPesanan.fromJson(jsonItem);
      } else {
        throw Exception('Gagal mengirim pesanan (HTTP ${response.statusCode}).');
      }
    } on TimeoutException {
      throw Exception('Waktu tunggu habis saat mengirim data.');
    } catch (e) {
      throw Exception('Gagal mengirim pesanan: $e');
    }
  }
}