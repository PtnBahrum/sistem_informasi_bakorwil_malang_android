import 'package:get/get.dart';
import 'package:sistem_informasi_bakorwil_malang/moduls/features/mobile/berita/controllers/berita_controller.dart';

class BeritaBiddings implements Bindings {
  @override
  void dependencies() {
    Get.put(BeritaController());
  }
}
