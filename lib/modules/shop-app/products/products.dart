import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/cupit/cupit.dart';

import 'package:flutter_application_3/models/model/shop_app/categories_model.dart';
import 'package:flutter_application_3/models/model/shop_app/home_model.dart';
import 'package:flutter_application_3/modules/shop-app/cupit/sates.dart';
import 'package:flutter_application_3/modules/shop-app/cupit/shopcupit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class productshop extends StatelessWidget {
  const productshop({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shopcupit,shopstates>(
      listener:(context,state){} ,
      builder: (context,state){
        return Scaffold(
          //appBar: AppBar(),
            body: ConditionalBuilder(
                condition: shopcupit.get(context).model != null &&
                    shopcupit.get(context).catmodel != null,
                builder: (context) => productsBuilder(
                    (shopcupit.get(context).model!),
                    (shopcupit.get(context).catmodel!),
                    context),
                fallback: (context) => Center(child: CircularProgressIndicator())));
      }
    );
  }
}

Widget productsBuilder(HomeModel model, CategoriesModel catmodel, context) =>
    Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                items: model.data?.banners
                    .map((e) => Image(
                          image: NetworkImage('${e.image}'),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ))
                    .toList(),
                options: CarouselOptions(
                    height: 200.0,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    initialPage: 0,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayAnimationDuration: Duration(seconds: 2),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal)),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 100.0,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            buildcat(catmodel.data!.data[index]!),
                        separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),
                        itemCount: (catmodel?.data?.data.length)!),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'New Product',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              color: Colors.grey,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 1 / 1.56,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(
                    model.data!.products.length,
                    (index) =>
                        buildGridProduct(model.data!.products[index], context)),
              ),
            ),
          ],
        ),
      ),
    );
Widget buildGridProduct(Homeproductsmodel model, BuildContext context) =>
    Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image(
                image: NetworkImage(
                  (model.image)!,
                ),
                width: double.infinity,
                height: 200.0,
                // fit: BoxFit.fill,
              ),
              if (model.discount != 0)
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
          Text(
            '${model.name}',
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              Text(
                '${model.price.round()}',
                style: TextStyle(fontSize: 10.0, color: Colors.deepOrange),
              ),
              SizedBox(
                width: 5.0,
              ),
              if (model.discount != 0)
                Text(
                  '${model.oldprice}',
                  style: TextStyle(
                      fontSize: 8.0, decoration: TextDecoration.lineThrough),
                ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    shopcupit.get(context).addfavorites(model.id!);
                    print(model.id);
                  },
                  icon: CircleAvatar(
                      radius: 15.0,
                      backgroundColor: shopcupit.get(context).isfav[model.id]!
                          ? Colors.deepOrange
                          : Colors.grey,
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      )))
            ],
          )
        ],
      ),
    );
Widget buildcat(DataModel catmodel) => Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image(
          image: NetworkImage(catmodel.image!),
          height: 100,
          width: 100,
          fit: BoxFit.fill,
        ),
        Container(
          width: 100.0,
          color: Colors.black.withOpacity(.8),
          child: Text(
            catmodel.name!,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
