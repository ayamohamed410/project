import 'package:agin_3/constans/colors.dart';
import 'package:agin_3/view/screen/login.dart';
import 'package:agin_3/view/widget/onboarding/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

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
            child: Text(
              "NearHaven",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 27.5,
                color: Colors.white,
              ),
            ),
          ),

          //**************************الجزء الابيض  */
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 240,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 21.5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70),
                  topRight: Radius.circular(70),
                ),
              ),

              //****************************Text********************************* */
              child: Column(
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "We will help you find an",
                    style: TextStyle(fontSize: 16, color: Color(0xff838282)),
                  ),

                  Text(
                    "apartment close to your",
                    style: TextStyle(fontSize: 16, color: Color(0xff838282)),
                  ),
                  Text(
                    "college at a reasonable price",
                    style: TextStyle(fontSize: 16, color: Color(0xff838282)),
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
                      onClick: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
