import 'package:flutter/material.dart';

void main() {
  runApp(const EbookApp());
}

/// Contoh model data buku yang dikirim melalui route arguments.
class Book {
  const Book({
    required this.title,
    required this.author,
    required this.description,
  });

  final String title;
  final String author;
  final String description;
}

class EbookApp extends StatelessWidget {
  const EbookApp({super.key});

  static const Book sampleBook = Book(
    title: 'Colorful Life',
    author: 'Kirara',
    description:
        'Sebuah cerita tentang menemukan kembali semangat, harapan, dan warna '
        'kehidupan melalui pertemuan dengan orang-orang di sekitar.',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Book - Form Interaksi',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/detail': (context) {
          // Pemeriksaan tipe arguments dan cabang null.
          final Object? arguments = ModalRoute.of(context)?.settings.arguments;

          if (arguments == null) {
            return const InvalidArgumentsScreen(
              message: 'Data buku tidak tersedia (arguments bernilai null).',
            );
          }

          if (arguments is! Book) {
            return const InvalidArgumentsScreen(
              message: 'Data yang dikirim bukan objek Book yang valid.',
            );
          }

          return DetailScreen(book: arguments);
        },
        '/form': (context) => const BookRequestFormScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('E-Book')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.menu_book, size: 76, color: Colors.orange),
                const SizedBox(height: 12),
                Text(
                  'Read your favorite Book',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.book, color: Colors.orange),
                    title: const Text('Colorful Life'),
                    subtitle: const Text('Kirara · ★★★★☆'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // Navigasi maju + pengiriman data melalui arguments.
                      Navigator.pushNamed(
                        context,
                        '/detail',
                        arguments: EbookApp.sampleBook,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                FilledButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/form'),
                  icon: const Icon(Icons.edit_note),
                  label: const Text('Buka Form Interaksi'),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Pilih buku untuk membuka detail, atau buka form untuk '
                  'menguji validasi dan SnackBar.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Buku'),
        // Tombol kembali tersedia pada layar dalam.
        leading: IconButton(
          tooltip: 'Kembali',
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 150,
                    height: 205,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.menu_book,
                      size: 82,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  book.title,
                  style: Theme.of(context).textTheme.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber),
                    const Icon(Icons.star, color: Colors.amber),
                    const Icon(Icons.star, color: Colors.amber),
                    const Icon(Icons.star, color: Colors.amber),
                    const Icon(Icons.star_border, color: Colors.amber),
                    const SizedBox(width: 12),
                    Text(book.author),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    book.description,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                ),
                const SizedBox(height: 20),
                FilledButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/form'),
                  icon: const Icon(Icons.rate_review),
                  label: const Text('Kirim Ulasan / Minat Baca'),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Kembali ke daftar buku'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BookRequestFormScreen extends StatefulWidget {
  const BookRequestFormScreen({super.key});

  @override
  State<BookRequestFormScreen> createState() => _BookRequestFormScreenState();
}

class _BookRequestFormScreenState extends State<BookRequestFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _bookController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    // Semua controller dibersihkan saat State dilepas.
    _nameController.dispose();
    _emailController.dispose();
    _bookController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    FocusScope.of(context).unfocus();

    // Jika ada field tidak valid, pesan validator tampil pada field terkait.
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Periksa kembali field yang masih belum valid.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final String name = _nameController.text.trim();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Terima kasih, $name! Form berhasil dikirim.'),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'TUTUP',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );

    _formKey.currentState!.reset();
    _nameController.clear();
    _emailController.clear();
    _bookController.clear();
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Interaksi'),
        leading: IconButton(
          tooltip: 'Kembali',
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Form Minat Baca',
                    style: Theme.of(context).textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Isi seluruh data berikut untuk mengirim minat atau '
                    'permintaan buku.',
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nama lengkap',
                      hintText: 'Masukkan nama lengkap',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Nama lengkap wajib diisi.';
                      }
                      if (value.trim().length < 3) {
                        return 'Nama minimal terdiri dari 3 karakter.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'nama@email.com',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email wajib diisi.';
                      }
                      final emailPattern = RegExp(
                        r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
                      );
                      if (!emailPattern.hasMatch(value.trim())) {
                        return 'Masukkan alamat email yang valid.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _bookController,
                    decoration: const InputDecoration(
                      labelText: 'Judul buku yang diminati',
                      hintText: 'Contoh: Colorful Life',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.menu_book_outlined),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Judul buku wajib diisi.';
                      }
                      if (value.trim().length < 2) {
                        return 'Judul buku terlalu pendek.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      labelText: 'Pesan / alasan membaca',
                      hintText: 'Tuliskan pesan singkat (minimal 10 karakter)',
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true,
                    ),
                    minLines: 3,
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Pesan wajib diisi.';
                      }
                      if (value.trim().length < 10) {
                        return 'Pesan minimal terdiri dari 10 karakter.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    onPressed: _submitForm,
                    icon: const Icon(Icons.send),
                    label: const Text('Kirim Form'),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Kembali'),
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

class InvalidArgumentsScreen extends StatelessWidget {
  const InvalidArgumentsScreen({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Tidak Tersedia'),
        leading: IconButton(
          tooltip: 'Kembali',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, '/home');
            }
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                size: 64,
                color: Colors.orange,
              ),
              const SizedBox(height: 16),
              Text(message, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/home'),
                child: const Text('Kembali ke Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
