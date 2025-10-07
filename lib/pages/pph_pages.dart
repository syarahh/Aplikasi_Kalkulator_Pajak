import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import 'package:intl/intl.dart';
import '../data/history.dart'; //

class PphPage extends StatefulWidget {
  const PphPage({super.key});

  @override
  State<PphPage> createState() => _PphPageState();
}

class _PphPageState extends State<PphPage> {
  final incomeController = TextEditingController();
  double? hasil;
  double? persentase;

  String formatRupiah(num value) => NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(value);

  void hitungPph() {
    double income = double.tryParse(incomeController.text) ?? 0;
    double pajak = 0;

    if (income <= 60000000) {
      pajak = income * 0.05;
      persentase = 5;
    } else if (income <= 250000000) {
      pajak = income * 0.15;
      persentase = 15;
    } else if (income <= 500000000) {
      pajak = income * 0.25;
      persentase = 25;
    } else {
      pajak = income * 0.30;
      persentase = 30;
    }

    setState(() => hasil = pajak);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator Pajak PPh')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InputField(label: 'Pendapatan Tahunan (Rp)', controller: incomeController),
            ElevatedButton(onPressed: hitungPph, child: const Text('Hitung Pajak')),
            if (hasil != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Pajak Anda: ${formatRupiah(hasil!)} (${persentase!.toStringAsFixed(0)}%)',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
