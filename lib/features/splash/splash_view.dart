import 'package:flutter/material.dart';
import 'package:smart_pay/common/app_assets.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
