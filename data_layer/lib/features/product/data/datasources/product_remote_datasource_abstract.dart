import '../models/product_model.dart';

abstract class ProductRemoteDatasource {
  Future<ProductModel> addProduct(ProductModel product);
  Future<List<ProductModel>> displayAllProducts();
  Future<ProductModel> displaySingleProduct(String id);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<void> deleteProduct(String id);
}
