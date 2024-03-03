import 'package:flutter/material.dart';
import 'package:smart_pay/theme/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 25.0,
        width: 25.0,
        decoration: BoxDecoration(
            border: Border.all(color: grey400),
            shape: BoxShape.circle,
            color: primaryColor),
        child: const Center(
          child: Icon(
            Icons.check,
            color: white,
            size: 18.0,
          ),
        ),
      ),
    );
  }
}