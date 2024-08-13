import 'dart:io';

import 'package:flutter/material.dart';

class Product {
  final String name;
  final String category;
  final double price;
  final double rating;
  final String image;
  final File? Image;

  final String description;

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
     this.image = "images/image.png",
    this.Image,
    required this.description,
  });
}

class Productsofall extends ChangeNotifier {
  static List<Product> productList = [
    Product(
      name: "Derby Leather Shoes",
      price: 120.0,
      category: "Men's shoe",
      image: "images/image.png",
      description:
          "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
      rating: 4.0,
    ),
    Product(
      name: "Sports Sneakers",
      price: 80.0,
      category: "Unisex",
      image: "images/sneakers.jpg",
      rating: 4.5,
      description:
          "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
    ),
    Product(
      name: "high heels",
      price: 80.0,
      category: "women",
      image: "images/heels.jpg",
      rating: 4.5,
      description:
          "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
    ),
  ];
  void addproduct(product) {
    productList.add(product);
    notifyListeners();
  }
}
