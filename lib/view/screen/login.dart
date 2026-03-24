import 'package:agin_3/view/screen/apartments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login Page'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to apartments screen
                Get.to(() => const ApartmentsScreen());
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}