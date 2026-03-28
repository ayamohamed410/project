import 'package:agin_3/view/screen/forget%20password/forget_password.dart';
import 'package:agin_3/view/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agin_3/background/app_assets.dart';
import 'package:agin_3/view/widget/onboarding/custom_button.dart';
import 'package:agin_3/background/custom_textfield.dart';
import 'package:agin_3/background/background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 24),
                buildAppLogo(),
                SizedBox(height: 34),
                buildLoginText(),
                SizedBox(height: 26),
                buildEmailTextField(),
                SizedBox(height: 30),
                buildPasswordTextField(),
                SizedBox(height: 16),
                buildForgetPassword(),
                SizedBox(height: 16),
                buildLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildAppLogo() => Stack(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
      ),
      Center(child: Image.asset(AppAssets.logo)),
    ],
  );

  buildLoginText() => Row(
    children: [
      Text(
        "Login",
        style: GoogleFonts.roboto(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Color(0xFF000000),
        ),
      ),
    ],
  );

  buildEmailTextField() => CustomTextfield(lableText: " Email *");

  buildPasswordTextField() =>
      CustomTextfield(lableText: " Password *", isPassword: true);

  buildForgetPassword() => Row(
    children: [
      TextButton(
        onPressed: () {
          Get.to(() => ForgetPassword());
        },
        child: Text(
          "Forget password?",
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xffCF5656),
          ),
        ),
      ),
    ],
  );

  buildLogin() => CustomBotton(
    text: "Log In",
    onClick: () {
      Navigator.of(
        context
      ).push(MaterialPageRoute(builder: (context) => Home()));
    },
  );
}
