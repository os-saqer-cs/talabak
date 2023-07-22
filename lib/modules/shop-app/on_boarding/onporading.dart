//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/modules/shop-app/login%20/log_in.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.body, required this.image, required this.title});
}

class onpoarding extends StatefulWidget {
  @override
  State<onpoarding> createState() => _onpoardingState();
}

class _onpoardingState extends State<onpoarding> {
  bool isLast = false;

  var controller = PageController();

  List<BoardingModel> model = [
    BoardingModel(
        title: ' on board 1 title',
        image: 'images/on_poarding.png',
        body: 'on board 1 body'),
    BoardingModel(
        title: ' on board 2 title',
        image: 'images/on_poarding.png',
        body: 'on board 2 body'),
    BoardingModel(
        title: ' on board 3 title',
        image: 'images/on_poarding.png',
        body: 'on board 3 body'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: submit,
                child: Text(
                  'SKIP',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.deepOrange),
                ))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildboardingItem(model[index]),
                itemCount: model.length,
                onPageChanged: (int index) {
                  if (index == model.length - 1) {
                    setState(() {
                      isLast = true;
                      print('object');
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
              ),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: model.length,
                effect: ExpandingDotsEffect(
                  dotColor: Colors.deepOrange,
                  dotWidth: 10.0,
                  dotHeight: 5.0,
                  spacing: 6.0,
                  radius: 20.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      if (isLast) {
                        submit();
                      } else {
                        controller.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastEaseInToSlowEaseOut,
                        );
                      }
                    },
                    child: Icon(Icons.arrow_forward_ios),
                    backgroundColor: Colors.deepOrange,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            )
          ],
        ));
  }

  Widget buildboardingItem(BoardingModel model) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Image(image: AssetImage('${model.image}'))),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '${model.title}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '${model.body}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
            ),
            SizedBox(
              height: 50.0,
            )
          ],
        ),
      );
  void submit() {
    // CacheHelper.savedata(key: 'onBoarding', value: true).then((value) {
    //   if (value == true) {
    //     print(CacheHelper.getData(key: 'onBoarding'));
    //     print('osama');
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => logInShop(),
        ),
        (route) => false);
    // } else {
    // print('${}');
    // }
    // });
  }
}
