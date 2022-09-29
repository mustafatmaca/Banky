import 'package:banky/app/model/card_model.dart';

class UserModel {
  int? userId;
  String? name;
  String? surname;
  String? identityNumber;
  String? password;
  List<CardModel>? cards;

  UserModel(
      {this.userId,
      this.name,
      this.surname,
      this.identityNumber,
      this.password,
      this.cards});
}
