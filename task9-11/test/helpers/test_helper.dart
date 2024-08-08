

import 'package:http/http.dart';
import 'package:http/http.dart'as http;
import 'package:mockito/annotations.dart';
import 'package:task6/features/product/domain/repositories/product_repo.dart';

@GenerateMocks(
  [
    ProductRepo
  ],

  customMocks: [MockSpec<http.Client>(as:#MockHttpClient)],
  
)
void main(){


}