import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColor.mainBlue,
      primaryColorLight: AppColor.mainBlue,
      primaryColorDark: AppColor.mainBlue,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: AppColor.mainWhite),
          backgroundColor: AppColor.mainBlue,
          titleTextStyle: TextStyle(
              color: AppColor.mainWhite,
              fontSize: 16,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w800)),
      scaffoldBackgroundColor: AppColor.mainBlue,
      cardColor: AppColor.mainOrange,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.mainOrange,
        elevation: 8,
        selectedItemColor: AppColor.mainBlue,
        unselectedItemColor: AppColor.mainWhite,
      ),
      iconTheme: IconThemeData(color: AppColor.mainWhite),
      fontFamily: 'Raleway',
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        primary: const Color(0xFFF9A826),
        onPrimary: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        fixedSize: const Size(350, 50),
      )),
      buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          buttonColor: AppColor.mainOrange),
      textTheme: ThemeData.light().textTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppColor.mainBlue,
      primaryColorLight: AppColor.mainBlue,
      primaryColorDark: AppColor.mainBlue,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: AppColor.mainBlue),
          backgroundColor: AppColor.mainWhite,
          titleTextStyle: TextStyle(
              color: AppColor.mainBlue,
              fontSize: 16,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w800)),
      scaffoldBackgroundColor: AppColor.mainBlue,
      cardColor: AppColor.mainOrange,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.mainOrange,
        elevation: 8,
        selectedItemColor: AppColor.mainBlue,
        unselectedItemColor: AppColor.mainBlack,
      ),
      iconTheme: IconThemeData(color: AppColor.mainBlack),
      fontFamily: 'Raleway',
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        primary: const Color(0xFFF9A826),
        onPrimary: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        fixedSize: const Size(350, 50),
      )),
      buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          buttonColor: AppColor.mainOrange),
      textTheme: ThemeData.dark().textTheme,
    );
  }
}
