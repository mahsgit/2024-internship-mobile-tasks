import '../models/product_model.dart';

//throw exception

abstract class ProductLocalDatasource{
  Future<ProductModel> getLastProduct(String id);
  Future<List<ProductModel>> getAllProducts();
  Future<void> deleteProduct(String id);
  Future<void> cachProduct(ProductModel product);
  Future<void> cachProducts(List<ProductModel> products);
}