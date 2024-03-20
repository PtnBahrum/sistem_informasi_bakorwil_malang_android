import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sistem_informasi_bakorwil_malang/configs/theme/main_color.dart';

final ThemeData mainTheme = ThemeData(
  primaryColor: MainColor.white,
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSwatch(
    primaryColorDark: MainColor.primary_900,
    accentColor: MainColor.primary_500,
    cardColor: MainColor.white,
    errorColor: MainColor.error_700,
  ),
  iconTheme: IconThemeData(
    color: MainColor.primary_500,
    size: 24.sp,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
  ),
);
