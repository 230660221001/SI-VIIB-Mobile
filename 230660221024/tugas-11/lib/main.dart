import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HalamanAbsensiFoto(),
    ),
  );
}

// ==========================================
// 1. SERVICE FITUR PERANGKAT
// ==========================================
class FotoService {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pilihDariGaleri() {
    return _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1600,
      imageQuality: 80,
    );
  }

  Future<XFile?> ambilDenganKamera() {
    return _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1600,
      imageQuality: 80,
    );
  }
}

// ==========================================
// 2. HALAMAN UI
// ==========================================
class HalamanAbsensiFoto extends StatefulWidget {
  const HalamanAbsensiFoto({super.key});

  @override
  State<HalamanAbsensiFoto> createState() => _HalamanAbsensiFotoState();
}

class _HalamanAbsensiFotoState extends State<HalamanAbsensiFoto> {
  final FotoService _fotoService = FotoService();

  XFile? _foto;
  bool _sedangMemuat = false;
  String? _pesanError;

  Future<void> _pilihFoto(Future<XFile?> Function() sumber) async {
    setState(() {
      _sedangMemuat = true;
      _pesanError = null;
    });
    try {
      final foto = await sumber();
      if (!mounted) return;
      setState(() {
        // Jika foto null (dibatalkan), state tidak akan berubah
        if (foto != null) {
          _foto = foto;
        }
        _sedangMemuat = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _pesanError = 'Foto tidak dapat dipilih: $error';
        _sedangMemuat = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Absensi + Bukti Foto')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            if (_sedangMemuat) const LinearProgressIndicator(),
            if (_pesanError != null) ...[
              Text(_pesanError!, style: const TextStyle(color: Colors.red)),
              const SizedBox(height: 12),
            ],
            Expanded(
              child: Center(
                child: _foto == null
                    ? const Text('Belum ada foto bukti kehadiran.')
                    : FutureBuilder<Widget>(
                        future: _foto!.readAsBytes().then(
                          (bytes) => ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.memory(
                              bytes,
                              fit: BoxFit.cover,
                              width: 300,
                            ),
                          ),
                        ),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const CircularProgressIndicator();
                          }
                          return snapshot.data!;
                        },
                      ),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              children: [
                FilledButton.icon(
                  onPressed: _sedangMemuat
                      ? null
                      : () => _pilihFoto(_fotoService.pilihDariGaleri),
                  icon: const Icon(Icons.photo_library),
                  label: const Text('Pilih dari Galeri'),
                ),
                OutlinedButton.icon(
                  onPressed: _sedangMemuat
                      ? null
                      : () => _pilihFoto(_fotoService.ambilDenganKamera),
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Ambil Kamera'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
