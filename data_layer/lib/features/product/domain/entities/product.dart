import 'package:equatable/equatable.dart';

import '../../data/models/product_model.dart';

//entity contain attributes or properties

class Product extends Equatable {
  final String id;
  final String name;
  final String category; 
  final String description;
  final double price;
  final double rating; 
  final String imageUrl;

  const Product({
    required this.id,
    this.category = 'MEN', 
    required this.name,
    required this.description,
    required this.price,
    this.rating = 2.3, 
    required this.imageUrl,
  });


    ProductModel toModel() { 
    return ProductModel(
    id:id,
    name:name,
    description: description,
    price: price,
    imageUrl: imageUrl


  );}
  
  @override
  //props are like boxs where we put attributes that we want to compare later
  List<Object?> get props => [id ,name,description,price,imageUrl];




}