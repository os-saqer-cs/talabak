import 'package:flutter/cupertino.dart';

class settingScreen extends StatelessWidget {
  const settingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Setting Screen',
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    ));
  }
}
