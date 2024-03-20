import 'package:get/get.dart';
import 'package:sistem_informasi_bakorwil_malang/moduls/global_controllers/main_controller.dart';

class MainBiddings implements Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
