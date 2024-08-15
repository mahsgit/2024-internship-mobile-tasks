import 'package:flutter/widgets.dart';

abstract class AddBlocEvent {}

class AddData extends AddBlocEvent {
  final String id;
  final String name;
  final String category;
  final double price;
  final String description;
  final String imagePath;

  AddData({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.imagePath,
  });
}

class DeleteData extends AddBlocEvent {
  final String id;
  DeleteData({required this.id});
}






// import 'package:equatable/equatable.dart';

// abstract class AddBlocEvent extends Equatable {
//   const AddBlocEvent();

//   @override
//   List<Object> get props => [];
// }

// class NameChanged extends AddBlocEvent {
//   final String name;

//   const NameChanged(this.name);

//   @override
//   List<Object> get props => [name];
// }

// class CategoryChanged extends AddBlocEvent {
//   final String  category;

//   const CategoryChanged(this.category);

//   @override
//   List<Object> get props => [category];
// }

// class PriceChanged extends AddBlocEvent {
//   final String price;

//   const PriceChanged(this.price);

//   @override
//   List<Object> get props => [price];
// }

// class DescriptionChanged extends AddBlocEvent {
//   final String description;

//   const DescriptionChanged(this.description);

//   @override
//   List<Object> get props => [description];
// }

// class ImagePicked extends AddBlocEvent {
//   final String imagePath;

//   const ImagePicked(this.imagePath);

//   @override
//   List<Object> get props => [imagePath];
// }

// class FormSubmitted extends AddBlocEvent {}
