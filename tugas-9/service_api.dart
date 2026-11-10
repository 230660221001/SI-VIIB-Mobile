import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataPengajuan {
  const DataPengajuan({
    required this.id, required this.ruang, required this.keterangan,
    required this.pemohonId, required this.status,
  });
  final int id;
  final String ruang;
  final String keterangan;
  final int pemohonId;
  final String status;

  factory DataPengajuan.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as int? ?? 0;
    
    // =========================================================
    // TRIK: Mengubah data dummy bahasa Latin menjadi Bahasa Indonesia
    // =========================================================
    final listRuang = [
      'Laboratorium Komputer 1', 'Laboratorium Jaringan', 'Laboratorium Multimedia',
      'Laboratorium RPL', 'Laboratorium AI & Data Science', 'Ruang Kuliah 301',
      'Ruang Rapat Dosen', 'Aula Utama', 'Laboratorium Basis Data', 'Laboratorium Mobile'
    ];
    final listKeterangan = [
      'Praktikum Pemrograman Mobile', 'Rapat organisasi BEM', 'Kegiatan belajar kelompok',
      'Seminar teknologi AI', 'Pelatihan keamanan siber', 'Praktikum Jaringan Komputer',
      'Ujian Tengah Semester', 'Pengerjaan tugas akhir', 'Workshop desain UI/UX', 'Kegiatan ekstrakurikuler'
    ];

    // Mengambil data berdasarkan ID (dikurangi 1 agar pas indexnya)
    final index = (id - 1) % listRuang.length;

    return DataPengajuan(
      id: id,
      ruang: listRuang[index],
      keterangan: listKeterangan[index],
      pemohonId: json['userId'] as int? ?? 0,
      // Bikin variasi status biar UI-nya keren
      status: (id % 3 == 0) ? 'Disetujui' : ((id % 2 == 0) ? 'Ditolak' : 'Menunggu'),
    );
  }
}

class DataPengajuanBaru {
  const DataPengajuanBaru({required this.ruang, required this.keterangan, required this.pemohonId});
  final String ruang;
  final String keterangan;
  final int pemohonId;

  Map<String, dynamic> toJson() => {'title': ruang, 'body': keterangan, 'userId': pemohonId};
}

class LaboratoriumService {
  // URL untuk screenshot error nanti
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const Duration _timeout = Duration(seconds: 5);

  static Future<List<DataPengajuan>> ambilDaftar() async {
    final url = Uri.parse('$_baseUrl/posts');
    try {
      final response = await http.get(url).timeout(_timeout);
      if (response.statusCode != 200) throw Exception('Server status ${response.statusCode}');
      final List<dynamic> dataMentah = jsonDecode(response.body) as List<dynamic>;
      return dataMentah.take(10).map((item) => DataPengajuan.fromJson(item as Map<String, dynamic>)).toList();
    } on TimeoutException {
      throw Exception('Waktu tunggu habis (timeout).');
    } catch (e) {
      throw Exception('Gagal memuat data. Periksa koneksi internet.');
    }
  }

  static Future<DataPengajuan> kirimPengajuan(DataPengajuanBaru dataBaru) async {
    final url = Uri.parse('$_baseUrl/posts');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(dataBaru.toJson()),
      ).timeout(_timeout);
      if (response.statusCode != 201 && response.statusCode != 200) throw Exception('Gagal (HTTP ${response.statusCode})');
      return DataPengajuan.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } on TimeoutException {
      throw Exception('Waktu tunggu habis (timeout).');
    } catch (e) {
      throw Exception('Gagal mengirim data. Periksa koneksi internet.');
    }
  }
}