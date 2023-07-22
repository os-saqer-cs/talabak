import 'package:flutter/material.dart';
import 'package:flutter_application_3/cupit/newsStates.dart';
import 'package:flutter_application_3/modules/app/businessscreen.dart';
import 'package:flutter_application_3/modules/app/science_screen.dart';
import 'package:flutter_application_3/modules/app/sport_screen.dart';
import 'package:flutter_application_3/network/local/shared_preferance.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class appCupit extends Cubit<newsStates> {
  appCupit() : super(NewsInitialstat());
  static appCupit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> screens = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sport',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'scince',
    ),
  ];
  bool isDark = false;
  List<Widget> listscreens = [
    businessScreen(),
    sportScreen(),
    scienceScreen(),
  ];
  int currentindex = 0;
  void changIndex(int index) {
    currentindex = index;
    emit(newsBottomState());
  }

  void switchmode({bool? fromshared}) {
    if (fromshared != null) {
      isDark = fromshared;
      print(isDark);
    } else {
      isDark = !isDark;
      print(isDark);
    }
    CacheHelper.savedata(key: 'isDark', value: isDark).then((value) {
      print('hi');
      emit(switchmodestate());
    });
  }
}
