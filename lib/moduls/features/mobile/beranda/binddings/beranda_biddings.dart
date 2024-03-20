import 'package:get/get.dart';
import 'package:sistem_informasi_bakorwil_malang/moduls/features/mobile/beranda/controllers/beranda_controller.dart';

class BerandaBiddings implements Bindings {
  @override
  void dependencies() {
    Get.put(BerandaController());
  }
}