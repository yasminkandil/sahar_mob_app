class ProductModel2 {
  String? image;
  String? image2;
  String? image3;

  String? name;
  String? quantity;
  String? price;
  String? description;
  String? id;
  String? category;
  String? brand;
  //String? Date;

  ProductModel2({
    required this.image,
    required this.image2,
    required this.image3,
    required this.quantity,
    required this.price,
    required this.description,
    required this.id,
    required this.name,
    required this.category,
    required this.brand,
  });

  ProductModel2.fromJson(Map<String, dynamic> json) {
    image = json["image"];
    image2 = json["image2"];
    image3 = json["image3"];
    name = json["name"];
    quantity = json["quantity"];
    price = json["price"];
    description = json["description"];
    id = json["id"];
    category = json["category"];
    brand = json["brand"];
    //Date = json["Date"];
  }
}
