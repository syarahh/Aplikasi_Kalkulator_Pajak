import 'package:flutter/material.dart';
import 'pages/home_pages.dart';
import 'pages/pph_pages.dart';
import 'pages/bisnis_pages.dart';
import 'pages/lainnya_pages.dart';
import 'pages/riwayat_pages.dart';
import 'pages/panduan_pages.dart';

void main() {
  runApp(const PajakApp());
}

class PajakApp extends StatelessWidget {
  const PajakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator Pajak Indonesia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/pph': (_) => const PphPage(),
        '/bisnis': (_) => const BisnisPage(),
        '/lainnya': (_) => const LainnyaPage(),
        '/riwayat': (_) => const RiwayatPage(),
        '/panduan': (_) => const PanduanPage(),
      },
    );
  }
}
