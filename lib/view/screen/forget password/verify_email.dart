import 'package:flutter/material.dart';

import '../../../constans/colors.dart';
import '../../../constans/text_styles.dart';
import '../../../constans/widgets.dart';
import 'create_new_password.dart';


class VerifyEmail extends StatelessWidget {
  VerifyEmail({super.key});

  TextEditingController verifyController = TextEditingController();
  static String routeName = 'verifyEmail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
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
              Row(
                children: [
                  Spacer(flex: 1,),
                  Image.asset('assets/logo.png',scale: 2.5,),
                  SizedBox(width: 15,),
                  Text('NearHaven',style: AppStyles.titleStyle,),
                  Spacer(flex: 1,),
                ],
              ),
              Spacer(flex: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Verify Your Email',style: AppStyles.boldText,),
                ],
              ),
              Spacer(flex: 1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppWidgets.stepCircle("1", true, AppColors.primary,context),
                  AppWidgets.line(context),
                  AppWidgets.stepCircle("2", true, AppColors.primary,context),
                  AppWidgets.line(context),
                  AppWidgets.stepCircle("3", false, AppColors.primary,context),
                ],
              ),
              Spacer(flex: 1,),
              AppWidgets.pin(context),
              Spacer(flex: 1,),
              AppWidgets.button(context: context, text: "Verify",
                  func: (){
                    Navigator.pushNamed(context, CreateNewPassword.routeName);
                  }
              ),
              Spacer(flex: 25,),
            ],
          ),
        ),
      ),
    );
  }
}
