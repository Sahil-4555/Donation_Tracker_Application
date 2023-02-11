import 'package:flutter/material.dart';

class Product {
  final String image, title, description, price;
  final int size, id;
  final Color color;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "BB ki Vines",
      price: "Youtuber",
      size: 12,
      description: dummyText,
      image: "lib/images/carry_minati_1.png",
      color: Colors.white),
  Product(
      id: 2,
      title: "Carryminati",
      price: "Youtuber",
      size: 8,
      description: dummyText,
      image: "lib/images/bhuvan_bam_1.png",
      color: Colors.white),
  Product(
      id: 3,
      title: "PewDiePie",
      price: "Musican",
      size: 10,
      description: dummyText,
      image: "lib/images/carry_minati_2.png",
      color: Colors.white),
  Product(
      id: 4,
      title: "PewDiePie",
      price: "Actor",
      size: 11,
      description: dummyText,
      image: "lib/images/ashish_chanchlani_1.png",
      color: Colors.white),
  Product(
      id: 5,
      title: "BB ki Vines",
      price: "Youtuber",
      size: 12,
      description: dummyText,
      image: "lib/images/carry_minati_1.png",
      color: Colors.white),
  Product(
    id: 6,
    title: "Carryminati",
    price: "Youtuber",
    size: 12,
    description: dummyText,
    image: "lib/images/bhuvan_bam_1.png",
    color: Colors.white,
  ),
  Product(
    id: 7,
    title: "PewDiePie",
    price: "Musician",
    size: 12,
    description: dummyText,
    image: "lib/images/carry_minati_2.png",
    color: Colors.white,
  ),
  Product(
    id: 8,
    title: "PewDiePie",
    price: "Actor",
    size: 12,
    description: dummyText,
    image: "lib/images/ashish_chanchlani_1.png",
    color: Colors.white,
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
