import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_pay/theme/app_colors.dart';

class ProgressCloseButton extends StatefulWidget {
  const ProgressCloseButton({
    super.key,
  });

  @override
  State<ProgressCloseButton> createState() => _ProgressCloseButtonState();
}

class _ProgressCloseButtonState extends State<ProgressCloseButton> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  int _secondsRemaining = 10;
  // Set the initial countdown time in seconds
  bool _timerActive = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: 30.0,
            width: 30.0,
            child: CircularProgressIndicator(
              value: 1 - (_secondsRemaining / 10),
              backgroundColor: primaryColor,
              strokeWidth: 6.0,
            )),
        GestureDetector(
          onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
          child: Container(
            height: 30.0,
            width: 30.0,
            padding: const EdgeInsets.all(5.0),
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: grey50),
            child: const Icon(
              Icons.close,
              size: 20.0,
            ),
          ),
        ),
      ],
    );
  }

  void startTimer() {
    if (!_timerActive) {
      _timerActive = true;
      const oneSec = Duration(seconds: 1);
      Timer.periodic(oneSec, (Timer timer) {
        if (_secondsRemaining == 0) {
          timer.cancel();
          _timerActive = false;
        } else {
          if (mounted) {
            setState(() {
              _secondsRemaining--;
            });
          }
        }
      });
    }
  }
}
