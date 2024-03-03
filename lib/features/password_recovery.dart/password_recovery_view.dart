import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_pay/common/app_assets.dart';
import 'package:smart_pay/extensions/context_extension.dart';
import 'package:smart_pay/theme/app_colors.dart';
import 'package:smart_pay/widgets/custom_back_button.dart';

class PasswordRecoveryView extends StatelessWidget {
  const PasswordRecoveryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
                      AppAsset.padlockSpark,
                      scale: 3,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Password Recovery',
                      style: context.textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Enter your registered email below to receive password instructions',
                      style: context.textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 34.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'Email'),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 56.0,
                width: double.infinity,
                child: TextButton(
                    onPressed: () => context.push('/verify_identity'),
                    child: Text(
                      'Send me email',
                      style: context.textTheme.bodyLarge!
                          .copyWith(color: white, fontWeight: FontWeight.w600),
                    )),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
