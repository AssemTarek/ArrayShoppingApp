class UserModel {
  bool? status;
  String? message;
  Data? data;

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = Data.fromJson(json["data"]);
  }
}

class Data {
  int? id;
  String? email;
  String? name;
  String? phone;
  String? token;

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    email = json["email"];
    name = json["name"];
    phone = json["phone"];
    token = json["token"];
  }
}
