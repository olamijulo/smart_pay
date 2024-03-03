// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_pay/common/app_assets.dart';
import 'package:smart_pay/extensions/context_extension.dart';
import 'package:smart_pay/features/sign_in/widgets/alt_login_button.dart';
import 'package:smart_pay/theme/app_colors.dart';
import 'package:smart_pay/widgets/custom_back_button.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomBackButton(),
                        SizedBox(
                          height: 40.0,
                        ),
                        Text(
                          'Hi There! 👋',
                          style: context.textTheme.headlineSmall,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text('Welcome back, Sign in to your account',
                            style: context.textTheme.bodyLarge),
                        SizedBox(
                          height: 50.0,
                        ),
                        TextFormField(
                          style: context.textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.w600),
                          decoration: InputDecoration(hintText: 'Email'),
                        ),
                        SizedBox(
                          height: 15.0,
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
                        SizedBox(
                          height: 25.0,
                        ),
                        Text(
                          'Forgot Password?',
                          style: context.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w600, color: primaryColor),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        SizedBox(
                          height: 56.0,
                          width: double.infinity,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Sign In',
                                style: context.textTheme.bodyLarge!.copyWith(
                                    color: white, fontWeight: FontWeight.w600),
                              )),
                        ),
                        SizedBox(
                          height: 35.0,
                        ),
                        Row(
                          children: [
                            Expanded(child: Divider()),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'OR',
                              style: context.textTheme.bodyMedium,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(child: Divider())
                          ],
                        ),
                        SizedBox(
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
                        SizedBox(
                          height: 60.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don’t have an account?',
                                style: context.textTheme.bodyLarge),
                            SizedBox(width: 5.0),
                            GestureDetector(
                              onTap: () => context.push('/sign_up'),
                              child: Text('Sign up',
                                  style: context.textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: primaryColor)),
                            ),
                          ],
                        )
                      ]),
                ))),
      ),
    );
  }
}
