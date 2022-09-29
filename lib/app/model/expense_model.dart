class ExpenseModel {
  int? expenseId;
  int? cardId;
  String? storeName;
  String? storeType;
  double? price;
  DateTime? date;

  ExpenseModel(
      {this.expenseId,
      this.cardId,
      this.storeName,
      this.storeType,
      this.price,
      this.date});
}
