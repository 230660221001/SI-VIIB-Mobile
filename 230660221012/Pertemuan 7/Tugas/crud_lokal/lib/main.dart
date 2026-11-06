import 'package:flutter/material.dart';

void main() {
  runApp(const EbookCrudApp());
}

/// Model data buku.
class Book {
  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.description,
  });

  final int id;
  final String title;
  final String author;
  final String category;
  final String description;

  /// Membuat objek baru dengan nilai yang diperbarui.
  Book copyWith({
    int? id,
    String? title,
    String? author,
    String? category,
    String? description,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      category: category ?? this.category,
      description: description ?? this.description,
    );
  }

  @override
  String toString() {
    return 'Book(id: $id, title: $title, author: $author, '
        'category: $category, description: $description)';
  }
}

class EbookCrudApp extends StatelessWidget {
  const EbookCrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Book CRUD Lokal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const BookListScreen(),
    );
  }
}

/// Layar daftar menggunakan StatefulWidget dan List pada state.
class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key});

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  final List<Book> _books = <Book>[
    const Book(
      id: 1,
      title: 'Colorful Life',
      author: 'Kirara',
      category: 'Romance',
      description: 'Kisah tentang menemukan kembali warna kehidupan.',
    ),
    const Book(
      id: 2,
      title: 'Really Good, Actually',
      author: 'Monica Heisey',
      category: 'Fiction',
      description: 'Cerita fiksi tentang kehidupan dan hubungan.',
    ),
    const Book(
      id: 3,
      title: 'Memory',
      author: 'A. Writer',
      category: 'Mystery',
      description: 'Kisah misteri tentang ingatan dan masa lalu.',
    ),
  ];

  int _nextId = 4;

  Future<void> _openAddForm() async {
    final Book? newBook = await Navigator.push<Book>(
      context,
      MaterialPageRoute<Book>(builder: (context) => const BookFormScreen()),
    );

    if (!mounted || newBook == null) return;

    setState(() {
      _books.add(newBook.copyWith(id: _nextId));
      _nextId++;
    });

    _showMessage('Buku berhasil ditambahkan.');
  }

  Future<void> _openEditForm(Book book) async {
    final Book? updatedBook = await Navigator.push<Book>(
      context,
      MaterialPageRoute<Book>(builder: (context) => BookFormScreen(book: book)),
    );

    if (!mounted || updatedBook == null) return;

    final int index = _books.indexWhere((item) => item.id == book.id);
    if (index == -1) return;

    setState(() {
      // Ubah data dengan mengganti objek pada indeks yang sama.
      _books[index] = updatedBook.copyWith(id: book.id);
    });

    _showMessage('Data buku berhasil diperbarui.');
  }

  Future<void> _confirmDelete(Book book) async {
    final bool? shouldDelete = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Hapus buku?'),
          content: Text('Buku "${book.title}" akan dihapus dari daftar.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('Batal'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );

    if (!mounted || shouldDelete != true) return;

    setState(() {
      _books.removeWhere((item) => item.id == book.id);
    });

    _showMessage('Buku berhasil dihapus.');
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Koleksi E-Book'),
        actions: [
          IconButton(
            tooltip: 'Tambah buku',
            onPressed: _openAddForm,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: _books.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  'Belum ada buku. Tekan tombol + untuk menambahkan buku.',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _books.length,
              itemBuilder: (context, index) {
                final Book book = _books[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: Container(
                      width: 52,
                      height: 68,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.menu_book,
                        color: Colors.deepOrange,
                        size: 30,
                      ),
                    ),
                    title: Text(
                      book.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        '${book.author} · ${book.category}\n${book.description}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    isThreeLine: true,
                    trailing: PopupMenuButton<String>(
                      tooltip: 'Aksi buku',
                      onSelected: (action) {
                        if (action == 'edit') {
                          _openEditForm(book);
                        } else if (action == 'delete') {
                          _confirmDelete(book);
                        } else if (action == 'details') {
                          showDialog<void>(
                            context: context,
                            builder: (dialogContext) => AlertDialog(
                              title: Text(book.title),
                              content: Text(
                                'ID: ${book.id}\n'
                                'Penulis: ${book.author}\n'
                                'Kategori: ${book.category}\n\n'
                                '${book.description}\n\n'
                                'toString():\n${book.toString()}',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(dialogContext),
                                  child: const Text('Tutup'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      itemBuilder: (context) => const [
                        PopupMenuItem(
                          value: 'details',
                          child: ListTile(
                            leading: Icon(Icons.info_outline),
                            title: Text('Detail data'),
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                        PopupMenuItem(
                          value: 'edit',
                          child: ListTile(
                            leading: Icon(Icons.edit_outlined),
                            title: Text('Ubah'),
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                        PopupMenuItem(
                          value: 'delete',
                          child: ListTile(
                            leading: Icon(Icons.delete_outline),
                            title: Text('Hapus'),
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openAddForm,
        icon: const Icon(Icons.add),
        label: const Text('Tambah Buku'),
      ),
    );
  }
}

/// Form yang digunakan bersama untuk tambah dan ubah buku.
class BookFormScreen extends StatefulWidget {
  const BookFormScreen({super.key, this.book});

  final Book? book;

  bool get isEditing => book != null;

  @override
  State<BookFormScreen> createState() => _BookFormScreenState();
}

class _BookFormScreenState extends State<BookFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController;
  late final TextEditingController _authorController;
  late final TextEditingController _categoryController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.book?.title ?? '');
    _authorController = TextEditingController(text: widget.book?.author ?? '');
    _categoryController = TextEditingController(
      text: widget.book?.category ?? '',
    );
    _descriptionController = TextEditingController(
      text: widget.book?.description ?? '',
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _categoryController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  String? _requiredValidator(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName wajib diisi.';
    }
    return null;
  }

  void _saveBook() {
    if (!_formKey.currentState!.validate()) return;

    final Book result = Book(
      id: widget.book?.id ?? 0, // ID final ditetapkan oleh layar daftar.
      title: _titleController.text.trim(),
      author: _authorController.text.trim(),
      category: _categoryController.text.trim(),
      description: _descriptionController.text.trim(),
    );

    Navigator.pop(context, result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditing ? 'Ubah Buku' : 'Tambah Buku'),
        leading: IconButton(
          tooltip: 'Kembali',
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Judul buku',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.menu_book),
                    ),
                    validator: (value) =>
                        _requiredValidator(value, 'Judul buku'),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _authorController,
                    decoration: const InputDecoration(
                      labelText: 'Penulis',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                    validator: (value) => _requiredValidator(value, 'Penulis'),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _categoryController,
                    decoration: const InputDecoration(
                      labelText: 'Kategori',
                      hintText: 'Contoh: Adventure',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.category_outlined),
                    ),
                    validator: (value) => _requiredValidator(value, 'Kategori'),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _descriptionController,
                    minLines: 3,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      labelText: 'Deskripsi',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        _requiredValidator(value, 'Deskripsi'),
                  ),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    onPressed: _saveBook,
                    icon: const Icon(Icons.save_outlined),
                    label: Text(
                      widget.isEditing ? 'Simpan Perubahan' : 'Simpan Buku',
                    ),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Batal'),
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
