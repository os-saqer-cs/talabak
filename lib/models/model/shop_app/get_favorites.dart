
class GetfavoritesModel {
  bool? status;

  Dataa? data;



  GetfavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    data = json['data'] != null ? new Dataa.fromJson(json['data']) : null;
  }

}

class Dataa {
  dynamic? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  dynamic? from;
  dynamic? lastPage;
  String? lastPageUrl;

  String? path;
  dynamic? perPage;

  dynamic? to;
  dynamic? total;



  Dataa.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];

    path = json['path'];
    perPage = json['per_page'];

    to = json['to'];
    total = json['total'];
  }


}

class Data {
  int? id;
  Product? product;



  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }


}

class Product {
  dynamic? id;
  dynamic? price;
  dynamic? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;



  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

}