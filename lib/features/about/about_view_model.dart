import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pay/app/locator.dart';
import 'package:smart_pay/app/router.dart';
import 'package:smart_pay/common/helpers.dart';
import 'package:smart_pay/data/countries_data.dart';
import 'package:smart_pay/features/about/model/sign_up_request_model.dart';
import 'package:smart_pay/model/generic_response_model.dart';
import 'package:smart_pay/services/authentication_service.dart';
import 'package:smart_pay/services/device_info_service.dart';
import 'package:smart_pay/services/toast_service.dart';

final aboutViewModelProvider =
    ChangeNotifierProvider<AboutViewModel>((ref) => AboutViewModel());

class AboutViewModel extends ChangeNotifier {
  AutheticationService _authService = getIt<AutheticationService>();
  DeviceInfoService _deviceInfoService = getIt<DeviceInfoService>();
    ToastService _toastService = getIt<ToastService>();


  List<bool> countryValues = List.generate(countries.length, (index) => false);

  final GlobalKey<FormState> aboutFormKey = GlobalKey<FormState>();

  TextEditingController emailContoller = TextEditingController();
  TextEditingController userNameContoller = TextEditingController();
  TextEditingController passwordContoller = TextEditingController();
  TextEditingController countryContoller = TextEditingController();
  TextEditingController fullNameContoller = TextEditingController();

  String countryFlag = '';
  String? countryInitials;
  bool obcureText = true;

  Future<void> signUp(context) async {
    try {
      var formState = aboutFormKey.currentState;
      formState!.save();
      if (formState.validate()) {
        showLoading(context);

        SignUpRequestModel _signUpRequestModel = SignUpRequestModel(
            fullName: fullNameContoller.text,
            email: emailContoller.text,
            country: countryInitials ?? '',
            password: passwordContoller.text,
            deviceName: Platform.isAndroid
                ? await _deviceInfoService.androidInfo()
                : await _deviceInfoService.iosInfo());
        var res = await _authService.signUp(_signUpRequestModel);
        _authService.genericResponseModel = GenericResponseModel.fromMap(res);
        router.pop();
        router.push('/set_pin');
        notifyListeners();
      }
    } catch (e, stacktrace) {
      // TODO
      router.pop();
        _toastService.showToast(context,
          type: ToastType.error,
          title: 'Error',
          subTitle: 'Something went wrong.');
      log('Something went wrong when trying to sign up \n$e\n$stacktrace');
    }
  }

  void toggleCountries(index, value, initials, title, imageUrl) {
    for (int i = 0; i < countryValues.length; i++) {
      countryValues[i] = false;
    }
    countryValues[index] = value;
    countryContoller.text = title;
    countryFlag = imageUrl;
    countryInitials = initials;
    notifyListeners();
  }

  void togglePassword() {
    obcureText = !obcureText;
    notifyListeners();
  }
}
