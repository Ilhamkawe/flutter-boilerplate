import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warehouse_app/shared/widgets/input/text_form_field.dart';

class InputPage extends ConsumerWidget {
  const InputPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input Page')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Input",
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
              AppTextFormField(
                suffixIcon: Icon(Icons.email),
                prefixIcon: Icon(Icons.lock),
                hintText: "Email",
                obscureText: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
