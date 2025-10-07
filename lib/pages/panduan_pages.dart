import 'package:flutter/material.dart';

class PanduanPage extends StatelessWidget {
  const PanduanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final panduan = [
      'Tarif PPh Orang Pribadi 2025: 5%–30%',
      'Pajak UMKM: 0.5% dari omzet tahunan (punya NPWP)',
      'PPN saat ini 11% (rencana naik ke 12% di 2025)',
      'PBB dikenakan 0.5% dari NJOP (Nilai Jual Objek Pajak)',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Panduan & Tips Pajak')),
      body: ListView.builder(
        itemCount: panduan.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: const Icon(Icons.lightbulb, color: Colors.orange),
              title: Text(panduan[index]),
            ),
          );
        },
      ),
    );
  }
}
