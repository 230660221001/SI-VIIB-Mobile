class DataPengguna {
  const DataPengguna({required this.id, required this.nama});

  final int id;
  final String nama;

  factory DataPengguna.fromJson(Map<String, dynamic> json) {
    return DataPengguna(
      id: json['id'] as int? ?? 0,
      nama: json['name'] as String? ?? 'Tanpa Nama',
    );
  }
}