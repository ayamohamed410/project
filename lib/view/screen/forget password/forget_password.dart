import 'package:flutter/material.dart';

import '../../../constans/colors.dart';
import '../../../constans/text_styles.dart';
import '../../../constans/widgets.dart';
import 'verify_email.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final TextEditingController emailController = TextEditingController();
  static String routeName = 'forgetPassword';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              Center(child: Image.asset('images/logoBlack.png', scale: 3.4)),

              Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text('Forget Password', style: AppStyles.boldText)],
              ),
              Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppWidgets.stepCircle("1", true, AppColors.primary, context),
                  AppWidgets.line(context),
                  AppWidgets.stepCircle("2", false, AppColors.primary, context),
                  AppWidgets.line(context),
                  AppWidgets.stepCircle("3", false, AppColors.primary, context),
                ],
              ),
              Spacer(flex: 1),
              AppWidgets.textField(context: context, label: 'Enter Email*'),
              Spacer(flex: 1),
              AppWidgets.button(
                context: context,
                text: "Send code",
                func: () {
                  Navigator.pushNamed(context, VerifyEmail.routeName);
                },
              ),
              Spacer(flex: 25),
            ],
          ),
        ),
      ),
    );
  }
}
