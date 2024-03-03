import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_pay/common/app_assets.dart';
import 'package:smart_pay/extensions/context_extension.dart';
import 'package:smart_pay/theme/app_colors.dart';
import 'package:smart_pay/widgets/custom_back_button.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({Key? key}) : super(key: key);

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
                  Text(
                    'Create New Password',
                    style: context.textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                      'Please, enter a new password below different from the previous password',
                      style: context.textTheme.bodyLarge),
                  const SizedBox(
                    height: 50.0,
                  ),
                  TextFormField(
                    style: context.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: Image.asset(
                          AppAsset.hide,
                          scale: 20,
                          color: grey500,
                        )),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    style: context.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        suffixIcon: Image.asset(
                          AppAsset.hide,
                          scale: 20,
                          color: grey500,
                        )),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 56.0,
              width: double.infinity,
              child: TextButton(
                  onPressed: () => context.push('/about'),
                  child: Text(
                    'Create new password',
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
