import 'package:equatable/equatable.dart';

//entity contain attributes or properties

class Product extends Equatable{
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;



  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl

  });
  
  @override
  //props are like boxs where we put attributes that we want to compare later
  List<Object?> get props => [id ,name,description,price,imageUrl];




}