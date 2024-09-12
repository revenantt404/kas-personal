import 'package:flutter/material.dart';
import 'package:kas_personal/models/kas.dart';

class CardKasInfo extends StatelessWidget {
  const CardKasInfo({super.key, required this.items, required this.jenis});

  final List<Kas> items;
  final JenisKas jenis;

  double countTotal() {
    if (jenis == JenisKas.kasMasuk) {
      var masukList = items.where((e) => e.jenis == JenisKas.kasMasuk);
      var masuk = masukList.isNotEmpty
          ? masukList
              .map((e) => e.nominal)
              .reduce((value, element) => value + element)
          : 0.0;
      return masuk;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                    )
                  ],
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Text(
                    "Total Transaksi",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    items.length.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )
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
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                )
              ],
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Builder(
                  builder: (context) {
                    var text = '';
                    if (jenis == JenisKas.kasMasuk) {
                      text = 'Total Pemasukan';
                    } else if (jenis == JenisKas.kasKeluar) {
                      text = 'Total Pengeluaran';
                    }
                    return Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                Text(
                  'IDR ${countTotal().round()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
