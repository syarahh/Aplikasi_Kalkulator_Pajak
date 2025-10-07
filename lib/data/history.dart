// lib/data/history.dart
class HistoryData {
  // list statis yang menampung map entry
  static final List<Map<String, dynamic>> riwayat = [];

  // tambah riwayat — jumlah bisa number atau string
  static void tambahRiwayat(String jenis, dynamic jumlah, String detail) {
    riwayat.add({
      'jenis': jenis,
      'jumlah': jumlah,
      'detail': detail,
      'tanggal': DateTime.now().toIso8601String(),
    });
  }

  static List<Map<String, dynamic>> getAll() => List.from(riwayat);

  static void removeAt(int index) {
    if (index >= 0 && index < riwayat.length) riwayat.removeAt(index);
  }

  static void clearAll() => riwayat.clear();
}
