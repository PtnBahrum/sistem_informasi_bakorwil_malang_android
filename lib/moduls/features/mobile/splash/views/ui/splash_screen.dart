import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sistem_informasi_bakorwil_malang/configs/assets/images/main_image.dart';
import 'package:sistem_informasi_bakorwil_malang/configs/route/main_route.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    // Buat variabel flag untuk menandai apakah navigasi sudah dilakukan
    bool navigated = false;

    return Scaffold(
      body: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: AnimatedOpacity(
                  opacity: 1,
                  duration: const Duration(seconds: 2),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 120.0),
                    child: Image.asset(MainImage.app_logo),
                  ),
                ),
              ),
            );
          }

          // Jika sudah selesai, dan navigasi belum dilakukan, lakukan navigasi
          if (!navigated) {
            navigated = true; // Set flag navigasi menjadi true
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Get.offAllNamed(MainRoute.initial);
            });
          }

          // Kembalikan widget loading
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: AnimatedOpacity(
                opacity: 0,
                duration: const Duration(seconds: 2),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 64.0),
                  child: Column(
                    children: [
                      Image.asset(MainImage.app_logo),
                      const SizedBox(
                        height: 8.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
