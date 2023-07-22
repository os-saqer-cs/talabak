import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/model/shop_app/categories_model.dart';
import 'package:flutter_application_3/models/model/shop_app/home_model.dart';
import 'package:flutter_application_3/modules/shop-app/cupit/sates.dart';
import 'package:flutter_application_3/modules/shop-app/cupit/shopcupit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class catecgriesShop extends StatelessWidget {
  const catecgriesShop({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shopcupit, shopstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cupit = shopcupit.get(context).catmodel;
        return Scaffold(
          body: ListView.separated(
              itemBuilder: (context, index) =>
                  CatBuilder(cupit.data!.data[index]!),
              separatorBuilder: (context, index) => SizedBox(
                    height: 5.0,
                  ),
              itemCount: cupit!.data!.data.length),
        );
      },
    );
  }
}

Widget CatBuilder(DataModel catmodel) => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(
          image: NetworkImage(catmodel.image!),
          width: 100.0,
          height: 100.0,
        ),
        SizedBox(
          width: 20.0,
        ),
        Text(
          (catmodel.name)!,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        Spacer(),
        IconButton(
            onPressed: () {}, icon: Icon(Icons.arrow_forward_ios_outlined))
      ],
    );
