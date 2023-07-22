import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/cupit/cupit.dart';
import 'package:flutter_application_3/cupit/newsStates.dart';
import 'package:flutter_application_3/modules/shop-app/cupit/shopcupit.dart';
import 'package:flutter_application_3/modules/shop-app/on_boarding/onporading.dart';
import 'package:flutter_application_3/layout/home_page_shop/layout_shop.dart';
import 'package:flutter_application_3/modules/shop-app/login%20/log_in.dart';
import 'package:flutter_application_3/network/local/shared_preferance.dart';
import 'package:flutter_application_3/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constents/contents.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: await_only_futures
  await CacheHelper.init;
  DioHelper.init();
  Widget widget;

  bool? dark = CacheHelper.getData(key: 'isDark');
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  print(onBoarding);
  //token = CacheHelper.getData(key:'token');

  if (onBoarding != null) {
    if (token != null) {
      widget = homeshop();
    } else {
      widget = logInShop();
    }
  } else {
    widget = onpoarding();
  }
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  final Widget startwidget;
  // bool? isDark;
  MyApp(this.startwidget);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => appCupit()..currentindex),
        BlocProvider(
            create: (context) => shopcupit()
              ..getHomeData()
              ..getCategorisData()
              ..getFavorites()
              ..getuserdata()
              ..getCategorisData()),
      ],
      child: BlocConsumer<appCupit, newsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData(
              scaffoldBackgroundColor: Colors.grey,
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white),
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
                systemOverlayStyle:
                    SystemUiOverlayStyle(statusBarColor: Colors.white),
                backgroundColor: Colors.grey,
                elevation: 0.0,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Color.fromARGB(255, 182, 77, 45),
              ),
            ),
            themeMode: ThemeMode.system,
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.black),
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Color.fromARGB(255, 182, 77, 45),
                )),
            home: startwidget,
          );
        },
      ),
    );
  }
}
