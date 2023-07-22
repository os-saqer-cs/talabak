import 'package:flutter_application_3/models/model/shop_app/login_models.dart';

abstract class ShopLoginStates {}

class logInInitialState extends ShopLoginStates {}

class logInLoadinglState extends ShopLoginStates {}

class logInSuccesslState extends ShopLoginStates {
  final ShopLogInModel? modell;
  logInSuccesslState(this.modell);
}

class logInErrorState extends ShopLoginStates {
  final String error;
  logInErrorState(this.error);
}
