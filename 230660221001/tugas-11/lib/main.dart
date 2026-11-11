import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'services/foto_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 11 Fitur Kamera',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HalamanLampiranFoto(),
    );
  }
}

class HalamanLampiranFoto extends StatefulWidget {
  const HalamanLampiranFoto({super.key});

  @override
  State<HalamanLampiranFoto> createState() => _HalamanLampiranFotoState();
}

class _HalamanLampiranFotoState extends State<HalamanLampiranFoto> {
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

      // Jika foto null, berarti pengguna membatalkan aksi (bukan error)
      if (foto == null) {
        setState(() {
          _sedangMemuat = false;
        });
        return;
      }

      setState(() {
        _foto = foto;
        _sedangMemuat = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _pesanError = 'Gagal memilih foto: $error';
        _sedangMemuat = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lampiran Bukti Transfer BSM')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // 1. Indikator Loading
            if (_sedangMemuat) const LinearProgressIndicator(),
            
            // 2. Pesan Error
            if (_pesanError != null) ...[
              const SizedBox(height: 12),
              Text(_pesanError!, style: const TextStyle(color: Colors.red)),
            ],

            // 3. Preview Gambar atau Teks Kosong
            Expanded(
              child: Center(
                child: _foto == null
                    ? const Text('Belum ada bukti transfer yang dipilih.')
                    : FutureBuilder<Widget>(
                        future: _foto!.readAsBytes().then(
                          (bytes) => Image.memory(bytes, fit: BoxFit.contain),
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

            // 4. Tombol Aksi
            Wrap(
              spacing: 12,
              alignment: WrapAlignment.center,
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