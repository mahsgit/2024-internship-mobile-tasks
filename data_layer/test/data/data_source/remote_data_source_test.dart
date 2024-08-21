import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task6/core/constants/constants.dart';
import 'package:task6/features/login_and_registration/data/data_source/localtoken.dart';
import 'package:task6/features/product/data/datasources/product_remote_datasource_imple.dart';
import 'package:task6/features/product/data/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:task6/features/product/domain/entities/product.dart';
import '../../helpers/json_reader.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late ProductRemoteDatasourceImpl productRemoteDatasourceImple;

  setUp(() {
    mockHttpClient = MockHttpClient();
    productRemoteDatasourceImple = ProductRemoteDatasourceImpl(client: mockHttpClient);
  });

  const testId = '1';
   const testproduct = ProductModel(
        id: '', 
        name: "name", 
        description: "description", 
        price: 123, 
        imageUrl: "imageUrl");

  group("get current product", () {
    test("should return product model when the response code is 200", () async {
      when(mockHttpClient.get(Uri.parse(Urls.displaySingleProductUrl(testId))))
          .thenAnswer(
        (_) async => http.Response(
          readJson('helpers/dummy_data/dummy_product_response.json'),
          200,
        ),
      );

      final result = await productRemoteDatasourceImple.displaySingleProduct(testId);

      expect(result, isA<ProductModel>());
    });

    test("should throw an exception when the response code is not 200", () async {
      when(mockHttpClient.get(Uri.parse(Urls.displaySingleProductUrl(testId))))
          .thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );
      final resutl =() async => await productRemoteDatasourceImple.displaySingleProduct(testId);

      expect(resutl,
             throwsA(isA<Exception>()));
    });
  }
  );

 

  group("add  product", () {

    test("should add product  when the response code is 201", () async {
      when(mockHttpClient.post(Uri.parse(Urls.addProductUrl()),
      body: anyNamed('body'),
      headers: anyNamed("headers")
      ))
          .thenAnswer(
        (_) async => http.Response(
          readJson('helpers/dummy_data/dummy_product_response.json'),
          201,
        ),
      );

      final result = await productRemoteDatasourceImple.addProduct(testproduct);

      expect(result, isA<ProductModel>());
    });

     test("should throw an exception when the response code is not 201", () async {
      when(mockHttpClient.post(Uri.parse(Urls.addProductUrl()),
              body: anyNamed('body'),
              headers: anyNamed('headers')))
          .thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );

      expect(() async => await productRemoteDatasourceImple.addProduct(testproduct),
             throwsA(isA<Exception>()));
    });
  });

group("delete product", () {

  const testId = '1';

  test("should delete product when the response code is 200", () async {
    when(mockHttpClient.delete(Uri.parse(Urls.deleteProductUrl(testId)),
        headers: anyNamed("headers")))
        .thenAnswer(
      (_) async => http.Response('', 200),
    );

    await productRemoteDatasourceImple.deleteProduct(testId);

    verify(mockHttpClient.delete(Uri.parse(Urls.deleteProductUrl(testId)),
        headers: anyNamed("headers"))).called(1);
  });

  test("should throw an exception when the response code is not 200", () async {
    when(mockHttpClient.delete(Uri.parse(Urls.deleteProductUrl(testId)),
        headers: anyNamed("headers")))
        .thenAnswer(
      (_) async => http.Response('Not Found', 404),
    );

    expect(() async => await productRemoteDatasourceImple.deleteProduct(testId),
           throwsA(isA<Exception>()));
  });

});


}


