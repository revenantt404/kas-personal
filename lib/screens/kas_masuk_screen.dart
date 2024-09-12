import 'package:flutter/material.dart';
import 'package:kas_personal/models/kas.dart';
import 'package:kas_personal/providers/kas_providers.dart';
import 'package:kas_personal/widgets/card_kas_info.dart';
import 'package:kas_personal/widgets/kas_item.dart';
import 'package:provider/provider.dart';

class KasMasukScreen extends StatefulWidget {
  const KasMasukScreen({super.key});

  @override
  State<KasMasukScreen> createState() => _KasMasukScreenState();
}

class _KasMasukScreenState extends State<KasMasukScreen> {
  void baru() async {
    await showDialog(
        context: context,
        builder: (context) {
          return BaruDialog(
              onSimpan:
                  Provider.of<KasProviders>(context, listen: false).tambah);
        });
  }

  void onItemTap(Kas kas) async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: Text("Hapus"),
              content: Text("Apakah anda ingin menghapus?"),
              actions: [
                ElevatedButton(
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))),
                    onPressed: () {
                      Provider.of<KasProviders>(context, listen: false)
                          .hapus(kas);
                      Navigator.of(context).pop();
                    },
                    child: Text("YA")),
                ElevatedButton(
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Tidak")),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kas Masuk"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: baru,
        child: Icon(Icons.add),
      ),
      body: Consumer<KasProviders>(builder: (context, value, child) {
        final items = value.masukItems;
        return Column(
          children: [
            CardKasInfo(items: items, jenis: JenisKas.kasMasuk),
            Flexible(
              child: ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (context, index) => Divider(
                        height: 0,
                        color: Colors.grey,
                      ),
                  itemBuilder: (context, index) {
                    var kas = items[index];
                    return KasItem(kas: kas, onTap: () => onItemTap(kas));
                  }),
            ),
          ],
        );
      }),
    );
  }
}

class BaruDialog extends StatefulWidget {
  const BaruDialog({super.key, required this.onSimpan});

  final void Function(Kas kas) onSimpan;
  @override
  State<BaruDialog> createState() => _BaruDialogState();
}

class _BaruDialogState extends State<BaruDialog> {
  final nominalController = TextEditingController(text: '');
  final keteranganController = TextEditingController(text: '');

  void onSimpan() {
    double nominal =
        nominalController.text != '' ? double.parse(nominalController.text) : 0;
    var kas = Kas.masuk(
        keterangan: keteranganController.text,
        nominal: nominal,
        dateTime: DateTime.now());
    widget.onSimpan(kas);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Buat Kas Baru",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: nominalController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.numbers),
              labelText: "Nominal",
              filled: true,
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: keteranganController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.info),
              labelText: "Keterangan",
              filled: true,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
              child: Text("Simpan"),
              onPressed: () {
                onSimpan();
              },
            ),
          )
        ],
      ),
    );
  }
}
