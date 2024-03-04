import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_pay/common/app_assets.dart';
import 'package:smart_pay/extensions/context_extension.dart';
import 'package:smart_pay/features/sign_in/sign_in_view_model.dart';
import 'package:smart_pay/features/sign_in/widgets/alt_login_button.dart';
import 'package:smart_pay/theme/app_colors.dart';
import 'package:smart_pay/utilities/validator.dart';
import 'package:smart_pay/widgets/custom_back_button.dart';

class SignInView extends ConsumerWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 30.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: ref.watch(signInViewModelProvider).signInformKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomBackButton(),
                          const SizedBox(
                            height: 40.0,
                          ),
                          Text(
                            'Hi There! 👋',
                            style: context.textTheme.headlineSmall,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text('Welcome back, Sign in to your account',
                              style: context.textTheme.bodyLarge),
                          const SizedBox(
                            height: 50.0,
                          ),
                          TextFormField(
                            controller: ref
                                .watch(signInViewModelProvider)
                                .emailController,
                            validator: (value) =>
                                Validator.validateEmail(value),
                            style: context.textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.w600),
                            decoration:
                                const InputDecoration(hintText: 'Email'),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            controller: ref
                                .watch(signInViewModelProvider)
                                .passwordController,
                            validator: (value) =>
                                Validator.validatePassword(value),
                            style: context.textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.w600),
                            obscureText:
                                ref.watch(signInViewModelProvider).obcureText,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              suffixIcon: GestureDetector(
                                onTap: () => ref
                                    .read(signInViewModelProvider.notifier)
                                    .togglePassword(),
                                child: Visibility(
                                  visible: ref
                                      .watch(signInViewModelProvider)
                                      .obcureText,
                                  replacement: Image.asset(
                                    AppAsset.view,
                                    scale: 20,
                                    color: grey500,
                                  ),
                                  child: Image.asset(
                                    AppAsset.hide,
                                    scale: 20,
                                    color: grey500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          GestureDetector(
                            onTap: () => context.push('/password_recovery'),
                            child: Text(
                              'Forgot Password?',
                              style: context.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: primaryColor),
                            ),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          SizedBox(
                            height: 56.0,
                            width: double.infinity,
                            child: TextButton(
                                onPressed: () {
                                  ref
                                      .read(signInViewModelProvider.notifier)
                                      .signIn(context);
                                },
                                child: Text(
                                  'Sign In',
                                  style: context.textTheme.bodyLarge!.copyWith(
                                      color: white,
                                      fontWeight: FontWeight.w600),
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
                            height: 60.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don’t have an account?',
                                  style: context.textTheme.bodyLarge),
                              const SizedBox(width: 5.0),
                              GestureDetector(
                                onTap: () => context.push('/sign_up'),
                                child: Text('Sign up',
                                    style: context.textTheme.bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: primaryColor)),
                              ),
                            ],
                          )
                        ]),
                  ),
                ))),
      ),
    );
  }
}
