class HomeModel {
  bool? status;
  HomeDataModel? data;

  HomeModel.formjson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? HomeDataModel.formjson(json['data']) : null;
  }
}

class HomeDataModel {
  List<Homeproductsmodel> products = [];
  List<HomebannersModel> banners = [];

  HomeDataModel.formjson(Map<String, dynamic> json) {
    json['banners'].forEach((element) {
      banners.add(HomebannersModel.formjson(element));
    });
    json['products'].forEach((element) {
      products.add(Homeproductsmodel.formjson(element));
    });
  }
}

class Homeproductsmodel {
  int? id;
  dynamic price;
  dynamic oldprice;
  dynamic discount;
  String? image;
  String? name;
  bool? infavorites;
  bool? incart;
  Homeproductsmodel.formjson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldprice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    infavorites = json['in_favorites'];
    incart = json['in_cart'];
  }
}

class HomebannersModel {
  int? id;
  String? image;
  HomebannersModel.formjson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}
