// ignore_for_file: must_be_immutable, sized_box_for_whitespace

import 'package:banky/app/model/card_model.dart';
import 'package:banky/app/model/expense_model.dart';
import 'package:banky/app/themes/app_color.dart';
import 'package:banky/app/widgets/expense_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

class DetailScreen extends StatelessWidget {
  CardModel cardModel;

  DetailScreen({Key? key, required this.cardModel}) : super(key: key);

  late final List<ExpenseModel>? expensesList = cardModel.expenses;

  late final List<ExpenseView> expenses = [
    ExpenseView(
      expenseModel: expensesList![0],
    ),
    ExpenseView(
      expenseModel: expensesList![1],
    ),
    ExpenseView(
      expenseModel: expensesList![2],
    ),
    ExpenseView(
      expenseModel: expensesList![3],
    ),
  ];

  late Map<String, double> dataMap = {
    expensesList![0].storeName!: expensesList![0].price!,
    expensesList![1].storeName!: expensesList![1].price!,
    expensesList![2].storeName!: expensesList![2].price!,
    expensesList![3].storeName!: expensesList![3].price!,
  };

  final List<Color> colorList = [
    AppColor.mainOrange,
    AppColor.mainBlack,
    const Color(0XFF007700),
    const Color(0XFF550000)
  ];

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
      title: const Text("Details"),
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
          color: AppColor.mainBlue,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          child: PieChart(
            dataMap: dataMap,
            centerText: calculateYearlySum().toString() + " \$",
            centerTextStyle: TextStyle(
                color: AppColor.mainWhite,
                fontSize: 18,
                fontWeight: FontWeight.w800),
            chartType: ChartType.ring,
            chartRadius: MediaQuery.of(context).size.width / 3.5,
            colorList: colorList,
            legendOptions: const LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.right,
              showLegends: false,
              legendShape: BoxShape.circle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: const ChartValuesOptions(
              showChartValueBackground: false,
              showChartValues: false,
              showChartValuesInPercentage: false,
              showChartValuesOutside: false,
              decimalPlaces: 1,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              color: AppColor.mainWhite,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            ),
          ),
        ),
        Positioned(
            bottom: 5,
            left: 5,
            right: 5,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.52,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: expenses.length,
                        itemBuilder: (context, index) {
                          return expenses[index];
                        }),
                  ],
                ),
              ),
            ))
      ],
    );
  }

  int calculateYearlySum() {
    var sum = 0;
    for (var i = 0; i < cardModel.expenses!.length; i++) {
      if (DateTime.now().year == cardModel.expenses!.asMap()[i]!.date!.year) {
        sum += cardModel.expenses!.asMap()[i]!.price!.toInt();
      }
    }
    return sum;
  }
}
