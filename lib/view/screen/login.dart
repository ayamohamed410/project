import 'package:agin_3/view/screen/forget%20password/forget_password.dart';
import 'package:agin_3/view/screen/studentScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agin_3/background/app_assets.dart';
import 'package:agin_3/view/widget/onboarding/custom_button.dart';
import 'package:agin_3/background/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

static String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back),
                ),
              ),

              buildAppLogo(),
              SizedBox(height: 4),
              buildLoginText(),
              SizedBox(height: 26),
              buildEmailTextField(),
              SizedBox(height: 19),
              buildPasswordTextField(),
              SizedBox(height: 5),
              buildForgetPassword(),
              SizedBox(height: 5),
              buildLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Stack buildAppLogo() => Stack(
    children: [
      Center(
        child: Column(children: [Image.asset(AppAssets.logo, scale: 2.2)]),
      ),
    ],
  );

  Row buildLoginText() => Row(
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

  CustomTextfield buildEmailTextField() =>
      CustomTextfield(lableText: " Email *");

  CustomTextfield buildPasswordTextField() =>
      CustomTextfield(lableText: " Password *", isPassword: true);

  Row buildForgetPassword() => Row(
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

  SizedBox buildLogin() => SizedBox(
    width: MediaQuery.of(context).size.width * 0.95, // 95% من عرض الشاشة
    child: CustomBotton(
      text: "Log In",
      onClick: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => StudentScreen()));
      },
    ),
  );
}
