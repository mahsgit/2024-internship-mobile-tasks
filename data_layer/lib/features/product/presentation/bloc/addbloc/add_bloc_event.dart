import 'package:equatable/equatable.dart';

// Base class for all product-related events
abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

// Event for adding a product
class AddData extends ProductEvent {
  final String id;
  final String name;
  final String category;
  final double price;
  final String description;
  final String imagePath;

  const AddData({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.imagePath,
  });

  @override
  List<Object> get props => [id, name, category, price, description, imagePath];
}


// Event for deleting a product
class DeleteData extends ProductEvent {
  final String id;

  const DeleteData({required this.id});

  @override
  List<Object> get props => [id];
}
