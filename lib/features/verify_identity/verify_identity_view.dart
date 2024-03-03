import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_pay/common/app_assets.dart';
import 'package:smart_pay/extensions/context_extension.dart';
import 'package:smart_pay/theme/app_colors.dart';
import 'package:smart_pay/widgets/custom_back_button.dart';
import 'package:smart_pay/widgets/custom_checkbox.dart';

class VerifyIdentityView extends StatelessWidget {
  const VerifyIdentityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomBackButton(),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Image.asset(
                    AppAsset.userSpark,
                    scale: 3,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Verify your identity',
                    style: context.textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Where would you like ',
                        style: context.textTheme.bodyLarge,
                        children: [
                          TextSpan(
                              text: 'Smartpay ',
                              style: context.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: primaryColor)),
                          const TextSpan(text: 'to send your security code?')
                        ]),
                  ),
                  const SizedBox(
                    height: 34.0,
                  ),
                  Row(
                    children: [
                      const CustomCheckBox(),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email',
                              style: context.textTheme.bodyLarge!
                                  .copyWith(fontWeight: FontWeight.w600)),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text('taiwoolamijulo@gmail.com',
                              style: context.textTheme.bodyMedium!
                                  .copyWith(color: grey500))
                        ],
                      ),
                      const Spacer(),
                      Image.asset(
                        AppAsset.emailIcon,
                        scale: 3,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 56.0,
              width: double.infinity,
              child: TextButton(
                  onPressed: () => context.push('/create_new_password'),
                  child: Text(
                    'Continue',
                    style: context.textTheme.bodyLarge!
                        .copyWith(color: white, fontWeight: FontWeight.w600),
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
