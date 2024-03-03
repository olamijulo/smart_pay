import 'package:flutter/material.dart';
import 'package:smart_pay/extensions/context_extension.dart';
import 'package:smart_pay/theme/app_colors.dart';

class GetStartedSection extends StatelessWidget {
  const GetStartedSection({
    super.key,
    required this.imageUrl,
    required this.heading,
    required this.subHeading,
  });
  final String imageUrl;
  final String heading;
  final String subHeading;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(
              'Skip',
              style: context.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600, color: primaryColor400),
            ),
          ),
          const SizedBox(
            height: 100.0,
          ),
          Image.asset(
            imageUrl,
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            heading,
            textAlign: TextAlign.center,
            style: context.textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            'Your finance work starts here. Our here to help you track and deal with speeding up your transactions.',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
