import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sistem_informasi_bakorwil_malang/configs/theme/main_color.dart';

import '../../../../../../shared/widgets/drawer.dart';

class BeritaScreen extends StatelessWidget {
  const BeritaScreen({Key? key});

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
      body: Center(
        child: Text('Ini berita'),
      ),
    );
  }
}
