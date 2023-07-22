class CategoriesModel {
  bool? status;
  CategoriesDatamodel? data;
  CategoriesModel.formjson(Map<String, dynamic> json) {
    status = json['status'];
    data = CategoriesDatamodel.formjson(json['data']);
  }
}

class CategoriesDatamodel {
  int? current_page;
  List<DataModel?> data = [];

  CategoriesDatamodel.formjson(Map<String, dynamic> json) {
    current_page = json['current_page'];
    json['data'].forEach((element) {
      data.add(DataModel.formjson(element));
    });
  }
}

class DataModel {
  int? id;
  String? name;
  String? image;

  DataModel.formjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
