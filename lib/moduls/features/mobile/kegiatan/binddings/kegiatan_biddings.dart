import 'package:get/get.dart';
import '../controllers/kegiatan_controller.dart';

class KegiatanBiddings implements Bindings {
  @override
  void dependencies() {
    Get.put(KegiatanController());
  }
}
