import 'package:flutter/material.dart';

import 'package:flutter_application_3/modules/shop-app/cupit/sates.dart';
import 'package:flutter_application_3/modules/shop-app/cupit/shopcupit.dart';
import 'package:flutter_application_3/modules/shop-app/search/search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class homeshop extends StatelessWidget {
  const homeshop({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shopcupit, shopstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cupit = shopcupit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => searchshop()));
                    },
                    icon: Icon(Icons.search))
              ],
              title: Text(
                'talabk',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
            ),
            body: cupit.bottomScreen[cupit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                cupit.changeindex(value);
              },
              currentIndex: cupit.currentIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.apps), label: 'Categories'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'favorite'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Setting'),
              ],
            ),
          );
        });
  }
}
