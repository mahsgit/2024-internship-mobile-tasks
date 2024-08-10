class Urls {
  static const String baseUrl = 'https://g5-flutter-learning-path-be.onrender.com/api/v1/products';

  // Endpoint to get a single product by ID
  static String displaySingleProductUrl(String id) => '$baseUrl/$id';

  // Endpoint to add a new product
  static String addProductUrl() => baseUrl;

  // Endpoint to update an existing product by ID
  static String updateProductUrl(String id) => '$baseUrl/$id';

  // Endpoint to delete a product by ID
  static String deleteProductUrl(String id) => '$baseUrl/$id';

  // Endpoint to get all products
  static String displayAllProductsUrl() => baseUrl;
}
