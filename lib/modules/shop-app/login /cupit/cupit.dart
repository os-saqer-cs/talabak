import 'package:flutter_application_3/modules/shop-app/login%20/cupit/states.dart';
import 'package:flutter_application_3/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/model/shop_app/login_models.dart';
import '../../../../network/remote/end_points.dart';

class logInCupit extends Cubit<ShopLoginStates> {
  logInCupit() : super(logInInitialState());
  static logInCupit get(context) => BlocProvider.of(context);
  ShopLogInModel? loginmodel;
  void loginScreen({required String email, required String password}) {
    emit(logInLoadinglState());

    DioHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      loginmodel = ShopLogInModel.formJson(value.data);
      emit(logInSuccesslState(loginmodel));
    }).catchError((error) {
      emit(logInErrorState(error.toString()));
    });
  }
}
