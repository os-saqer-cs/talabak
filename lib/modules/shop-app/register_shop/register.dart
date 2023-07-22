import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/model/shop_app/register.dart';
import 'package:flutter_application_3/modules/shop-app/cupit/sates.dart';
import 'package:flutter_application_3/modules/shop-app/cupit/shopcupit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constents/contents.dart';
import '../../../layout/home_page_shop/layout_shop.dart';
import '../../../network/local/shared_preferance.dart';
import '../login /log_in.dart';

class RegisterShopScreen extends StatelessWidget {
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var phone = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shopcupit, shopstates>(listener: (context, state) {
      if (state is PostUserDatasessuccessState) {
        if (state == true) {
          Fluttertoast.showToast(
              msg: (shopcupit.get(context).UserData?.message)!,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);

          token = CacheHelper.getData(key: 'token');
          print(token);
          CacheHelper.savedata(
                  key: 'token',
                  value: (shopcupit.get(context).registerUser?.data?.token))
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
              msg: (shopcupit.get(context).UserData?.message)!,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Register Screen'),
        ),
        body: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your email';
                  }
                  return null;
                },
                controller: name,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Name'),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your email';
                  }
                  return null;
                },
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Email'),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your email';
                  }
                  return null;
                },
                controller: password,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('password'),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your email';
                  }
                  return null;
                },
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('phone'),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                height: 50.0,
                child: MaterialButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      shopcupit.get(context).Register(
                          name: name.text,
                          email: email.text,
                          phone: phone.text,
                          password: password.text);
                      if (shopcupit.get(context).registerUser?.status == true) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => logInShop(),
                            ),
                            (route) => false);
                      }
                    }
                  },
                  child: Text('Register'),
                  color: Colors.deepOrange,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
