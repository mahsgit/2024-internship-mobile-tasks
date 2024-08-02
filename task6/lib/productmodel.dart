// product_data.dart

class Product {
  final String name;
  final double price;
  final String category;
  final String image;
  final double rating;

  Product({
    required this.name,
    required this.price,
    required this.category,
    required this.image,
    required this.rating,
  });
}

final List<Product> productList = [
  Product(
    name: "Derby Leather Shoes",
    price: 120.0,
    category: "Men's shoe",
    image: "images/image.png",

    rating: 4.0,
  ),
  Product(
    name: "Sports Sneakers",
    price: 80.0,
    category: "Unisex",
    image: "images/image.png",
    rating: 4.5,
  ),
   Product(
    name: "Sports Sneakers",
    price: 80.0,
    category: "Unisex",
    image: "images/image.png",
    rating: 4.5,
  ),
];
