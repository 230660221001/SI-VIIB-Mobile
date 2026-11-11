import 'package:flutter/material.dart';

class FormInteraksiPage extends StatefulWidget {
  const FormInteraksiPage({super.key});

  @override
  State<FormInteraksiPage> createState() => _FormInteraksiPageState();
}

class _FormInteraksiPageState extends State<FormInteraksiPage> {
  static const Color primary = Color(0xFF2457C5);
  static const Color ink = Color(0xFF182B49);
  static const Color muted = Color(0xFF718096);
  static const Color line = Color(0xFFE2E8F0);

  final _formKey = GlobalKey<FormState>();

  final _semesterController = TextEditingController();
  final _prodiController = TextEditingController(text: 'Sistem Informasi');
  final _tempatController = TextEditingController();
  final _alamatController = TextEditingController();
  final _whatsappController = TextEditingController();
  final _topikController = TextEditingController();
  final _mataKuliahController = TextEditingController();

  final List<_AnggotaController> _anggota = [_AnggotaController()];

  String? _jenisPengajuan;
  String _jenisPelaksanaan = 'Individu';
  DateTime? _tanggalMulai;
  DateTime? _tanggalSelesai;
  bool _untukMataKuliah = false;
  bool _sedangMengirim = false;

  bool get _isObservasi => _jenisPengajuan == 'Observasi';

  bool get _isKelompok => _isObservasi && _jenisPelaksanaan == 'Kelompok';

  @override
  void dispose() {
    _semesterController.dispose();
    _prodiController.dispose();
    _tempatController.dispose();
    _alamatController.dispose();
    _whatsappController.dispose();
    _topikController.dispose();
    _mataKuliahController.dispose();

    for (final anggota in _anggota) {
      anggota.dispose();
    }

    super.dispose();
  }

  String _formatTanggal(DateTime? tanggal) {
    if (tanggal == null) return 'Pilih tanggal';

    const bulan = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des',
    ];

    return '${tanggal.day} ${bulan[tanggal.month - 1]} ${tanggal.year}';
  }

  Future<void> _pilihTanggal({required bool mulai}) async {
    final sekarang = DateTime.now();
    final tanggalAwal = _tanggalMulai;
    final tanggalAkhir = _tanggalSelesai;

    final tanggal = await showDatePicker(
      context: context,
      initialDate: mulai
          ? (tanggalAwal ?? sekarang)
          : (tanggalAkhir ?? tanggalAwal ?? sekarang),
      firstDate: mulai
          ? DateTime(sekarang.year - 1)
          : (tanggalAwal ?? DateTime(sekarang.year - 1)),
      lastDate: DateTime(sekarang.year + 5),
      helpText: mulai
          ? 'Pilih tanggal mulai kegiatan'
          : 'Pilih tanggal selesai kegiatan',
      cancelText: 'Batal',
      confirmText: 'Pilih',
    );

    if (tanggal == null || !mounted) return;

    setState(() {
      if (mulai) {
        _tanggalMulai = tanggal;

        if (_tanggalSelesai != null && _tanggalSelesai!.isBefore(tanggal)) {
          _tanggalSelesai = null;
        }
      } else {
        _tanggalSelesai = tanggal;
      }
    });
  }

  void _tambahAnggota() {
    setState(() {
      _anggota.add(_AnggotaController());
    });
  }

  void _hapusAnggota(int index) {
    if (_anggota.length <= 1) return;

    final anggota = _anggota.removeAt(index);
    anggota.dispose();

    setState(() {});
  }

  String? _wajibDiisi(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Kolom ini wajib diisi.';
    }
    return null;
  }

  String? _validasiWhatsApp(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nomor WhatsApp wajib diisi.';
    }

    final nomor = value.replaceAll(RegExp(r'[\s\-+]'), '');

    if (!RegExp(r'^[0-9]{9,15}$').hasMatch(nomor)) {
      return 'Masukkan nomor WhatsApp yang valid.';
    }

    return null;
  }

  void _kirimPengajuan() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;

    if (_tanggalMulai == null || _tanggalSelesai == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pilih tanggal mulai dan selesai kegiatan.'),
        ),
      );
      return;
    }

    if (_tanggalSelesai!.isBefore(_tanggalMulai!)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tanggal selesai tidak boleh sebelum tanggal mulai.'),
        ),
      );
      return;
    }

    setState(() => _sedangMengirim = true);

    final daftarAnggota = _anggota
        .asMap()
        .entries
        .map((entry) {
          final index = entry.key;
          final anggota = entry.value;

          return '${index + 1}. '
              '${anggota.nama.text.trim()}'
              ' — NIM/NPM: ${anggota.nim.text.trim()}';
        })
        .join('\n');

    final ringkasan = <String>[
      'Jenis pengajuan: $_jenisPengajuan',
      if (_isObservasi) 'Pelaksanaan: $_jenisPelaksanaan',
      'Anggota:\n$daftarAnggota',
      'Tingkat/semester: ${_semesterController.text.trim()}',
      'Program studi: ${_prodiController.text.trim()}',
      'Tempat: ${_tempatController.text.trim()}',
      'Alamat: ${_alamatController.text.trim()}',
      'WhatsApp: ${_whatsappController.text.trim()}',
      'Periode: ${_formatTanggal(_tanggalMulai)}'
          ' – ${_formatTanggal(_tanggalSelesai)}',
      'Topik: ${_topikController.text.trim()}',
      if (_isObservasi && _untukMataKuliah)
        'Mata kuliah: ${_mataKuliahController.text.trim()}',
    ].join('\n\n');

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Periksa Pengajuan'),
          content: SizedBox(
            width: 480,
            child: SingleChildScrollView(
              child: SelectableText(
                ringkasan,
                style: const TextStyle(fontSize: 13, height: 1.6, color: ink),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Periksa Kembali'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                setState(() => _sedangMengirim = false);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Simulasi pengajuan selesai. '
                      'Data belum tersimpan ke server.',
                    ),
                  ),
                );
              },
              child: const Text('Selesai'),
            ),
          ],
        );
      },
    ).then((_) {
      if (mounted && _sedangMengirim) {
        setState(() => _sedangMengirim = false);
      }
    });
  }

  InputDecoration _dekorasi({
    required String label,
    String? hint,
    IconData? ikon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: ikon == null ? null : Icon(ikon, size: 20),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: const BorderSide(color: line),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: const BorderSide(color: line),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: const BorderSide(color: primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
    );
  }

  Widget _kolomTeks({
    required TextEditingController controller,
    required String label,
    String? hint,
    IconData? ikon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator ?? _wajibDiisi,
      decoration: _dekorasi(label: label, hint: hint, ikon: ikon),
    );
  }

  Widget _judulBagian(String nomor, String judul, String deskripsi) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF0FF),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Text(
              nomor,
              style: const TextStyle(
                color: primary,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: ink,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  deskripsi,
                  style: const TextStyle(
                    fontSize: 12,
                    height: 1.5,
                    color: muted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _kartuBagian({
    required String nomor,
    required String judul,
    required String deskripsi,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_judulBagian(nomor, judul, deskripsi), ...children],
      ),
    );
  }

  Widget _jarak([double tinggi = 15]) {
    return SizedBox(height: tinggi);
  }

  Widget _buildPilihanJenis() {
    return DropdownButtonFormField<String>(
      value: _jenisPengajuan,
      isExpanded: true,
      decoration: _dekorasi(
        label: 'Jenis surat',
        hint: 'Pilih jenis pengajuan',
        ikon: Icons.description_outlined,
      ),
      items: const [
        DropdownMenuItem(
          value: 'Penelitian Skripsi',
          child: Text('Penelitian Skripsi'),
        ),
        DropdownMenuItem(value: 'Observasi', child: Text('Observasi')),
      ],
      validator: (value) {
        if (value == null) return 'Pilih jenis pengajuan.';
        return null;
      },
      onChanged: (value) {
        setState(() {
          _jenisPengajuan = value;

          if (value == 'Penelitian Skripsi') {
            _jenisPelaksanaan = 'Individu';
            _untukMataKuliah = false;
            _mataKuliahController.clear();

            while (_anggota.length > 1) {
              _anggota.removeLast().dispose();
            }
          }
        });
      },
    );
  }

  Widget _buildAnggota() {
    return Column(
      children: [
        for (int i = 0; i < _anggota.length; i++) ...[
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFD),
              border: Border.all(color: line),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        _isKelompok ? 'Anggota ${i + 1}' : 'Data Mahasiswa',
                        style: const TextStyle(
                          color: ink,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    if (_isKelompok && _anggota.length > 1)
                      IconButton(
                        tooltip: 'Hapus anggota',
                        onPressed: () => _hapusAnggota(i),
                        icon: const Icon(
                          Icons.delete_outline_rounded,
                          color: Colors.redAccent,
                        ),
                      ),
                  ],
                ),
                _jarak(10),
                TextFormField(
                  controller: _anggota[i].nama,
                  decoration: _dekorasi(
                    label: 'Nama lengkap',
                    hint: 'Masukkan nama mahasiswa',
                    ikon: Icons.person_outline_rounded,
                  ),
                  validator: _wajibDiisi,
                ),
                _jarak(),
                TextFormField(
                  controller: _anggota[i].nim,
                  decoration: _dekorasi(
                    label: 'NIM/NPM',
                    hint: 'Masukkan nomor mahasiswa',
                    ikon: Icons.badge_outlined,
                  ),
                  validator: _wajibDiisi,
                ),
              ],
            ),
          ),
          _jarak(12),
        ],
        if (_isKelompok)
          Align(
            alignment: Alignment.centerLeft,
            child: OutlinedButton.icon(
              onPressed: _tambahAnggota,
              icon: const Icon(Icons.person_add_alt_1_rounded),
              label: const Text('Tambah Anggota'),
              style: OutlinedButton.styleFrom(
                foregroundColor: primary,
                side: const BorderSide(color: primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildRentangTanggal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _tombolTanggal(
                label: 'Tanggal mulai',
                tanggal: _tanggalMulai,
                onTap: () => _pilihTanggal(mulai: true),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _tombolTanggal(
                label: 'Tanggal selesai',
                tanggal: _tanggalSelesai,
                onTap: () => _pilihTanggal(mulai: false),
              ),
            ),
          ],
        ),
        if (_tanggalMulai != null && _tanggalSelesai != null) ...[
          _jarak(10),
          Text(
            _tanggalSelesai!.isBefore(_tanggalMulai!)
                ? 'Tanggal selesai harus setelah atau sama dengan tanggal mulai.'
                : 'Periode: ${_tanggalSelesai!.difference(_tanggalMulai!).inDays + 1} hari kalender',
            style: TextStyle(
              fontSize: 12,
              color: _tanggalSelesai!.isBefore(_tanggalMulai!)
                  ? Colors.redAccent
                  : muted,
            ),
          ),
        ],
      ],
    );
  }

  Widget _tombolTanggal({
    required String label,
    required DateTime? tanggal,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(13),
      child: InputDecorator(
        decoration: _dekorasi(
          label: label,
          ikon: Icons.calendar_month_outlined,
        ),
        child: Text(
          _formatTanggal(tanggal),
          style: TextStyle(
            fontSize: 13,
            color: tanggal == null ? muted : ink,
            fontWeight: tanggal == null ? FontWeight.normal : FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FC),
      appBar: AppBar(
        title: const Text(
          'Form Pengajuan Surat',
          style: TextStyle(color: ink, fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.white,
        foregroundColor: ink,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 30),
                children: [
                  Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF244FAE), Color(0xFF3476E8)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.assignment_outlined,
                          color: Colors.white,
                          size: 34,
                        ),
                        SizedBox(height: 14),
                        Text(
                          'Pengajuan Surat Akademik',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Lengkapi data dengan benar agar '
                          'pengajuan penelitian atau observasi '
                          'dapat diproses sesuai kebutuhan akademik.',
                          style: TextStyle(
                            color: Colors.white,
                            height: 1.6,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _jarak(20),
                  _kartuBagian(
                    nomor: '01',
                    judul: 'Jenis Pengajuan',
                    deskripsi:
                        'Pilih jenis kegiatan untuk menampilkan '
                        'kolom yang sesuai.',
                    children: [
                      _buildPilihanJenis(),
                      if (_isObservasi) ...[
                        _jarak(16),
                        const Text(
                          'Pelaksanaan observasi',
                          style: TextStyle(
                            color: ink,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        _jarak(8),
                        SegmentedButton<String>(
                          segments: const [
                            ButtonSegment(
                              value: 'Individu',
                              label: Text('Individu'),
                              icon: Icon(Icons.person_outline),
                            ),
                            ButtonSegment(
                              value: 'Kelompok',
                              label: Text('Kelompok'),
                              icon: Icon(Icons.groups_outlined),
                            ),
                          ],
                          selected: {_jenisPelaksanaan},
                          onSelectionChanged: (values) {
                            setState(() {
                              _jenisPelaksanaan = values.first;

                              if (_jenisPelaksanaan == 'Individu') {
                                while (_anggota.length > 1) {
                                  _anggota.removeLast().dispose();
                                }
                              }
                            });
                          },
                          style: SegmentedButton.styleFrom(
                            foregroundColor: primary,
                            selectedForegroundColor: primary,
                            selectedBackgroundColor: const Color(0xFFEAF0FF),
                          ),
                        ),
                      ],
                    ],
                  ),
                  _jarak(16),
                  _kartuBagian(
                    nomor: '02',
                    judul: 'Identitas Mahasiswa',
                    deskripsi: _isKelompok
                        ? 'Masukkan identitas seluruh anggota kelompok.'
                        : 'Isi identitas mahasiswa yang mengajukan.',
                    children: [
                      _buildAnggota(),
                      _kolomTeks(
                        controller: _semesterController,
                        label: 'Tingkat / Semester',
                        hint: 'Contoh: Semester 7',
                        ikon: Icons.school_outlined,
                      ),
                      _jarak(),
                      _kolomTeks(
                        controller: _prodiController,
                        label: 'Program Studi',
                        hint: 'Masukkan program studi',
                        ikon: Icons.account_balance_outlined,
                      ),
                      _jarak(),
                      _kolomTeks(
                        controller: _whatsappController,
                        label: 'Nomor WhatsApp',
                        hint: 'Contoh: 081XXXXXXXXX',
                        ikon: Icons.phone_android_outlined,
                        keyboardType: TextInputType.phone,
                        validator: _validasiWhatsApp,
                      ),
                    ],
                  ),
                  _jarak(16),
                  _kartuBagian(
                    nomor: '03',
                    judul: 'Informasi Kegiatan',
                    deskripsi: 'Jelaskan lokasi, periode, dan tujuan kegiatan.',
                    children: [
                      _kolomTeks(
                        controller: _tempatController,
                        label: 'Tempat Penelitian / Observasi',
                        hint: 'Nama perusahaan, sekolah, atau instansi',
                        ikon: Icons.business_outlined,
                      ),
                      _jarak(),
                      _kolomTeks(
                        controller: _alamatController,
                        label: 'Alamat Lengkap',
                        hint: 'Jalan, desa/kelurahan, kecamatan, kota',
                        ikon: Icons.location_on_outlined,
                        maxLines: 3,
                      ),
                      _jarak(),
                      const Text(
                        'Lama Penelitian / Observasi',
                        style: TextStyle(
                          color: ink,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      _jarak(9),
                      _buildRentangTanggal(),
                      _jarak(),
                      _kolomTeks(
                        controller: _topikController,
                        label: 'Topik Penelitian / Observasi',
                        hint: 'Tuliskan topik atau fokus kegiatan',
                        ikon: Icons.topic_outlined,
                        maxLines: 3,
                      ),
                      if (_isObservasi) ...[
                        _jarak(18),
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8FAFD),
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(color: line),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Tujuan observasi',
                                style: TextStyle(
                                  color: ink,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Aktifkan jika observasi dilakukan '
                                'untuk memenuhi tugas mata kuliah.',
                                style: TextStyle(
                                  color: muted,
                                  fontSize: 12,
                                  height: 1.5,
                                ),
                              ),
                              SwitchListTile(
                                contentPadding: EdgeInsets.zero,
                                title: const Text(
                                  'Untuk tugas mata kuliah',
                                  style: TextStyle(fontSize: 13),
                                ),
                                value: _untukMataKuliah,
                                activeThumbColor: primary,
                                onChanged: (value) {
                                  setState(() {
                                    _untukMataKuliah = value;
                                    if (!value) {
                                      _mataKuliahController.clear();
                                    }
                                  });
                                },
                              ),
                              if (_untukMataKuliah) ...[
                                _jarak(8),
                                _kolomTeks(
                                  controller: _mataKuliahController,
                                  label: 'Nama Mata Kuliah',
                                  hint: 'Masukkan nama mata kuliah',
                                  ikon: Icons.menu_book_outlined,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                  _jarak(20),
                  SizedBox(
                    height: 54,
                    child: FilledButton.icon(
                      onPressed: _sedangMengirim ? null : _kirimPengajuan,
                      icon: const Icon(Icons.fact_check_outlined),
                      label: Text(
                        _sedangMengirim ? 'Memproses...' : 'Periksa Pengajuan',
                      ),
                      style: FilledButton.styleFrom(
                        backgroundColor: primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  _jarak(12),
                  const Text(
                    'Periksa kembali data sebelum melanjutkan. '
                    'Pada prototipe ini, pengajuan hanya disimulasikan '
                    'dan belum dikirim ke petugas.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: muted, fontSize: 11, height: 1.6),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnggotaController {
  final TextEditingController nama = TextEditingController();
  final TextEditingController nim = TextEditingController();

  void dispose() {
    nama.dispose();
    nim.dispose();
  }
}
