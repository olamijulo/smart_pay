import 'package:flutter/material.dart';
import 'package:smart_pay/extensions/context_extension.dart';
import 'package:smart_pay/services/toast_service.dart';
import 'package:smart_pay/theme/app_colors.dart';
import 'package:smart_pay/widgets/progress_close_button.dart';

class Toast extends StatelessWidget {
  final String title;
  final String subTitle;
  final ToastType type;

  const Toast({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: switch (type) {
            ToastType.success => success100,
            ToastType.warning => warning200,
            ToastType.error => error300,
            ToastType.defaultType => grey50
          },
          borderRadius: BorderRadius.circular(14.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: switch (type) {
                      ToastType.success => white,
                      ToastType.warning => grey900,
                      ToastType.error => white,
                      ToastType.defaultType => grey900,
                    },
                  )),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 200.0,
                child: Text(
                  subTitle,
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: switch (type) {
                      ToastType.success => white,
                      ToastType.warning => grey900,
                      ToastType.error => white,
                      ToastType.defaultType => grey900,
                    },
                  ),
                ),
              ),
            ],
          ),
          const ProgressCloseButton()
        ],
      ),
    );
  }
}
