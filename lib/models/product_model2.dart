class ProductModel2 {
  String? image;
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
