import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_pay/common/app_assets.dart';
import 'package:smart_pay/extensions/context_extension.dart';
import 'package:smart_pay/features/get_started/widgets/get_started_section.dart';
import 'package:smart_pay/theme/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GetStartedView extends StatelessWidget {
  GetStartedView({Key? key}) : super(key: key);

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey50,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const GetStartedSection(
                    imageUrl: (AppAsset.getStartedImageOne),
                    heading: 'Finance app the safest and most trusted',
                    subHeading:
                        'Your finance work starts here. Our here to help you track and deal with speeding up your transactions.',
                  ),
                  const GetStartedSection(
                    imageUrl: (AppAsset.getStartedImageTwo),
                    heading: 'The fastest transaction process only here',
                    subHeading:
                        'Get easy to pay all your bills with just a few steps. Paying your bills become fast and efficient.',
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            SmoothPageIndicator(
                controller: controller, // PageController
                count: 2,
                effect: const ExpandingDotsEffect(
                    dotHeight: 10.0,
                    dotWidth: 10.0,
                    spacing: 5.0,
                    expansionFactor: 5,
                    activeDotColor: grey900,
                    dotColor: grey200), // your preferred effect
                onDotClicked: (index) {}),
            const SizedBox(
              height: 40.0,
            ),
            SizedBox(
              height: 56.0,
              width: double.infinity,
              child: TextButton(
                  onPressed: () => context.push('/sign_in'),
                  child: Text(
                    'Get Started',
                    style: context.textTheme.bodyLarge!
                        .copyWith(color: white, fontWeight: FontWeight.w700),
                  )),
            )
          ],
        ),
      )),
    );
  }
}
