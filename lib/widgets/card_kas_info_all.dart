import 'package:flutter/material.dart';
import 'package:kas_personal/models/kas.dart';

class CardKasInfoAll extends StatelessWidget {
  const CardKasInfoAll({super.key, required this.items});
  final List<Kas> items;

  double countMasuk() {
    final list = items.where((e) => e.jenis == JenisKas.kasMasuk);
    final hasil = list.isNotEmpty
        ? list.map((e) => e.nominal).reduce((value, element) => value + element)
        : 0.0;
    return hasil;
  }

  double countKeluar() {
    final list = items.where((e) => e.jenis == JenisKas.kasKeluar);
    final hasil = list.isNotEmpty
        ? list.map((e) => e.nominal).reduce((value, element) => value + element)
        : 0.0;
    return hasil;
  }

  double countSisa() {
    return countMasuk() - countKeluar();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(
                  "Pemasukan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "IDR ${countMasuk().round()}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(
                  "Pengeluaran",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "IDR ${countKeluar().round()}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(
                  "Sisa",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "IDR ${countSisa().round()}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
