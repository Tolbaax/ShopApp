class CartModel {
  bool? status;
  String? message;
  CartData? data;

  CartModel(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? CartData.fromJson(json['data']) : null;
  }
}

class CartData {
  List<CartItems>? cartItems;
  dynamic subTotal;
  dynamic total;

  CartData.fromJson(Map<String, dynamic> json) {
    cartItems = json['cart_items'];
    subTotal = json['sub_total'];
    total = json['total'];
  }
}

class CartItems {
  dynamic id;
  dynamic quantity;
  CartProducts? product;

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product =
        json['product'] != null ? CartProducts.fromJson(json['product']) : null;
  }
}

class CartProducts {
  dynamic id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  bool? inFavorites;
  String? description;
  dynamic images;
  bool? inCart;

  CartProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
