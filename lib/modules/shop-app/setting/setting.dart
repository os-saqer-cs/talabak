import 'package:flutter/material.dart';
import 'package:flutter_application_3/modules/shop-app/cupit/sates.dart';
import 'package:flutter_application_3/modules/shop-app/cupit/shopcupit.dart';
import 'package:flutter_application_3/modules/shop-app/login%20/log_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class shopSetting extends StatelessWidget {
  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shopcupit, shopstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cupit = shopcupit.get(context).UserData;
        name.text = shopcupit.get(context).UserData!.data!.name.toString();
        email.text = (cupit?.data)!.email.toString();
        phone.text = (cupit?.data)!.phone.toString();
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                controller: name,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Name'),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Email'),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              TextFormField(
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Phone'),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                width: double.infinity,
                height: 50.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => logInShop(),
                        ),
                        (route) => false);
                  },
                  child: Text('Logout'),
                  color: Colors.deepOrange,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
