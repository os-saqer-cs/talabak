import 'package:flutter/material.dart';
import 'package:flutter_application_3/cupit/cupit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cupit/newsStates.dart';

class newsScreen extends StatelessWidget {
  const newsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appCupit(),
      child: BlocConsumer<appCupit, newsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cupit = appCupit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text('News App'),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                      cupit.switchmode();
                    },
                    icon: Icon(Icons.dark_mode))
              ],
            ),
            body: cupit.listscreens[cupit.currentindex],
            bottomNavigationBar: BottomNavigationBar(
              items: cupit.screens,
              currentIndex: cupit.currentindex,
              onTap: (index) {
                cupit.changIndex(index);
              },
            ),
          );
        },
      ),
    );
  }
}
