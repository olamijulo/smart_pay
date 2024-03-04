import 'package:flutter/material.dart';
import 'package:smart_pay/widgets/toast.dart';

enum ToastType { error, warning, success, defaultType }

class ToastService {
  void showToast(context,
      {required ToastType type,
      required String title,
      required String subTitle}) {
    final snackBar = SnackBar(
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
        duration: const Duration(seconds: 10),
        content: Toast(
          title: title,
          subTitle: subTitle,
          type: type,
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
