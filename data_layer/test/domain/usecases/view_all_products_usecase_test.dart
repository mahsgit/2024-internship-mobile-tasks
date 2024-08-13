import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task6/core/usecases/usecase.dart';
import 'package:task6/features/product/domain/entities/product.dart';
import 'package:task6/features/product/domain/repositories/product_repo.dart';
import 'package:task6/features/product/domain/usecases/view_all_products_usecase.dart';

import 'view_specific_product_usecase_test.mocks.dart';

@GenerateMocks([ProductRepo])
void main() {
  late ViewAllProductsUsecase viewAllProductsUsecase;
  late MockProductRepo mockProductRepo;

  setUp(() {
    mockProductRepo = MockProductRepo();
    viewAllProductsUsecase = ViewAllProductsUsecase(mockProductRepo);
  });

  test("should display all product ", () async {
    final tproduct =<Product>[];

    // Arrange
    when(mockProductRepo.display_all_product_repo())
      .thenAnswer((_) async =>  Right(tproduct));

    // Act
    final result = await viewAllProductsUsecase(NoParams());

    // Assert
    expect(result,  Right(tproduct));
    verify(mockProductRepo.display_all_product_repo());
    verifyNoMoreInteractions(mockProductRepo);
  });
}
