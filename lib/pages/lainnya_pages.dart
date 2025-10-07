import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import 'package:intl/intl.dart';
import '../data/history.dart'; //

class LainnyaPage extends StatefulWidget {
  const LainnyaPage({super.key});

  @override
  State<LainnyaPage> createState() => _LainnyaPageState();
}

class _LainnyaPageState extends State<LainnyaPage> {
  final nilaiController = TextEditingController();
  String jenis = 'PBB';
  double? hasil;

  String formatRupiah(num value) =>
      NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0)
          .format(value);

  void hitung() {
    double nilai = double.tryParse(nilaiController.text) ?? 0;
    double pajak = jenis == 'PBB' ? nilai * 0.005 : nilai * 0.11;

    setState(() => hasil = pajak);

    //
    HistoryData.tambahRiwayat(
      jenis,
      formatRupiah(pajak),
      DateFormat('dd MMM yyyy, HH:mm').format(DateTime.now()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pajak Lainnya (PBB / PPN)')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField(
              value: jenis,
              items: const [
                DropdownMenuItem(
                    value: 'PBB',
                    child: Text('Pajak Bumi dan Bangunan (0.5%)')),
                DropdownMenuItem(
                    value: 'PPN', child: Text('Pajak Pertambahan Nilai (11%)')),
              ],
              onChanged: (v) => setState(() => jenis = v!),
            ),
            InputField(
                label: 'Nilai Objek Pajak (Rp)', controller: nilaiController),
            ElevatedButton(onPressed: hitung, child: const Text('Hitung Pajak')),
            if (hasil != null)
              Text(
                'Hasil: ${formatRupiah(hasil!)} (${jenis == "PBB" ? "0.5%" : "11%"})',
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
              ),
          ],
        ),
      ),
    );
  }
}
