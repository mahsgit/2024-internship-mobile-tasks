import '../../../domain/entities/product.dart';

abstract class HomeState {}

class FechInitial extends HomeState {}

class FetchLoading extends HomeState {}

class FetchSuccess extends HomeState {
  final List<Product> product;
  FetchSuccess(this.product);
}

class FetchFailure extends HomeState {
  final String error;
  FetchFailure(this.error);
}
