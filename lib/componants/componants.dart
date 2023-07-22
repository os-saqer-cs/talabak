import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget dfaultFormfild({
  required TextEditingController controller,
  required TextInputType type,
  required Function validate,
  required String label,
  required IconData icons,
  //Function? onsupmitted,
  //Function? onchanged,
}) =>
    TextFormField(
      onTap: () {
        print('print tap');
      },
      controller: controller,
      validator: (value) {
        return validate();
      },
      cursorColor: Colors.deepOrange,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icons),
        border: OutlineInputBorder(),
      ),
    );
// void navegateTo(
//   {Widget? screen,
//   BuildContext? context}
//   ) {
//   Navigator.push(context),
//  MaterialPageRoute(
//     builder: (context) => screen)
// }
