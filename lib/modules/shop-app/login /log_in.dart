import 'package:flutter/material.dart';
import 'package:flutter_application_3/constents/contents.dart';
import 'package:flutter_application_3/layout/home_page_shop/layout_shop.dart';
import 'package:flutter_application_3/modules/shop-app/login%20/cupit/cupit.dart';
import 'package:flutter_application_3/modules/shop-app/login%20/cupit/states.dart';
import 'package:flutter_application_3/modules/shop-app/register_shop/register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../network/local/shared_preferance.dart';

// ignore: camel_case_types, must_be_immutable
class logInShop extends StatelessWidget {
  logInShop({super.key});
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var email = TextEditingController();
    var Password = TextEditingController();
    return BlocProvider(
      create: (context) => logInCupit(),
      child: BlocConsumer<logInCupit, ShopLoginStates>(
        listener: (BuildContext context, Object? state) {
          if (state is logInSuccesslState) {
            if ((state.modell?.status)!) {
              Fluttertoast.showToast(
                  msg: (state.modell?.message)!,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);

              token = CacheHelper.getData(key: 'token');
              print(token);
              CacheHelper.savedata(
                      key: 'token', value: (state.modell?.data?.token))
                  .then((value) {
                print(value);
              });
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => homeshop(),
                  ),
                  (route) => false);
            } else {
              Fluttertoast.showToast(
                  msg: (state.modell?.message)!,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
        },
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefix: Icon(Icons.email),
                            labelText: 'Email',
                            hintText: 'Enter your email',
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: Password,
                          onFieldSubmitted: (value) {
                            if (formkey.currentState!.validate()) {
                              logInCupit.get(context).loginScreen(
                                    email: email.text,
                                    password: Password.text,
                                  );
                            }
                          },
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefix: Icon(Icons.password),
                            labelText: 'Password',
                            hintText: 'Enter your Password',
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 40.0,
                          child: MaterialButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                logInCupit.get(context).loginScreen(
                                      email: email.text,
                                      password: Password.text,
                                    );
                              }
                            },
                            child: Text(
                              'Log in',
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'don\'t have account??',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterShopScreen()));
                                },
                                child: Text(
                                  'register now',
                                  style: TextStyle(color: Colors.deepOrange),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
