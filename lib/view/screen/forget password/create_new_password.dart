import 'package:flutter/material.dart';

import '../../../constans/colors.dart';
import '../../../constans/text_styles.dart';
import '../../../constans/widgets.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  static String routeName = 'createNewPassword';

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  TextEditingController newPasswordController = TextEditingController();

  TextEditingController rePasswordController = TextEditingController();

  bool newPasswordObscure = true;
  bool rePasswordObscure = true;

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
              Center(child: Image.asset('images/logoBlack.png', scale: 2.1)),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Create New Password', style: AppStyles.boldText),
                ],
              ),
              Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppWidgets.stepCircle("1", true, AppColors.primary, context),
                  AppWidgets.line(context),
                  AppWidgets.stepCircle("2", true, AppColors.primary, context),
                  AppWidgets.line(context),
                  AppWidgets.stepCircle("3", true, AppColors.primary, context),
                ],
              ),
              Spacer(flex: 1),
              AppWidgets.passwordField(
                label: 'New Password*',
                obscure: newPasswordObscure,
                func: () {
                  setState(() {
                    newPasswordObscure = !newPasswordObscure;
                  });
                },
                context: context,
              ),
              Spacer(flex: 1),
              AppWidgets.passwordField(
                label: 'Re Password*',
                obscure: rePasswordObscure,
                func: () {
                  setState(() {
                    rePasswordObscure = !rePasswordObscure;
                  });
                },
                context: context,
              ),
              Spacer(flex: 1),
              AppWidgets.button(
                context: context,
                text: "Reset password",
                func: () {},
              ),
              Spacer(flex: 20),
            ],
          ),
        ),
      ),
    );
  }
}
