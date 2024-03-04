import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_pay/app/locator.dart';
import 'package:smart_pay/app/router.dart';
import 'package:smart_pay/common/app_assets.dart';
import 'package:smart_pay/common/helpers.dart';
import 'package:smart_pay/features/sign_up/model/email_verification_model.dart';
import 'package:smart_pay/model/generic_response_model.dart';
import 'package:smart_pay/services/authentication_service.dart';
import 'package:smart_pay/services/toast_service.dart';
import 'package:smart_pay/theme/app_colors.dart';

final signUpViewModelProvider = ChangeNotifierProvider<SignUpViewModel>((ref) {
  return SignUpViewModel();
});

class SignUpViewModel extends ChangeNotifier {
  AutheticationService _authService = getIt<AutheticationService>();
    ToastService _toastService = getIt<ToastService>();


  final GlobalKey<FormState> signUpformKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  Future<void> verifyEmail(context) async {
    try {
      var formState = signUpformKey.currentState;
      formState!.save();
      if (formState.validate()) {
        showLoading(context);
        EmailVerificationModel _emailVerificationtModel =
            EmailVerificationModel(email: emailController.text);
        var res =
            await _authService.emailVerification(_emailVerificationtModel);
        _authService.genericResponseModel = GenericResponseModel.fromMap(res);
        router.pop();
        router.push('/verify_user');
        notifyListeners();
      }
    } catch (e, stacktrace) {
      // TODO
      router.pop();
        _toastService.showToast(context,
          type: ToastType.error,
          title: 'Error',
          subTitle: 'Something went wrong.');
      log('Something went wrong when trying to Verify Email\n$e\n$stacktrace');
    }
  }

  void textChange() {
    notifyListeners();
  }
}
