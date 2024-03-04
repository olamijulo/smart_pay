import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_pay/common/app_assets.dart';
import 'package:smart_pay/extensions/context_extension.dart';
import 'package:smart_pay/features/sign_in/widgets/alt_login_button.dart';
import 'package:smart_pay/features/sign_up/sign_up_view_model.dart';
import 'package:smart_pay/theme/app_colors.dart';
import 'package:smart_pay/utilities/validator.dart';
import 'package:smart_pay/widgets/custom_back_button.dart';

class SignUpView extends ConsumerWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: Form(
                key: ref.watch(signUpViewModelProvider).signUpformKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomBackButton(),
                    const SizedBox(
                      height: 40.0,
                    ),
                    RichText(
                        text: TextSpan(
                            text: 'Create a ',
                            style: context.textTheme.headlineSmall,
                            children: [
                          TextSpan(
                              text: 'SmartPay\n',
                              style: context.textTheme.headlineSmall!
                                  .copyWith(color: primaryColor)),
                          TextSpan(
                              text: 'account',
                              style: context.textTheme.headlineSmall)
                        ])),
                    const SizedBox(
                      height: 50.0,
                    ),
                    TextFormField(
                      controller:
                          ref.watch(signUpViewModelProvider).emailController,
                      onChanged: (value) {
                        ref.read(signUpViewModelProvider).textChange();
                      },
                      validator: (value) => Validator.validateEmail(value),
                      style: context.textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                      decoration: const InputDecoration(hintText: 'Email'),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    SizedBox(
                      height: 56.0,
                      width: double.infinity,
                      child: TextButton(
                          onPressed: ref
                                  .watch(signUpViewModelProvider)
                                  .emailController
                                  .text
                                  .isEmpty
                              ? null
                              : () => ref
                                  .read(signUpViewModelProvider)
                                  .verifyEmail(context),
                          child: Text(
                            'Sign Up',
                            style: context.textTheme.bodyLarge!.copyWith(
                                color: white, fontWeight: FontWeight.w600),
                          )),
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'OR',
                          style: context.textTheme.bodyMedium,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Expanded(child: Divider())
                      ],
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AltLoginButton(
                          onTap: () {},
                          imageUrl: AppAsset.googleIcon,
                        ),
                        AltLoginButton(
                          onTap: () {},
                          imageUrl: AppAsset.appleIcon,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 100.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Alreadyhave an account?',
                            style: context.textTheme.bodyLarge),
                        const SizedBox(width: 5.0),
                        GestureDetector(
                          onTap: () => context.push('/sign_in'),
                          child: Text('Sign In',
                              style: context.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: primaryColor)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
