import 'package:agin_3/controller/onboarding_controller.dart';
import 'package:agin_3/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          SizedBox(height: 150),
          Image.asset(onBoardingList[i].image!),
          SizedBox(height: 52),

          Text(
            onBoardingList[i].title!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 33,
              color: Color.fromARGB(255, 214, 214, 214),
            ),
          ),
          SizedBox(height: 42),
          Text(
            onBoardingList[i].body!,
            style: TextStyle(color: Color(0xffD0CFCF), fontSize: 18),
          ),
        ],
      ),
    );
  }
}
