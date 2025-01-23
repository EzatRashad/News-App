import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/colors.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    primaryColor: Colors.white,
    canvasColor: Colors.white,
    indicatorColor: Colors.teal,
    dividerColor: Colors.blueGrey,
    useMaterial3: false, // لضمان أن اللون الافتراضي للأجزاء المتداخلة هو الأبيض
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.teal,
      titleTextStyle: AppStyles.appBarTitleStyle,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50.r),
        ),
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white, // تحديد لون الخلفية للـ Drawer
    ),
  );

  static final ThemeData dark = ThemeData(
    primaryColor: Colors.black,
    canvasColor: Colors.black,
    indicatorColor: Colors.blueAccent,
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueAccent,
      titleTextStyle: AppStyles.appBarTitleStyle,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50.r),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white, // لون الأيقونات في الوضع الداكن
        size: 30,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white, // تحديد لون الخلفية للـ Drawer
    ),
  );
}

class AppStyles {
  static TextStyle appBarTitleStyle = GoogleFonts.exo(
      fontWeight: FontWeight.w400, fontSize: 22.sp, color: ColorsManager.white);
  static TextStyle drawerTitleStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w700, fontSize: 24.sp, color: ColorsManager.white);
  static TextStyle categoriesTitleStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w700, fontSize: 24.sp, color: ColorsManager.black);
  static TextStyle settingsTitleStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w700, fontSize: 20.sp, color: ColorsManager.black);
  static TextStyle categoryTitle = GoogleFonts.exo(
      fontWeight: FontWeight.w400, fontSize: 22.sp, color: ColorsManager.white);
}
