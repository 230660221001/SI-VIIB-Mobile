import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pab_tugas13/main.dart';

void main() {
  // TC-01: Menampilkan halaman dengan benar
  testWidgets('Halaman menampilkan form dan tombol', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    
    expect(find.text('Form Pesanan BSM'), findsOneWidget);
    expect(find.text('Nama Pemesan'), findsOneWidget);
    expect(find.text('Jumlah Karung Beras'), findsOneWidget);
    expect(find.text('Simpan Pesanan'), findsOneWidget);
  });

  // TC-02: Validasi input kosong
  testWidgets('Validasi gagal jika form kosong', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    
    await tester.tap(find.text('Simpan Pesanan'));
    await tester.pumpAndSettle();

    expect(find.text('Nama pemesan wajib diisi'), findsOneWidget);
    expect(find.text('Jumlah karung wajib diisi'), findsOneWidget);
  });

  // TC-03: Validasi tipe data (Jumlah bukan angka)
  testWidgets('Validasi gagal jika jumlah bukan angka', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    
    await tester.enterText(find.byType(TextFormField).at(1), 'Dua');
    await tester.tap(find.text('Simpan Pesanan'));
    await tester.pumpAndSettle();

    expect(find.text('Jumlah harus berupa angka'), findsOneWidget);
  });

  // TC-04: Sukses menyimpan pesanan (Input Valid)
  testWidgets('Sukses menyimpan jika input valid', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    
    await tester.enterText(find.byType(TextFormField).at(0), 'Budi');
    await tester.enterText(find.byType(TextFormField).at(1), '5');
    
    await tester.tap(find.text('Simpan Pesanan'));
    
    // Cek apakah state loading muncul
    await tester.pump(); 
    expect(find.text('Menyimpan...'), findsOneWidget);

    // Tunggu simulasi delay 2 detik
    await tester.pump(const Duration(seconds: 3));
    expect(find.text('Status: Pesanan Berhasil Disimpan!'), findsOneWidget);
  });
}