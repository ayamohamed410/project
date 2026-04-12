import 'package:agin_3/constans/colors.dart';
import 'package:agin_3/view/screen/home/signup_screen.dart';
import 'package:agin_3/view/screen/login.dart';
import 'package:agin_3/view/widget/onboarding/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});
  static String routeName = 'onBoarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "images/startPhoto.jpg",
              fit: BoxFit.cover, //خلي الصورة تغطي الشاشة كلها
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 35, bottom: 400),

              child: Text(
                "NearHaven",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          //**************************الجزء الابيض  */
          Align(
            alignment: Alignment.bottomCenter,
            // child: Container(
            //   height: 256,
            //   width: double.infinity,
            //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 21.5),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(70),
            //       topRight: Radius.circular(70),
            //     ),
            //   ),
            child: ClipPath(
              clipper: BottomCurveClipper(),
              child: Container(
                height:
                    MediaQuery.of(context).size.height *
                    0.42, // بيخليه يعتمد على حجم الشاشة (مش رقم ثابت)
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 21.5),

                //****************************Text********************************* */
                child: Column(
                  children: [
                    SizedBox(height: 23),
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      """        We will help you find an
       apartment close to your
     college at a reasonable price""",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff838282),
                      ),
                    ),

                    //*****************************Button******************************** */
                    SizedBox(height: 12),
                    SizedBox(
                      width: 130,

                      child: CustomBotton(
                        text: "Login",
                        textColor: Colors.white,
                        borderRadius: (20),
                        heightNum: 0.6,
                        onClick: () {
                          Get.to(() => LoginScreen());
                        },
                      ),
                    ),
                    SizedBox(height: 9),

                    SizedBox(
                      width: 130,

                      child: CustomBotton(
                        text: "Sign Up",
                        textColor: AppColors.primary,
                        backGroundColor: Colors.white,
                        borderRadius: (20),
                        heightNum: 0.6,
                        borderSide: BorderSide(color: AppColors.primary),
                        onClick: () {
                          Get.to(() => SignupScreen());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    double curveHeight = size.height * 0.25;

    path.lineTo(0, curveHeight);

    path.cubicTo(
      size.width * 0.25, // شمال
      0, // نفس المستوى

      size.width * 0.75, // يمين
      0, // نفس المستوى

      size.width,
      curveHeight,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
