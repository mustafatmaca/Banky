import 'package:banky/app/themes/app_color.dart';
import 'package:banky/app/themes/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  final appThemeController = Get.put(AppThemeController());

  SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        right: true,
        bottom: true,
        left: true,
        child: Scaffold(
          appBar: buildAppBar(),
          body: buildBody(context),
        ));
  }

  buildAppBar() {
    return AppBar(
      title: const Text("Settings"),
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new)),
      elevation: 0,
    );
  }

  buildBody(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.52,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Obx(() => SwitchListTile(
                        tileColor: AppColor.mainWhite,
                        title: const Text("Dark Mode"),
                        value: appThemeController.isDark.value,
                        onChanged: (bool newValue) {
                          appThemeController.isDark.value = newValue;
                        })),
                    ListTile(
                      tileColor: AppColor.mainWhite,
                      title: const Text("Log Out"),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                      onTap: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
