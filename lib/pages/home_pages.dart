import 'package:flutter/material.dart';
import '../widgets/tax_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator Pajak Indonesia')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: [
          TaxCard(title: 'PPh', icon: Icons.person, routeName: '/pph'),
          TaxCard(title: 'Pajak Bisnis', icon: Icons.store, routeName: '/bisnis'),
          TaxCard(title: 'Pajak Lainnya', icon: Icons.receipt_long, routeName: '/lainnya'),
          TaxCard(title: 'Riwayat', icon: Icons.history, routeName: '/riwayat'),
          TaxCard(title: 'Panduan', icon: Icons.menu_book, routeName: '/panduan'),
        ],
      ),
    );
  }
}
