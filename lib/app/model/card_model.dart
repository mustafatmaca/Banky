import 'package:banky/app/model/expense_model.dart';
import 'package:flutter/cupertino.dart';

class CardModel {
  int? cardId;
  int? userId;
  Color? cardColor;
  String? cardName;
  String? paymentSystem;
  String? expirationDate;
  int? lastFourDigit;
  List<ExpenseModel>? expenses;

  CardModel(
      {this.cardId,
      this.userId,
      this.cardColor,
      this.cardName,
      this.paymentSystem,
      this.expirationDate,
      this.lastFourDigit,
      this.expenses});
}
