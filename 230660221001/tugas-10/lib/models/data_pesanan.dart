class DataPesanan {
  const DataPesanan({
    required this.id,
    required this.userId,
    required this.jenisBeras,
    required this.status,
  });

  final int id;
  final int userId;
  final String jenisBeras;
  final String status;

  factory DataPesanan.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as int? ?? 0;
    return DataPesanan(
      id: id,
      userId: json['userId'] as int? ?? 0,
      // Kita gunakan 'title' dari API sebagai jenis beras
      jenisBeras: json['title'] as String? ?? 'Tanpa Jenis', 
      // Simulasi status proses bisnis
      status: id.isEven ? 'Diproses' : 'Menunggu',
    );
  }
}