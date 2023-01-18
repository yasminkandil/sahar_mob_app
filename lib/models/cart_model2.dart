class CartModel2 {
  String? id;
  String? name;
  String? description;
  String? image;
  int? totalPrice;
  int? price;
  int? count;

  CartModel2(this.id, this.name, this.description, this.image, this.totalPrice,
      this.count, this.price);

  CartModel2.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    description = map['description'];
    image = map['image'];
    totalPrice = map['totalPrice'];
    price = map['price'];
    count = map['count'];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "image": image,
      "count": count,
      "totalPrice": totalPrice,
      "price": price,
    };
  }
}
