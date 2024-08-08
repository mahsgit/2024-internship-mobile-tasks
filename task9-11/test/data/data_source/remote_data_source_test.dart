import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task6/core/constants/constants.dart';
import 'package:task6/features/product/data/datasources/product_remote_datasource_imple.dart';
import 'package:task6/features/product/data/models/product_model.dart';
import 'package:http/http.dart' as http;
import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late ProductRemoteDatasourceImple productRemoteDatasourceImple;

  setUp(() {
    mockHttpClient = MockHttpClient();
    productRemoteDatasourceImple = ProductRemoteDatasourceImple(client: mockHttpClient);
  });

  const testId = '1';

  group("get current product", () {
    test("should return product model when the response code is 200", () async {
      when(mockHttpClient.get(Uri.parse(Urls.displaySingleProductUrl(testId))))
          .thenAnswer(
        (_) async => http.Response(
          readJson('helpers/dummy_data/dummy_product_response.json'),
          200,
        ),
      );

      final result = await productRemoteDatasourceImple.display_single_product_repo(testId);

      expect(result, isA<ProductModel>());
    });
  });
}
