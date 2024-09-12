import 'package:flutter/material.dart';
import 'package:kas_personal/models/kas.dart';

class KasProviders extends ChangeNotifier {
  List<Kas> _items = [];

  List<Kas> get items => _items;
  List<Kas> get masukItems =>
      _items.where((e) => e.jenis == JenisKas.kasMasuk).toList();
  List<Kas> get keluarItems =>
      _items.where((e) => e.jenis == JenisKas.kasKeluar).toList();

  void tambah(Kas kas) {
    _items.add(kas);
    notifyListeners();
  }

  void hapus(Kas kas) {
    _items.remove(kas);
    notifyListeners();
  }
}
