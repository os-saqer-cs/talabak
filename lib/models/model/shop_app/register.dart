class RegisterUser {
  bool? status;
  String? message;
  Data? data;
  RegisterUser.formjson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.formjson(json['data']);
  }
}

class Data {
  String? name;
  String? email;
  String? phone;
  int? id;
  String? image;
  String? token;
  Data.formjson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    id = json['id'];
    image = json['image'];
    token = json['token'];
  }
}
