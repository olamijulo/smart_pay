import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_pay/extensions/context_extension.dart';
import 'package:smart_pay/theme/app_colors.dart';
import 'package:smart_pay/widgets/custom_back_button.dart';

class SetPinView extends StatelessWidget {
  const SetPinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const CustomBackButton(),
            const SizedBox(
              height: 40.0,
            ),
            Text(
              'Set your PIN code',
              style: context.textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
                'We use state-of-the-art security measures to protect your information at all times',
                style: context.textTheme.bodyLarge),
            const SizedBox(
              height: 50.0,
            ),
            Center(
              child: Pinput(
                defaultPinTheme: PinTheme(
                    height: 56.0,
                    width: 56.0,
                    textStyle: context.textTheme.headlineSmall,
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: primaryColor400, width: 2.0)),
                    )),
                focusedPinTheme: PinTheme(
                    height: 56.0,
                    width: 56.0,
                    textStyle: context.textTheme.headlineSmall,
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: primaryColor400, width: 2.0)),
                    )),
                length: 5,
                obscureText: true,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
            ),
            const SizedBox(
              height: 100.0,
            ),
            SizedBox(
              height: 56.0,
              width: double.infinity,
              child: TextButton(
                  onPressed: () => context.push('/onboarding_success'),
                  child: Text(
                    'Create Pin',
                    style: context.textTheme.bodyLarge!
                        .copyWith(color: white, fontWeight: FontWeight.w600),
                  )),
            ),
          ]),
        ),
      )),
    );
  }
}
