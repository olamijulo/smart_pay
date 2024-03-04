// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smart_pay/app/locator.dart';
import 'package:smart_pay/app/router.dart';
import 'package:smart_pay/common/helpers.dart';
import 'package:smart_pay/features/sign_up/model/email_verification_model.dart';
import 'package:smart_pay/features/sign_up/sign_up_view_model.dart';
import 'package:smart_pay/features/verify_user/model/token_verification_model.dart';
import 'package:smart_pay/model/generic_response_model.dart';
import 'package:smart_pay/services/authentication_service.dart';
import 'package:smart_pay/services/toast_service.dart';

final verifyUserViewModelProvider =
    ChangeNotifierProvider<VerifyUserViewModel>((ref) => VerifyUserViewModel(
          email: ref.watch(signUpViewModelProvider).emailController.text,
        ));

class VerifyUserViewModel extends ChangeNotifier {
  VerifyUserViewModel({
    required this.email,
  });

  AutheticationService _authService = getIt<AutheticationService>();
  ToastService _toastService = getIt<ToastService>();

  int seconds = 30;
  late Timer timer;
  String email;

  TextEditingController pinPutController = TextEditingController();

  Future<void> verifyToken(context) async {
    try {
      showLoading(context);
      TokenVerificationModel _emailVerificationtModel =
          TokenVerificationModel(email: email, token: pinPutController.text);
      var res = await _authService.tokenVerification(_emailVerificationtModel);
      _authService.genericResponseModel = GenericResponseModel.fromMap(res);
      router.pop();
      router.push('/about');
      notifyListeners();
    } catch (e, stackTrace) {
      // TODO
      router.pop();
      log('Error occured when trying to verify token\n$e\n$stackTrace');
    }
  }

  Future<void> resendToken(context) async {
    try {
      showLoading(context);
      EmailVerificationModel _emailVerificationtModel =
          EmailVerificationModel(email: email);
      var res = await _authService.emailVerification(_emailVerificationtModel);
      _authService.genericResponseModel = GenericResponseModel.fromMap(res);
      startTimer();
      router.pop();
      notifyListeners();
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

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (seconds == 0) {
          timer.cancel();
          seconds = 30;
          print('Countdown finished!');
        } else {
          seconds--;
          notifyListeners();
        }
      },
    );
  }
}
