import 'package:flutter/material.dart';
import 'package:agin_3/view/screen/login.dart';
import 'package:agin_3/view/screen/home/signup_screen.dart';

abstract final class AppRoutes {
  static Route get login {
    return MaterialPageRoute(builder: (_) => const LoginScreen());
  }

  static Route get signUp {
    return MaterialPageRoute(builder: (_) => const SignupScreen());
  }
}
