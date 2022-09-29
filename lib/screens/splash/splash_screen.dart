import 'package:banky/app/widgets/splash_carousel_view.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        right: true,
        bottom: true,
        left: true,
        child: Scaffold(
          body: buildBody(),
        ));
  }

  Widget buildBody() {
    return Padding(
        padding: const EdgeInsets.all(1.0), child: SplashCarouselView());
  }
}
