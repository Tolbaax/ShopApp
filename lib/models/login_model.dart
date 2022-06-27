class ShopLoginModel {
  bool? status;
  String? message;
  late UserData data;

  ShopLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = UserData.fromJson(json['data']);
  }
}

class UserData {
  dynamic id;
  dynamic name;
  dynamic email;
  dynamic phone;
  String? token;
  String? image;
  int? points;
  int? credit;

  // UserData({
  //   this.id,
  //   this.name,
  //   this.email,
  //   this.phone,
  //   this.image,
  //   this.points,
  //   this.credit,
  //   this.token,
  // });

  // named constructor

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    token = json['token'];
    image = json['image'];
    credit = json['credit'];
    phone = json['phone'];
    points = json['points'];
  }
}
