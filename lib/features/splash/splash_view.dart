import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pay/common/app_assets.dart';
import 'package:smart_pay/features/splash/splash_viewmodel.dart';

class SplashView extends ConsumerWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(splashViewModelProvider).splashTimer(context);

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Spacer(),
          Center(
            child: Image.asset(
              AppAsset.splashLogo,
              scale: 4,
            ),
          ),
          const Spacer()
        ]),
      )),
    );
  }
}
