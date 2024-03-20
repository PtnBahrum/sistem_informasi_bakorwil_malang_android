import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashBiddings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
