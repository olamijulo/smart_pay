import 'package:flutter/material.dart';
import 'package:smart_pay/theme/app_colors.dart';

class AltLoginButton extends StatelessWidget {
  const AltLoginButton({
    super.key,
    required this.imageUrl,
    required this.onTap,
  });

  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56.0,
        width: 155.0,
        decoration: BoxDecoration(
            border: Border.all(color: grey200),
            borderRadius: BorderRadius.circular(16.0)),
        child: Center(
          child: Image.asset(
            imageUrl,
            scale: 3,
          ),
        ),
      ),
    );
  }
}
