import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/model/shop_app/get_favorites.dart';
import 'package:flutter_application_3/modules/shop-app/cupit/sates.dart';
import 'package:flutter_application_3/modules/shop-app/cupit/shopcupit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class favoritshop extends StatelessWidget {
  const favoritshop({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>shopcupit()..getFavorites(),
      child: BlocConsumer<shopcupit, shopstates>(
          listener: (context, state) {},
          builder: (context, state) {

            return ConditionalBuilder(condition: shopcupit.get(context).getFavoritesData != null,
                builder: (context)=>Scaffold(
                    body: ListView.separated(
                      itemBuilder: (context, index) => buildfav(shopcupit.get(context).getFavoritesData?.data?.data?[index]
                          ,
                          context),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 12.0,
                      ),
                      itemCount:
                      ( shopcupit.get(context).getFavoritesData!.data!.data!.length),
                    )),
                fallback: (context) => Center(child: CircularProgressIndicator()));
          }),
    );
  }
}

Widget buildfav( Data? model, context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        height: 120.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image(
                    image: NetworkImage(
                      '${model?.product?.image}',
                    ),
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.fill,
                  ),
                  if (model?.product?.discount != 0)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      color: Colors.red,
                      child: Text(
                        'Discount',
                        style: TextStyle(color: Colors.white, fontSize: 10.0),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${model?.product?.name}',
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        '${model?.product?.price.toString()}',
                        style:
                            TextStyle(fontSize: 10.0, color: Colors.deepOrange),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      if (model?.product?.discount != 0)
                        Text(
                          '${model?.product?.discount}',
                          style: TextStyle(
                              fontSize: 8.0,
                              decoration: TextDecoration.lineThrough),
                        ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            // shopcupit.get(context).addfavorites(model.id!);
                            // print(model.id);
                          },
                          icon: CircleAvatar(
                              radius: 15.0,
                              backgroundColor: Colors.deepOrange,
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              )))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
