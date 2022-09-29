// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeController extends GetxController {
  static const THEME_STATUS = "THEME_STATUS";

  setTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }

  late var isDark = false.obs;

  AppThemeProvider() {
    isDark.value = false;
    getPreferences();
  }

  getPreferences() async {
    isDark.value = await getTheme();
  }
}
