import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_pay/extensions/context_extension.dart';
import 'package:smart_pay/features/verify_user/verify_user_view_model.dart';
import 'package:smart_pay/theme/app_colors.dart';
import 'package:smart_pay/widgets/custom_back_button.dart';

class VerifyUserView extends ConsumerStatefulWidget {
  const VerifyUserView({Key? key}) : super(key: key);

  @override
  ConsumerState<VerifyUserView> createState() => _VerifyUserViewState();
}

class _VerifyUserViewState extends ConsumerState<VerifyUserView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(verifyUserViewModelProvider.notifier).startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    ref.watch(verifyUserViewModelProvider).timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var verifyUserViewModel = ref.watch(verifyUserViewModelProvider);

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
                controller:
                    ref.watch(verifyUserViewModelProvider).pinPutController,
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
                errorPinTheme: PinTheme(
                    height: 56.0,
                    width: 56.0,
                    textStyle: context.textTheme.headlineSmall,
                    decoration: BoxDecoration(
                        color: grey50,
                        borderRadius: BorderRadius.circular(12.0))),
                length: 5,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Center(
              child: verifyUserViewModel.seconds == 0
                  ? GestureDetector(
                      onTap: () {
                        ref
                            .read(verifyUserViewModelProvider.notifier)
                            .resendToken(context);
                      },
                      child: Text(
                        'Resend Code',
                        style: context.textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    )
                  : Text(
                      'Resend Code ${verifyUserViewModel.seconds} secs',
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
                  onPressed: () {
                    ref
                        .read(verifyUserViewModelProvider.notifier)
                        .verifyToken(context);
                  },
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
