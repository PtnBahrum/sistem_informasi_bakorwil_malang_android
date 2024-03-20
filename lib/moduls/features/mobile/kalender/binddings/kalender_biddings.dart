import 'package:get/get.dart';

import '../controllers/kalender_controller.dart';
import '../repositories/kalender_repository.dart';

class KalenderBiddings implements Bindings {
  @override
  void dependencies() {
    Get.put(KalenderRepository());
  }
}
