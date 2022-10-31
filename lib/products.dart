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
      title: "Belt Bag",
      price: 234,
      description:
          'A Power Bank is a portable charger designed to recharge your electronic devices when youre on the move. Ranging in size from slim, pocket-sized devices up to larger, higher-capacity Power Banks , they can be used to charge smartphones, tablets etc.',
      image: "assets/powerbank.jpeg",
      capacity: "10000 mAh",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Hang Top",
      price: 234,
      description:
          'A Power Bank is a portable charger designed to recharge your electronic devices when youre on the move. Ranging in size from slim, pocket-sized devices up to larger, higher-capacity Power Banks , they can be used to charge smartphones, tablets etc.',
      image: "assets/powerbank.png",
      capacity: "3000 mAh",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "Old Fashion",
      price: 234,
      description:
          'A Power Bank is a portable charger designed to recharge your electronic devices when youre on the move. Ranging in size from slim, pocket-sized devices up to larger, higher-capacity Power Banks , they can be used to charge smartphones, tablets etc.',
      image: "assets/powerbank.png",
      capacity: "10000 mAh",
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Office Code",
      price: 234,
      description:
          'A Power Bank is a portable charger designed to recharge your electronic devices when youre on the move. Ranging in size from slim, pocket-sized devices up to larger, higher-capacity Power Banks , they can be used to charge smartphones, tablets etc.',
      image: "assets/powerbank.png",
      capacity: "5000 mAh",
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Office Code",
    price: 234,
    description:
        'A Power Bank is a portable charger designed to recharge your electronic devices when youre on the move. Ranging in size from slim, pocket-sized devices up to larger, higher-capacity Power Banks , they can be used to charge smartphones, tablets etc.',
    image: "assets/powerbank.png",
    capacity: "7000 mAh",
    color: Color(0xFFAEAEAE),
  ),
];
String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
