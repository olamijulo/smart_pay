import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_pay/common/app_assets.dart';
import 'package:smart_pay/theme/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pop(),
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
            border: Border.all(color: grey200),
            borderRadius: BorderRadius.circular(12.0)),
        child: Image.asset(
          AppAsset.arrowLeft,
          scale: 3,
        ),
      ),
    );
  }
}
