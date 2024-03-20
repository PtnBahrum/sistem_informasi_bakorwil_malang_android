import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sistem_informasi_bakorwil_malang/configs/theme/main_theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String svgPath;
  final Color svgColor;
  final Function onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.svgPath,
    required this.svgColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      shadowColor: Colors.grey, // Warna bayangan
      child: InkWell(
        onTap: () => onPressed, // Perhatikan perubahan di sini
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300), // Warna border
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgPath,
                width: 48,
                height: 48,
                color: svgColor,
              ),
              const SizedBox(width: 20),
              Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
