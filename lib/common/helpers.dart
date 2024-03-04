import 'package:flutter/material.dart';
import 'package:smart_pay/common/app_assets.dart';
import 'package:smart_pay/theme/app_colors.dart';

void showLoading(context) {
  showDialog(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(color: white),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 7.0,
                    strokeCap: StrokeCap.round,
                    color: primaryColor,
                  )),
              Image.asset(
                AppAsset.appLogo,
                scale: 3,
              )
            ],
          ),
        );
      });
}
