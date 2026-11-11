import 'package:image_picker/image_picker.dart';

class FotoService {
  final ImagePicker _picker = ImagePicker();

  // Mengambil foto dari galeri
  Future<XFile?> pilihDariGaleri() {
    return _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1600,
      imageQuality: 80,
    );
  }

  // Mengambil foto dari kamera
  Future<XFile?> ambilDenganKamera() {
    return _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1600,
      imageQuality: 80,
    );
  }
}