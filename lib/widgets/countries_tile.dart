import 'package:flutter/material.dart';
import 'package:smart_pay/common/app_assets.dart';
import 'package:smart_pay/extensions/context_extension.dart';

class CountriesTile extends StatelessWidget {
  CountriesTile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.initials,
      required this.selected,
      this.onTap});

  final String imageUrl;
  final String title;
  final String initials;
  bool selected = false;
  final Function(String, String, bool, String)? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selected = !selected;
        onTap!(initials, title, selected, imageUrl);
      },
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            scale: 2.5,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            initials,
            style: context.textTheme.bodyLarge!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            title,
            style: context.textTheme.bodyLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          Visibility(
            visible: selected,
            replacement: const SizedBox.shrink(),
            child: Image.asset(
              AppAsset.check,
              scale: 2.7,
            ),
          )
        ],
      ),
    );
  }
}
