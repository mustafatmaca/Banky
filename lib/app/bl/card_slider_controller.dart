import 'package:banky/app/model/expense_model.dart';
import 'package:get/get.dart';

class CardSliderController extends GetxController {
  List<ExpenseModel> expenseList = <ExpenseModel>[
    ExpenseModel(
      cardId: 1,
      storeName: "Amazon",
      storeType: "E-Commerce",
      price: 21.2,
      date: DateTime.utc(2022, 9, 20),
    ),
    ExpenseModel(
      cardId: 1,
      storeName: "Apple Store",
      storeType: "Technology",
      price: 199.9,
      date: DateTime.utc(2022, 8, 12),
    ),
    ExpenseModel(
      cardId: 1,
      storeName: "Carrefour",
      storeType: "Market",
      price: 59.9,
      date: DateTime.utc(2022, 8, 30),
    ),
    ExpenseModel(
      cardId: 1,
      storeName: "Uber",
      storeType: "Transport",
      price: 5.5,
      date: DateTime.utc(2022, 8, 30),
    ),
  ];

  List<ExpenseModel> expenseList2 = <ExpenseModel>[
    ExpenseModel(
      cardId: 1,
      storeName: "Amazon",
      storeType: "E-Commerce",
      price: 25,
      date: DateTime.utc(2022, 9, 20),
    ),
    ExpenseModel(
      cardId: 1,
      storeName: "Apple Store",
      storeType: "Technology",
      price: 1000,
      date: DateTime.utc(2022, 9, 12),
    ),
    ExpenseModel(
      cardId: 1,
      storeName: "Carrefour",
      storeType: "Market",
      price: 59.9,
      date: DateTime.utc(2022, 8, 30),
    ),
    ExpenseModel(
      cardId: 1,
      storeName: "Uber",
      storeType: "Transport",
      price: 5.5,
      date: DateTime.utc(2022, 8, 30),
    ),
  ];

  var index = 0.obs;
}
