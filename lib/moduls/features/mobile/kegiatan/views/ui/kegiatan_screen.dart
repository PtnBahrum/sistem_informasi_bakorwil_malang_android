import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sistem_informasi_bakorwil_malang/configs/assets/svg/main_svg.dart';
import 'package:sistem_informasi_bakorwil_malang/configs/theme/main_color.dart';
import '../components/custom_botton.dart';

class KegiatanScreen extends StatefulWidget {
  const KegiatanScreen({super.key});

  @override
  State<KegiatanScreen> createState() => _KegiatanScreenState();
}

class _KegiatanScreenState extends State<KegiatanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F3F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Kegiatan',
          style: GoogleFonts.poppins(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: MainColor.neutral_900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
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
      ),
    );
  }
}
