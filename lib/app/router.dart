// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:go_router/go_router.dart';
import 'package:smart_pay/features/about/about_view.dart';
import 'package:smart_pay/features/create_new_password/create_new_password_view.dart';
import 'package:smart_pay/features/dashboard/dashboard_view.dart';
import 'package:smart_pay/features/get_started/get_started_view.dart';
import 'package:smart_pay/features/success/success_view.dart';
import 'package:smart_pay/features/password_recovery.dart/password_recovery_view.dart';
import 'package:smart_pay/features/set_pin/set_pin_view.dart';
import 'package:smart_pay/features/sign_in/sign_in_view.dart';
import 'package:smart_pay/features/sign_up/sign_up_view.dart';
import 'package:smart_pay/features/splash/splash_view.dart';
import 'package:smart_pay/features/success_two/success_two_view.dart';
import 'package:smart_pay/features/verify_identity/verify_identity_view.dart';
import 'package:smart_pay/features/verify_user/verify_user_view.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => SplashView(), routes: []),
  GoRoute(
    path: '/get_started',
    builder: (context, state) => GetStartedView(),
  ),
  GoRoute(
    path: '/sign_in',
    builder: (context, state) => SignInView(),
  ),
  GoRoute(
    path: '/sign_up',
    builder: (context, state) => SignUpView(),
  ),
  GoRoute(
    path: '/verify_user',
    builder: (context, state) => VerifyUserView(),
  ),
  GoRoute(
    path: '/set_pin',
    builder: (context, state) => SetPinView(),
  ),
  GoRoute(
    path: '/success',
    builder: (context, state) => SuccessView(),
  ),
  GoRoute(
    path: '/success_pin',
    builder: (context, state) => SuccessTwoView(),
  ),
  GoRoute(
    path: '/about',
    builder: (context, state) => AboutView(),
  ),
  GoRoute(
    path: '/password_recovery',
    builder: (context, state) => PasswordRecoveryView(),
  ),
  GoRoute(
    path: '/verify_identity',
    builder: (context, state) => VerifyIdentityView(),
  ),
  GoRoute(
    path: '/create_new_password',
    builder: (context, state) => CreateNewPasswordView(),
  ),
    GoRoute(
    path: '/dashboard',
    builder: (context, state) => DashboardView(),
  )
]);
