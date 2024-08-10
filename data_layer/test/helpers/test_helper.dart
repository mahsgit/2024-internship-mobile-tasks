

import 'package:http/http.dart';
import 'package:http/http.dart'as http;
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task6/core/platform/network_info.dart';
import 'package:task6/features/product/data/datasources/product_local_datasource.dart';
import 'package:task6/features/product/data/datasources/product_local_datasource_imp.dart';
import 'package:task6/features/product/data/datasources/product_remote_datasource_abstract.dart';
import 'package:task6/features/product/domain/repositories/product_repo.dart';

@GenerateMocks(
  [
    ProductRepo,
    ProductRemoteDatasource,
    ProductLocalDatasource,
    SharedPreferences,
    NetworkInfo
  ],

  customMocks: [MockSpec<http.Client>(as:#MockHttpClient)],
  
)
void main(){


}