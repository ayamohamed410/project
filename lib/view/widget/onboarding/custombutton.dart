// import 'package:agin_3/view/screen/home/home.dart';
// import 'package:agin_3/view/screen/home/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agin_3/view/screen/login.dart';

class CustomButtonOnBoarding extends StatelessWidget {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: OutlinedButton(
        onPressed: () {
          Get.to(() => const LoginScreen());
        },
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text("Start", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
