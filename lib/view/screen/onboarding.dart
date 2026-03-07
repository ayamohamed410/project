import 'package:agin_3/background/background.dart';
import 'package:agin_3/controller/onboarding_controller.dart';
import 'package:agin_3/view/widget/onboarding/custombutton.dart';
import 'package:agin_3/view/widget/onboarding/customslider.dart';
import 'package:agin_3/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: //SafeArea
      Stack(
        children: [
          const Background(),
          Column(
            children: [
              Expanded(flex: 2, child: CustomSliderOnBoarding()),

              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CustomButtonOnBoarding(),
                    SizedBox(height: 50),
                    CustomDotcontrollerOnBoarding(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
