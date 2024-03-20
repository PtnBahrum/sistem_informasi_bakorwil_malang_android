import 'package:get/get.dart';
import 'package:sistem_informasi_bakorwil_malang/configs/route/main_route.dart';
import 'package:sistem_informasi_bakorwil_malang/moduls/features/mobile/beranda/binddings/beranda_biddings.dart';
import 'package:sistem_informasi_bakorwil_malang/moduls/features/mobile/beranda/views/ui/beranda_screen.dart';
import 'package:sistem_informasi_bakorwil_malang/moduls/features/mobile/splash/binddings/splash_biddings.dart';
import 'package:sistem_informasi_bakorwil_malang/moduls/features/mobile/splash/views/ui/splash_screen.dart';
import 'package:sistem_informasi_bakorwil_malang/moduls/global_binddings/main_bindding.dart';
import '../../moduls/features/mobile/kalender/binddings/kalender_biddings.dart';
import '../../moduls/features/mobile/kalender/views/ui/kalender_screen.dart';
import '../../moduls/features/mobile/kegiatan/views/ui/kegiatan_screen.dart';
import '../../moduls/features/mobile/kegiatan/binddings/kegiatan_biddings.dart';
import '../../moduls/features/mobile/main_container.dart';
import '../../moduls/features/mobile/peta/binddings/peta_biddings.dart';
import '../../moduls/features/mobile/peta/views/ui/peta_screen.dart';
import '../../moduls/features/mobile/profil/views/ui/profil_screen.dart';
import '../../moduls/features/mobile/profil/binddings/profil_biddings.dart';

abstract class MainPage {
  static final main = [
    //Setup
    GetPage(
      name: MainRoute.splash,
      page: () => const SplashScreen(),
      binding: SplashBiddings(),
    ),
    GetPage(
      name: MainRoute.initial,
      page: () => MainContainer(),
      binding: MainBiddings(),
    ),
    GetPage(
        name: MainRoute.beranda,
        page: () => const BerandaScreen(),
        binding: BerandaBiddings()),
    GetPage(
      name: MainRoute.peta,
      page: () => const PetaScreen(),
      binding: PetaBiddings(),
    ),
    GetPage(
      name: MainRoute.kegiatan,
      page: () => const KegiatanScreen(),
      binding: KegiatanBiddings(),
    ),
    // GetPage(
    //   name: MainRoute.berita,
    //   page: () => const BeritaScreen(),
    //   binding: BeritaBiddings(),
    // ),
    GetPage(
      name: MainRoute.kalender,
      page: () => const KalenderScreen(),
      binding: KalenderBiddings(),
    ),
    GetPage(
      name: MainRoute.profil,
      page: () => const ProfilScreen(),
      binding: ProfilBiddings(),
    ),
  ];
}
