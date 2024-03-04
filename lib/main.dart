import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pay/app/locator.dart';
import 'package:smart_pay/app/router.dart';
import 'package:smart_pay/theme/app_theme.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
  setup();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}
