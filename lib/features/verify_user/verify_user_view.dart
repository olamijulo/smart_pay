import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_pay/extensions/context_extension.dart';
import 'package:smart_pay/theme/app_colors.dart';
import 'package:smart_pay/widgets/custom_back_button.dart';

class VerifyUserView extends StatelessWidget {
  const VerifyUserView({Key? key}) : super(key: key);

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
              'Verify it’s you',
              style: context.textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
                'We send a code to ( olamijulo@gmail.com ). Enter it here to verify your identity',
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
                    decoration: BoxDecoration(
                        color: grey50,
                        borderRadius: BorderRadius.circular(12.0))),
                focusedPinTheme: PinTheme(
                    height: 56.0,
                    width: 56.0,
                    textStyle: context.textTheme.headlineSmall,
                    decoration: BoxDecoration(
                        color: grey50,
                        border: Border.all(color: primaryColor400),
                        borderRadius: BorderRadius.circular(12.0))),
                length: 5,
                validator: (s) {
                  return s == '2222' ? null : 'Pin is incorrect';
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Center(
              child: Text(
                'Resend Code 30 secs',
                style: context.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            SizedBox(
              height: 56.0,
              width: double.infinity,
              child: TextButton(
                  onPressed: () => context.push('/about'),
                  child: Text(
                    'Confirm',
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
