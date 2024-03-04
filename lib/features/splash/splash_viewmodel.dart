import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:smart_pay/app/router.dart';

final Provider splashViewModelProvider = Provider<SplashViewModel>((ref) {
  return SplashViewModel();
});

class SplashViewModel {
  void splashTimer(context) {
    Future.delayed(Duration(seconds: 2), () {
      GoRouter.of(context).go('/get_started');
    });
  }
}
