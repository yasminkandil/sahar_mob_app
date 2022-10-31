import 'package:flutter/material.dart';

class Product {
  final String image, title, description, capacity;
  final int price, id;
  final Color color;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.capacity,
      required this.color});
}

List<Product> products = [
  Product(
      id: 1,
      title: "Power Bank",
      price: 234,
      description:
          'A Power Bank is a portable charger designed to recharge your electronic devices when youre on the move. Ranging in size from slim, pocket-sized devices up to larger, higher-capacity Power Banks , they can be used to charge smartphones, tablets etc.',
      image: "assets/powerbank2.png",
      capacity: "10000 mAh",
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "ENergizer Power Bank",
      price: 234,
      description:
          'A Power Bank is a portable charger designed to recharge your electronic devices when youre on the move. Ranging in size from slim, pocket-sized devices up to larger, higher-capacity Power Banks , they can be used to charge smartphones, tablets etc.',
      image: "assets/pb1.png",
      capacity: "10000 mAh",
      color: Color.fromARGB(255, 197, 95, 26)),
  Product(
      id: 3,
      title: "Xiaomi Power Bank",
      price: 250,
      description:
          'A Power Bank is a portable charger designed to recharge your electronic devices when youre on the move. Ranging in size from slim, pocket-sized devices up to larger, higher-capacity Power Banks , they can be used to charge smartphones, tablets etc.',
      image: "assets/powerbank.png",
      capacity: "3000 mAh",
      color: Color.fromARGB(255, 222, 12, 93)),
  Product(
      id: 4,
      title: "Anker Power Bank",
      price: 300,
      description:
          'A Power Bank is a portable charger designed to recharge your electronic devices when youre on the move. Ranging in size from slim, pocket-sized devices up to larger, higher-capacity Power Banks , they can be used to charge smartphones, tablets etc.',
      image: "assets/pb2.png",
      capacity: "10000 mAh",
      color: Color.fromARGB(255, 59, 157, 133)),
  Product(
      id: 5,
      title: "Xiaomi Redmi Power Bank",
      price: 270,
      description:
          'A Power Bank is a portable charger designed to recharge your electronic devices when youre on the move. Ranging in size from slim, pocket-sized devices up to larger, higher-capacity Power Banks , they can be used to charge smartphones, tablets etc.',
      image: "assets/pb3.png",
      capacity: "5000 mAh",
      color: Color.fromARGB(255, 22, 181, 133)),
  Product(
    id: 6,
    title: "joyroom Power Bank",
    price: 234,
    description:
        'A Power Bank is a portable charger designed to recharge your electronic devices when youre on the move. Ranging in size from slim, pocket-sized devices up to larger, higher-capacity Power Banks , they can be used to charge smartphones, tablets etc.',
    image: "assets/pb4.png",
    capacity: "7000 mAh",
    color: Color.fromARGB(255, 117, 109, 109),
  ),
];
String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
