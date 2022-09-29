import 'package:banky/app/bl/card_slider_controller.dart';
import 'package:banky/app/model/card_model.dart';
import 'package:banky/app/themes/app_color.dart';
import 'package:banky/screens/details/details_screen.dart';
import 'package:banky/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final cardSliderController = Get.put(CardSliderController());

  final iconList = <IconData>[
    Icons.home_filled,
    Icons.credit_card,
    Icons.settings_applications_sharp
  ];

  late final cardList = <CardModel>[
    CardModel(
        userId: 1,
        cardColor: const Color(0xFFFF0000),
        cardName: "MyCard1",
        paymentSystem: "MasterCard",
        expirationDate: "09/22",
        lastFourDigit: 3838,
        expenses: cardSliderController.expenseList),
    CardModel(
        userId: 1,
        cardColor: const Color(0xFFFFC144),
        cardName: "MyCard2",
        paymentSystem: "MasterCard",
        expirationDate: "10/22",
        lastFourDigit: 4242,
        expenses: cardSliderController.expenseList2),
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        right: true,
        bottom: true,
        left: true,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: buildBody(context),
        ));
  }

  buildAppBar() {
    return AppBar(
      title: const Text("Banky"),
      centerTitle: true,
      automaticallyImplyLeading: false,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {
              Get.to(SettingScreen());
            },
            icon: const Icon(Icons.settings_outlined))
      ],
    );
  }

  buildBody(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColor.mainWhite,
        ),
        Positioned(
            top: 0,
            left: 0,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                    color: AppColor.mainBlue,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))))),
        Positioned(
          child: SizedBox(
            height: 300,
            child: PageView.builder(
              itemCount: 2,
              controller: PageController(viewportFraction: 0.5),
              onPageChanged: (int index) =>
                  {cardSliderController.index.value = index},
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Card(
                    color: cardList[i].cardColor,
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                "assets/images/card_chip.svg",
                                fit: BoxFit.scaleDown,
                              ),
                              Text(
                                  "**** **** **** ${cardList[i].lastFourDigit}")
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    cardList[i].cardName.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 18),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(cardList[i].expirationDate.toString()),
                                  SvgPicture.asset(
                                    "assets/images/master_logo.svg",
                                    fit: BoxFit.scaleDown,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
            top: MediaQuery.of(context).size.height * 0.47,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Expenses",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                        InkWell(
                          child: const Text("See Detail",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              )),
                          onTap: () {
                            Get.to(DetailScreen(
                                cardModel: cardList[
                                    cardSliderController.index.value]));
                          },
                        )
                      ],
                    ),
                    Obx(() => Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: AppColor.mainBlue,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "This Month Total Expenses",
                                style: TextStyle(
                                    color: AppColor.mainWhite,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                calculateMonthlySum().toString() + " \$",
                                style: TextStyle(
                                  color: AppColor.mainWhite,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        )),
                    Obx(() => Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: AppColor.mainBlue,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "This Year Total Expenses",
                                style: TextStyle(
                                    color: AppColor.mainWhite,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                calculateYearlySum().toString() + " \$",
                                style: TextStyle(
                                  color: AppColor.mainWhite,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ))
      ],
    );
  }

  int calculateMonthlySum() {
    var sum = 0;
    for (var i = 0;
        i < cardList[cardSliderController.index.value].expenses!.length;
        i++) {
      if (DateTime.now().month ==
          cardList[cardSliderController.index.value]
              .expenses!
              .asMap()[i]!
              .date!
              .month) {
        sum += cardList[cardSliderController.index.value]
            .expenses!
            .asMap()[i]!
            .price!
            .toInt();
      }
    }
    return sum;
  }

  int calculateYearlySum() {
    var sum = 0;
    for (var i = 0;
        i < cardList[cardSliderController.index.value].expenses!.length;
        i++) {
      if (DateTime.now().year ==
          cardList[cardSliderController.index.value]
              .expenses!
              .asMap()[i]!
              .date!
              .year) {
        sum += cardList[cardSliderController.index.value]
            .expenses!
            .asMap()[i]!
            .price!
            .toInt();
      }
    }
    return sum;
  }
}
