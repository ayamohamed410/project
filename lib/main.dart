import 'package:agin_3/background/background.dart';
import 'package:agin_3/view/screen/forget%20password/create_new_password.dart';
import 'package:agin_3/view/screen/forget%20password/forget_password.dart';
import 'package:agin_3/view/screen/forget%20password/verify_email.dart';
import 'package:agin_3/view/screen/home/home.dart';
import 'package:agin_3/view/screen/home/navigation.dart';
import 'package:agin_3/view/screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OnBoarding.routeName,
      routes: {
        OnBoarding.routeName: (context) => OnBoarding(),
        Home.routeName: (context) => Home(),
        ForgetPassword.routeName: (context) => ForgetPassword(),
        VerifyEmail.routeName: (context) => VerifyEmail(),
        CreateNewPassword.routeName: (context) => CreateNewPassword(),
        NavigationScreen.routeName: (context) => NavigationScreen(),
      },
    );
  }
}
