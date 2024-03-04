// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pay/features/sign_in/model/sign_in_model.dart';
import 'package:smart_pay/features/sign_in/sign_in_view_model.dart';

final dashboardViewModelProvider =
    ChangeNotifierProvider<DashboardViewModel>((ref) => DashboardViewModel(loginResponseModel: ref.watch(signInViewModelProvider).loginResponseModel!));

class DashboardViewModel extends ChangeNotifier {
  LoginResponseModel loginResponseModel;
  DashboardViewModel({
    required this.loginResponseModel,
  });
}
