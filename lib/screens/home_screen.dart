import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kas_personal/providers/kas_providers.dart';
import 'package:kas_personal/widgets/card_kas_info_all.dart';
import 'package:kas_personal/widgets/costum_icon_button.dart';
import 'package:kas_personal/widgets/creator_info.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onKasMasukTap() => context.goNamed('kas_masuk');
  void onKeluarTap() => context.goNamed('kas_keluar');
  void onlihatSemua() => context.goNamed('lihat_semua');

  void onInfoTap() async {
    await showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: CreatorInfo(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kas Personal App"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Consumer<KasProviders>(
              builder: (context, value, child) {
                final items = value.items;
                return CardKasInfoAll(items: items);
              },
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey.shade200,
              height: 0,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    fit: FlexFit.tight,
                    child: CostumIconButton(
                        backgroundColor: Color.fromARGB(255, 26, 34, 126),
                        icon: Icons.credit_card,
                        text: "Kas Masuk",
                        onTap: onKasMasukTap)),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                    fit: FlexFit.tight,
                    child: CostumIconButton(
                        backgroundColor: Color.fromARGB(255, 26, 34, 126),
                        icon: Icons.receipt,
                        text: "Kas Keluar",
                        onTap: onKeluarTap)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            CostumIconButton(
                backgroundColor: Color.fromARGB(255, 26, 34, 126),
                icon: Icons.attach_money_outlined,
                text: "Lihat Semua Transaksi",
                onTap: onlihatSemua),
            SizedBox(
              height: 10,
            ),
            CostumIconButton(
                backgroundColor: Color.fromARGB(255, 26, 34, 126),
                icon: Icons.info,
                text: "Tentang Pembuat",
                onTap: onInfoTap)
          ],
        ),
      ),
    );
  }
}
