import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pay/app/locator.dart';
import 'package:smart_pay/app/router.dart';
import 'package:smart_pay/common/helpers.dart';
import 'package:smart_pay/features/sign_in/model/sign_in_model.dart';
import 'package:smart_pay/model/generic_response_model.dart';
import 'package:smart_pay/services/authentication_service.dart';
import 'package:smart_pay/services/device_info_service.dart';
import 'package:smart_pay/services/toast_service.dart';

final signInViewModelProvider =
    ChangeNotifierProvider<SignInViewModel>((ref) => SignInViewModel());

class SignInViewModel extends ChangeNotifier {
  AutheticationService _authService = getIt<AutheticationService>();
  DeviceInfoService _deviceInfoService = getIt<DeviceInfoService>();
  ToastService _toastService = getIt<ToastService>();

  LoginResponseModel? loginResponseModel;

  final GlobalKey<FormState> signInformKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obcureText = true;

  Future<void> signIn(context) async {
    try {
      var formState = signInformKey.currentState;
      formState!.save();
      if (formState.validate()) {
        showLoading(context);
        SignInModel _signInModel = SignInModel(
            email: emailController.text,
            password: passwordController.text,
            deviceName: Platform.isAndroid
                ? await _deviceInfoService.androidInfo()
                : await _deviceInfoService.iosInfo());
        var res = await _authService.signIn(_signInModel);
        _authService.genericResponseModel = GenericResponseModel.fromMap(res);
        loginResponseModel = LoginResponseModel.fromJson(
            _authService.genericResponseModel!.data);
        router.pop();
        router.push('/dashboard');
        notifyListeners();
      }
    } catch (e, stacktrace) {
      // TODO
      router.pop();
      _toastService.showToast(context,
          type: ToastType.error,
          title: 'Error',
          subTitle: 'Something went wrong.');
      log('Something went wrong when trying to login \n$e\n$stacktrace');
    }
  }

  void togglePassword() {
    obcureText = !obcureText;
    notifyListeners();
  }
}
