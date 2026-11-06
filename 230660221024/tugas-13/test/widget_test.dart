import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aplikasi_pab/main.dart'; // Sesuaikan 'aplikasi_pab' dengan nama package di pubspec.yaml project Anda

void main() {
  testWidgets('TC-02: Menampilkan error jika Nama kosong', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: HalamanAbsensi()));

    // Tekan tombol simpan tanpa mengisi form
    await tester.tap(find.text('Simpan Absensi'));
    await tester.pump();

    // Cek apakah teks error muncul
    expect(find.text('Nama wajib diisi'), findsOneWidget);
  });

  testWidgets('TC-05 & TC-06: Mencegah klik ganda (Bug Fix)', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: HalamanAbsensi()));

    // Isi form
    await tester.enterText(find.byType(TextFormField).at(0), 'Ridho');
    await tester.enterText(find.byType(TextFormField).at(1), '230660221024');
    await tester.enterText(find.byType(TextFormField).at(2), 'Rapat Kerja');

    // Klik simpan sekali
    await tester.tap(find.text('Simpan Absensi'));
    await tester.pump(); // Memicu state loading

    // Pastikan tombol berubah teks menjadi 'Menyimpan...'
    expect(find.text('Menyimpan...'), findsOneWidget);

    // Coba klik lagi saat loading (harusnya tidak bisa)
    await tester.tap(find.text('Menyimpan...'));
    await tester.pump();

    // Tunggu proses async selesai (1 detik)
    await tester.pump(const Duration(seconds: 1));

    // Cek apakah status berhasil muncul hanya SATU KALI
    expect(find.textContaining('berhasil disimpan'), findsOneWidget);
  });
}
