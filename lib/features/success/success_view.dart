import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_pay/common/app_assets.dart';
import 'package:smart_pay/extensions/context_extension.dart';
import 'package:smart_pay/theme/app_colors.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Center(
                child: Image.asset(
                  AppAsset.thumbsUp,
                  scale: 3.0,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                'Congratulations, James',
                style: context.textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                'You’ve completed the onboarding, you can start using oue services.',
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                height: 56.0,
                width: double.infinity,
                child: TextButton(
                    onPressed: () => context.push('/sign_in'),
                    child: Text(
                      'Get Started',
                      style: context.textTheme.bodyLarge!
                          .copyWith(color: white, fontWeight: FontWeight.w600),
                    )),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
