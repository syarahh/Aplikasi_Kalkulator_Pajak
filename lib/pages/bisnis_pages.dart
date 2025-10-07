import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import 'package:intl/intl.dart';

class BisnisPage extends StatefulWidget {
  const BisnisPage({super.key});

  @override
  State<BisnisPage> createState() => _BisnisPageState();
}

class _BisnisPageState extends State<BisnisPage> {
  final omzetController = TextEditingController();
  bool punyaNpwp = true;
  double? hasil;

  String formatRupiah(num value) => NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(value);

  void hitungPajak() {
    double omzet = double.tryParse(omzetController.text) ?? 0;
    double tarif = punyaNpwp ? 0.005 : 0.01;
    setState(() => hasil = omzet * tarif);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pajak Bisnis (UMKM)')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InputField(label: 'Omzet Tahunan (Rp)', controller: omzetController),
            CheckboxListTile(
              title: const Text('Memiliki NPWP'),
              value: punyaNpwp,
              onChanged: (v) => setState(() => punyaNpwp = v!),
            ),
            ElevatedButton(onPressed: hitungPajak, child: const Text('Hitung Pajak')),
            if (hasil != null)
              Text(
                'Pajak Bisnis: ${formatRupiah(hasil!)} (${punyaNpwp ? "0.5%" : "1%"})',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
              ),
          ],
        ),
      ),
    );
  }
}
