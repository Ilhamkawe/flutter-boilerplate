import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warehouse_app/shared/utils/app_breakpoints.dart';
import 'package:warehouse_app/shared/widgets/buttons/icon_button.dart';
import 'package:warehouse_app/shared/widgets/buttons/outline_button.dart';
import 'package:warehouse_app/shared/widgets/buttons/primary_button.dart';
import 'package:warehouse_app/constants/spacing.dart';

class DSButtonPage extends ConsumerWidget {
  const DSButtonPage({super.key});

  @override
  Widget build(context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button Page')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Basic Button",
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              PrimaryButton(
                type: "primary",
                text: "Test basic Button primary",
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              PrimaryButton(
                type: "secondary",
                text: "Test basic Button secondary",
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              PrimaryButton(
                type: "success",
                text: "Test basic Button success",
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              PrimaryButton(
                type: "warning",
                text: "Test basic Button warning",
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              PrimaryButton(
                type: "error",
                text: "Test basic Button error",
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              PrimaryButton(
                type: "info",
                text: "Test basic Button info",
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              Text(
                "Outline Button",
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              OutlineButton(
                type: "primary",
                text: "Test Outline Button",
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              OutlineButton(
                type: "secondary",
                text: "Test Outline Button secondary",
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              OutlineButton(
                type: "success",
                text: "Test Outline Button success",
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              OutlineButton(
                type: "warning",
                text: "Test Outline Button warning",
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              OutlineButton(
                type: "error",
                text: "Test Outline Button error",
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              OutlineButton(
                type: "info",
                text: "Test Outline Button info",
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              Text(
                "Icon Button",
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              IconButtonApp(
                type: "primary",
                text: "Test basic Button",
                icon: Icons.add,
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              IconButtonApp(
                type: "secondary",
                text: "Test basic Button secondary",
                icon: Icons.add,
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              IconButtonApp(
                type: "success",
                text: "Test basic Button success",
                icon: Icons.add,
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              IconButtonApp(
                type: "warning",
                text: "Test basic Button warning",
                icon: Icons.add,
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              IconButtonApp(
                type: "error",
                text: "Test basic Button error",
                icon: Icons.add,
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              IconButtonApp(
                type: "info",
                text: "Test basic Button info",
                icon: Icons.add,
                onPressed: () {},
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              IconButtonApp(
                type: "primary",
                text: "Test basic Button primary outline",
                icon: Icons.add,
                onPressed: () {},
                isOutline: true,
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              IconButtonApp(
                type: "secondary",
                text: "Test basic Button secondary outline",
                icon: Icons.add,
                onPressed: () {},
                isOutline: true,
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              IconButtonApp(
                type: "success",
                text: "Test basic Button success outline",
                icon: Icons.add,
                onPressed: () {},
                isOutline: true,
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              IconButtonApp(
                type: "warning",
                text: "Test basic Button warning outline",
                icon: Icons.add,
                onPressed: () {},
                isOutline: true,
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              IconButtonApp(
                type: "error",
                text: "Test basic Button error outline",
                icon: Icons.add,
                onPressed: () {},
                isOutline: true,
              ),
              const SizedBox(height: AppSpacing.widgetSpacing),
              IconButtonApp(
                type: "info",
                text: "Test basic Button info outline",
                icon: Icons.add,
                onPressed: () {},
                isOutline: true,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
