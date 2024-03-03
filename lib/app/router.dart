// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:go_router/go_router.dart';
import 'package:smart_pay/features/get_started/get_started_view.dart';
import 'package:smart_pay/features/sign_in/sign_in_view.dart';
import 'package:smart_pay/features/sign_up/sign_up_view.dart';
import 'package:smart_pay/features/verify_user/verify_user.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => GetStartedView(), routes: []),
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
    builder: (context, state) => VerifyUser(),
  )
]);
