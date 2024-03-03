import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_pay/app/router.dart';
import 'package:smart_pay/features/get_started/get_started_view.dart';
import 'package:smart_pay/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
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