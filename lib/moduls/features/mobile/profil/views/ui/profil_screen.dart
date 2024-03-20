import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sistem_informasi_bakorwil_malang/configs/assets/images/main_image.dart';
import 'package:sistem_informasi_bakorwil_malang/configs/assets/svg/main_svg.dart';
import 'package:sistem_informasi_bakorwil_malang/moduls/features/mobile/profil/views/components/custom_botton.dart';

import '../../../../../../configs/theme/main_color.dart';
import '../../../../../../shared/widgets/drawer.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bakorwil III',
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: MainColor.neutral_900,
              ),
            ),
            Text(
              'Malang',
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: MainColor.neutral_900,
              ),
            ),
          ],
        ),
        leading: Padding(
          padding: EdgeInsets.only(
            left: 8.sp,
            top: 8.sp,
            bottom: 8.sp,
          ),
          child: Image.asset('assets/images/ic_bakorwil.png'),
        ),
      ),
      endDrawer: DrawerWidget(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(MainImage.bg_bakorwil),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      MainImage.bakorwil_logo,
                      width: 80,
                      height: 80,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Bakorwil III Malang',
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  CustomButton(
                    text: 'Sejarah',
                    svgPath: MainSvg.history,
                    svgColor: Color(0xFF007AAE),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomButton(
                    text: 'Kepegawaian',
                    svgPath: MainSvg.employee,
                    svgColor: Color(0xFFFFE500),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomButton(
                    text: 'Wilayah Kerja',
                    svgPath: MainSvg.state,
                    svgColor: Color(0xFF007C0C),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomButton(
                    text: 'Setting',
                    svgPath: MainSvg.setting,
                    svgColor: Color(0xFF8020E0),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
