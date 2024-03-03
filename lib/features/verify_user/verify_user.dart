import 'package:flutter/material.dart';
import 'package:smart_pay/extensions/context_extension.dart';
import 'package:smart_pay/widgets/custom_back_button.dart';

class VerifyUser extends StatelessWidget {
  const VerifyUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomBackButton(),
          const SizedBox(
            height: 40.0,
          ),
          Text(
            'Verify it’s you',
            style: context.textTheme.headlineSmall,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
              'We send a code to ( olamijulo@gmail.com ). Enter it here to verify your identity',
              style: context.textTheme.bodyLarge),
        ]),
      ),
    ));
  }
}
