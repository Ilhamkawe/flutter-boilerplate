import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:warehouse_app/src/feature/authentication/presentation/pages/login.dart';

// Kita masukkan appRouterProvider ke dalam Provider Riverpod
// Supaya ke depannya router ini gampang untuk dibikin nunggu (listen) perubahan State Auth (contoh: user login/logout -> otomatis redirect)
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    // TODO: (Opsional) Tambahkan logic redirect untuk ngecek auth state (contoh: kalau belum login lempar ke /login)
    // redirect: (context, state) { ... },
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => Scaffold(
          appBar: AppBar(title: const Text('Home')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Halaman Utama (Home)'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => context.pushNamed('login'),
                  child: const Text('Ke Halaman Login'),
                ),
              ],
            ),
          ),
        ),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => Login(),
      ),
    ],
    // Tampilan jika url rute tidak ditemukan (biasanya kepake di Web)
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Halaman tidak ditemukan: ${state.error}')),
    ),
  );
});
