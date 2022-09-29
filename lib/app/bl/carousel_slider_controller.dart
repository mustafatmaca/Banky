import 'package:get/get.dart';

class CarouselSliderController extends GetxController {
  List<String> images = [
    'assets/images/credit_card.svg',
    'assets/images/online_payments.svg',
    'assets/images/transfer_money.svg',
  ];

  List<String> texts = [
    "You Can Check Your Credit Cards",
    "Pay The Online Payments",
    "Transfer Money"
  ];

  var currentPosition = 0.obs;
}
