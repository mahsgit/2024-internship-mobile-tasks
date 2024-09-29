class Urls {
  static const String baseUrl = 'https://g5-flutter-learning-path-be.onrender.com/api/v2/products';
  static const String baseUrluseradd = 'https://g5-flutter-learning-path-be.onrender.com/api/v2/auth/register';
  static const String baseUrluserget = 'https://g5-flutter-learning-path-be.onrender.com/api/v2/auth/login';
  static const String baseUrluserme = 'https://g5-flutter-learning-path-be.onrender.com/api/v2/users/me';
  static const String chaturl="https://g5-flutter-learning-path-be.onrender.com/api/v3/chats";



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
  static String getuserurl() => baseUrluserget;
  static String meuserurl() => baseUrluserme;
  static String adduserurl() => baseUrluseradd;




  static String deleteChatUrl(String id) => '$chaturl/$id';
  static String getchatmessageUrl(String id) => '$chaturl/$id';
  static String initialchatUrl(String id) => '$chaturl/$id';
  static String mychatbyidUrl(String id) => '$chaturl/$id';
  static String mychatUrl() => chaturl;


}
