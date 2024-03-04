import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pay/extensions/context_extension.dart';
import 'package:smart_pay/features/dashboard/dashboard_view_model.dart';
import 'package:smart_pay/theme/app_colors.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
          child: Column(children: [
            Row(
              children: [
                Container(
                  height: 70.0,
                  width: 70.0,
                  decoration:
                      BoxDecoration(color: grey50, shape: BoxShape.circle),
                  child: Icon(Icons.person),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Hello ${ref.watch(dashboardViewModelProvider).loginResponseModel.user!.fullName}',
                  style: context.textTheme.headlineSmall,
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0), color: grey100),
              child: Column(
                children: [
                  Text(
                    'Welcome onboard! your dashboard details will be available in due time.',
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
