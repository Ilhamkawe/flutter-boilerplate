import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:warehouse_app/constants/breakpoint.dart';
import 'package:warehouse_app/shared/utils/app_breakpoints.dart';
import 'package:warehouse_app/shared/widgets/buttons/primary_button.dart';

class Login extends ConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double screenHeight = AppBreakPoint.screenHeight(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(color: Colors.amber, child: Text("test")),
                Container(color: Colors.blue, child: Text("test2")),
              ],
            ),
            Text(
              'Halaman Login Placeholder wakwaw ${AppBreakPoint.screenHeight(context)}',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('Kembali'),
            ),
            const SizedBox(height: 20),
            PrimaryButton(text: "Test Button", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
