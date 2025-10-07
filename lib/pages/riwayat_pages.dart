import 'package:flutter/material.dart';
import '../data/history.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = HistoryData.riwayat;

    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Perhitungan')),
      body: data.isEmpty
          ? const Center(child: Text('Belum ada riwayat perhitungan.'))
          : ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: const Icon(Icons.receipt_long),
              title: Text(item['jenis']!),
              subtitle: Text('Jumlah: ${item['jumlah']}\nTanggal: ${item['tanggal']}'),
            ),
          );
        },
      ),
    );
  }
}
