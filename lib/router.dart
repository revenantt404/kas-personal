import 'package:go_router/go_router.dart';
import 'package:kas_personal/screens/home_screen.dart';
import 'package:kas_personal/screens/kas_keluar_screen.dart';
import 'package:kas_personal/screens/kas_masuk_screen.dart';
import 'package:kas_personal/screens/lihat_semua.dart';

final router = GoRouter(routes: [
  GoRoute(
      path: '/',
      name: 'root',
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
            path: 'kas_masuk',
            name: 'kas_masuk',
            builder: (context, state) => KasMasukScreen()),
        GoRoute(
            path: 'kas_keluar',
            name: 'kas_keluar',
            builder: (context, state) => KasKeluarScreen()),
        GoRoute(
            path: 'lihat_semua',
            name: 'lihat_semua',
            builder: (context, state) => LihatSemua()),
      ])
]);
