import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sistem_informasi_bakorwil_malang/configs/theme/main_color.dart';
import 'package:sistem_informasi_bakorwil_malang/configs/theme/main_theme.dart';

class CustomMenuButton extends StatelessWidget {
  final String text;
  final String svgPath;
  final Function onPressed;

  const CustomMenuButton({
    Key? key,
    required this.text,
    required this.svgPath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          color: MainColor.primary_300,
          elevation: 2,
          borderRadius: BorderRadius.circular(5),
          shadowColor: Colors.grey,
          child: InkWell(
            onTap: () => onPressed,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
              child: SvgPicture.asset(
                svgPath,
                width: 24,
                height: 24,
                color: MainColor.neutral_50,
              ),
            ),
          ),
        ),
        SizedBox(height: 9),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 9.sp,
            fontWeight: FontWeight.normal,
            color: MainColor.neutral_900,
          ),
        )
      ],
    );
  }
}
