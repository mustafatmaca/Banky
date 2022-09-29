import 'package:banky/app/bl/carousel_slider_controller.dart';
import 'package:banky/app/themes/app_color.dart';
import 'package:banky/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashCarouselView extends StatelessWidget {
  final carouselSliderController = Get.put(CarouselSliderController());

  final CarouselController _controller = CarouselController();

  SplashCarouselView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Builder(builder: (context) {
          return CarouselSlider(
              carouselController: _controller,
              items: carouselSliderController.images
                  .map((image) => SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              image,
                              fit: BoxFit.scaleDown,
                              height: MediaQuery.of(context).size.height * 0.7,
                            ),
                            Text(carouselSliderController.texts[
                                carouselSliderController.images
                                    .indexOf(image)]),
                          ],
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.8,
                viewportFraction: 1,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  carouselSliderController.currentPosition.value = index;
                },
              ));
        }),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: carouselSliderController.images.map((url) {
              int index = carouselSliderController.images.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        carouselSliderController.currentPosition.value == index
                            ? AppColor.mainOrange
                            : Colors.black45),
              );
            }).toList(),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        ElevatedButton(
          child: const Text('Start'),
          onPressed: () {
            Get.to(HomeScreen());
          },
        ),
      ],
    );
  }
}
