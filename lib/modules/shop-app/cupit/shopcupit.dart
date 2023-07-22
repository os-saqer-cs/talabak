import 'package:flutter/material.dart';
import 'package:flutter_application_3/constents/contents.dart';
import 'package:flutter_application_3/models/model/shop_app/categories_model.dart';
import 'package:flutter_application_3/models/model/shop_app/home_model.dart';
import 'package:flutter_application_3/models/model/shop_app/register.dart';
import 'package:flutter_application_3/modules/shop-app/cateogries/cateogries.dart';
import 'package:flutter_application_3/modules/shop-app/cupit/sates.dart';
import 'package:flutter_application_3/modules/shop-app/favorites/favorites.dart';
import 'package:flutter_application_3/modules/shop-app/products/products.dart';
import 'package:flutter_application_3/modules/shop-app/setting/setting.dart';

import 'package:flutter_application_3/network/remote/dio_helper.dart';
import 'package:flutter_application_3/network/remote/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/model/shop_app/favorites_change.dart';
import '../../../models/model/shop_app/get_favorites.dart';
import '../../../models/model/shop_app/login_models.dart';
import '../../../models/model/shop_app/register.dart';

class shopcupit extends Cubit<shopstates> {
  shopcupit() : super(ShopinitialState());
  static shopcupit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomScreen = [
    productshop(),
    catecgriesShop(),
    favoritshop(),
    shopSetting(),
  ];
  void changeindex(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  Map<int, bool> isfav = {};
  HomeModel? model;
  void getHomeData() {
    emit(ShopLodingState());
    DioHelper.getdata(url: Home, query: null, token: token).then((value) {
      model = HomeModel.formjson(value?.data);

     // print(model?.data?.products[0].infavorites);

      model?.data?.products.forEach(
        (val) {
          isfav.addAll({
            (val.id)!: (val.infavorites)!,
          });
        },
      );
      //print(isfav.toString());

      emit(ShopsuccessState());
    }).catchError((error) {
     // print('${error.toString()} ');

      emit(ShopErrorState());
    });
  }

  CategoriesModel? catmodel;
  void getCategorisData() {
    emit(categoriesLodingState());
    DioHelper.getdata(url: categories).then((value) {
      catmodel = CategoriesModel.formjson(value?.data);
      //print('hhhhh${value?.data}');
      emit(categoriessuccessState());
    }).catchError((error) {
      //print(error.toString());
      emit(categoriesErrorState());
    });
  }

  FavoritesChange? favoritesChange;
  void addfavorites(int productid) {
    isfav[productid] = !(isfav[productid]!);
    emit(FavoritesessuccessState());
    DioHelper.postData(
            url: FAVORITES, data: {'product_id': productid}, token: token)
        .then((value) {
      favoritesChange = FavoritesChange.formjson(value.data);
      emit(FavoritesessuccessState());
      if (favoritesChange?.status == false) {
        isfav[productid] = !(isfav[productid]!);
      }
      //print(value.data.toString());
    }).catchError((error) {
      emit(FavoritesErrorState());
     // print(error.toString());
    });
  }

  GetfavoritesModel? getFavoritesData;
  void getFavorites() {

    DioHelper.getdata(url: FAVORITES, token: token).then((value) {
      getFavoritesData = GetfavoritesModel.fromJson(value?.data);
      emit(GetFavoritesessuccessState());
      print(getFavoritesData.toString());
    }).catchError((error) {
      emit(GetFavoritesErrorState());
      print(error.toString());

    });
  }

  ShopLogInModel? UserData;
  void getuserdata() {
    DioHelper.getdata(url: PROFILE, token: token).then((value) {
     // print(value.toString());
      UserData = ShopLogInModel.formJson(value?.data);
      emit(GetUserDatasessuccessState());
    }).catchError((error) {
     // print('error');
      emit(GetUserDataErrorState());
    });
  }

  RegisterUser? registerUser;
  void Register(
      {required String name,
      required String email,
      required String phone,
      required String password}) {
    DioHelper.postData(url: REGISTER, data: {
      'name': name.toString(),
      'email': email.toString(),
      'password': password.toString(),
      'phone': phone.toString()
    }).then((value) {
      registerUser = RegisterUser.formjson(value?.data);
      emit(PostUserDatasessuccessState());
     // print(value.data);
    }).catchError((error) {
     // print(error.toString());
      emit(PostUserDataErrorState());
    });
  }
}
