import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }
}
