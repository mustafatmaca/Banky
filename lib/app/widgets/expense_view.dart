// ignore_for_file: constant_identifier_names, must_be_immutable

import 'package:banky/app/model/expense_model.dart';
import 'package:banky/app/themes/app_color.dart';
import 'package:flutter/material.dart';

enum month {
  Unknown,
  January,
  February,
  March,
  April,
  May,
  June,
  July,
  August,
  September,
  October,
  November,
  December
}

class ExpenseView extends StatelessWidget {
  ExpenseModel expenseModel;

  ExpenseView({Key? key, required this.expenseModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.13,
                decoration: BoxDecoration(
                  color: expenseModel.storeType == "Technology"
                      ? AppColor.mainBlack
                      : expenseModel.storeType == "E-Commerce"
                          ? AppColor.mainOrange
                          : expenseModel.storeType == "Transport"
                              ? const Color(0XFF550000)
                              : const Color(0XFF007700),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    expenseModel.storeName!,
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  Text(
                    month.values[expenseModel.date!.month]
                            .toString()
                            .split(".")
                            .last +
                        " " +
                        expenseModel.date!.day.toString(),
                    style: const TextStyle(color: Colors.black38),
                  ),
                ],
              ),
            ],
          ),
          Text(
            expenseModel.price!.toInt().toString() + " \$",
            style: const TextStyle(fontWeight: FontWeight.w800),
          )
        ],
      ),
    );
  }
}
