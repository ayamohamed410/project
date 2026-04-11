import 'package:agin_3/view/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agin_3/background/app_assets.dart';
import 'package:agin_3/background/background.dart';
import 'package:agin_3/background/app_routes.dart';
import 'package:agin_3/view/widget/onboarding/custom_button.dart';
import 'package:agin_3/background/custom_textfield.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 24),
                buildAppLogo(),
                SizedBox(height: 37),
                buildsignUpText(),
                SizedBox(height: 26),
                buildFirstNameTextField(),
                SizedBox(height: 30),
                buildLastNameTextField(),
                SizedBox(height: 30),
                buildEmailTextField(),
                SizedBox(height: 30),
                buildPhoneTextField(),
                SizedBox(height: 30),
                buildPasswordTextField(),
                SizedBox(height: 16),
                buildLogin(),
                SizedBox(height: 18),
                buidSignup(),
                SizedBox(height: 24),
                buildOr(),
                SizedBox(height: 16),
                buildSocialLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildAppLogo() => Image.asset(AppAssets.logo);

  buildsignUpText() => Row(
    children: [
      Text(
        "Sign up",
        style: GoogleFonts.roboto(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Color(0xFF000000),
        ),
      ),
    ],
  );

  buildFirstNameTextField() => CustomTextfield(lableText: " First name *");

  buildLastNameTextField() => CustomTextfield(lableText: " Last Name *");

  buildEmailTextField() => CustomTextfield(lableText: " Email *");

  buildPhoneTextField() => CustomTextfield(lableText: " Phone *");

  buildPasswordTextField() =>
      CustomTextfield(lableText: " Password *", isPassword: true);

  buildLogin() => Row(
    children: [
      Text(
        "Already have an account?",
        style: GoogleFonts.openSans(
          fontSize: 16,
          color: Color(0xFF000000),
          fontWeight: FontWeight.w400,
        ),
      ),
      Spacer(),
      InkWell(
        onTap: () => Navigator.push(context, AppRoutes.login),
        child: Text(
          "Login",
          style: GoogleFonts.openSans(
            fontSize: 16,
            color: Color(0xFF000000),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  );

  buidSignup() => CustomBotton(text: "Sign up", onClick: () {
    Get.to(()=>LoginScreen());
  });

  buildOr() => Row(
    children: [
      Expanded(child: Divider(indent: 16, endIndent: 14, thickness: 1.5)),
      Text("Or", style: Theme.of(context).textTheme.labelMedium),
      Expanded(child: Divider(indent: 14, endIndent: 20.97, thickness: 1.5)),
    ],
  );

  buildSocialLogin() => Row(
    mainAxisAlignment: MainAxisAlignment.center,

    children: [
      Image.asset(AppAssets.icGoogle),
      SizedBox(width: 14),
      Image.asset(AppAssets.icApple),
      SizedBox(width: 14),
      Image.asset(AppAssets.icFacebook),

      // Icon(Icons.),
    ],
  );
}
