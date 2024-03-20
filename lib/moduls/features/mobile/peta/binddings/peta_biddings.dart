import 'package:get/get.dart';

import '../controllers/peta_controller.dart';

class PetaBiddings implements Bindings {
  @override
  void dependencies() {
    Get.put(PetaController());
  }
}
