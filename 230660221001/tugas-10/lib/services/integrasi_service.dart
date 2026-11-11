import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/data_pengguna.dart';
import '../models/data_pesanan.dart';

// Model ringkas untuk ditampilkan di UI
class DataPesananRingkas {
  const DataPesananRingkas({
    required this.id,
    required this.namaPemesan,
    required this.jenisBeras,
    required this.status,
  });

  final int id;
  final String namaPemesan;
  final String jenisBeras;
  final String status;
}

class IntegrasiService {
  static const _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const _timeout = Duration(seconds: 10);

  static Future<List<DataPengguna>> _ambilPengguna() async {
    final response = await http.get(Uri.parse('$_baseUrl/usersSALAH')).timeout(_timeout);
    if (response.statusCode != 200) throw Exception('Data pengguna gagal dimuat.');
    
    final data = jsonDecode(response.body) as List<dynamic>;
    return data.map((item) => DataPengguna.fromJson(item as Map<String, dynamic>)).toList();
  }

  static Future<List<DataPesanan>> _ambilPesanan() async {
    final response = await http.get(Uri.parse('$_baseUrl/posts?_limit=10')).timeout(_timeout);
    if (response.statusCode != 200) throw Exception('Data pesanan gagal dimuat.');
    
    final data = jsonDecode(response.body) as List<dynamic>;
    return data.map((item) => DataPesanan.fromJson(item as Map<String, dynamic>)).toList();
  }

  static Future<List<DataPesananRingkas>> ambilDataTerintegrasi() async {
    // Future.wait menjalankan kedua request secara bersamaan agar lebih cepat
    final hasil = await Future.wait<Object>([
      _ambilPengguna(),
      _ambilPesanan(),
    ]);

    final pengguna = hasil[0] as List<DataPengguna>;
    final pesanan = hasil[1] as List<DataPesanan>;

    // Buat Map untuk pencarian nama pengguna berdasarkan ID
    final penggunaById = {for (final u in pengguna) u.id: u};

    // Gabungkan data (Join berdasarkan userId)
    return pesanan.map((p) {
      final pemohon = penggunaById[p.userId];
      return DataPesananRingkas(
        id: p.id,
        namaPemesan: pemohon?.nama ?? 'Pemesan Tidak Dikenal',
        jenisBeras: p.jenisBeras,
        status: p.status,
      );
    }).toList();
  }
}