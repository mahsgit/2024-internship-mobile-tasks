import 'package:equatable/equatable.dart';

import '../../data/models/product_model.dart';

//entity contain attributes or properties

class Product extends Equatable{
  final String id;
  final String name;
  final String category="MEN";

  final String description;
  final double price;
  final double rating=2.3;

  final String imageUrl;




  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl

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