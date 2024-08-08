import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task6/core/usecases/usecase.dart';
import 'package:task6/features/product/domain/entities/product.dart';
import 'package:task6/features/product/domain/repositories/product_repo.dart';
import 'package:task6/features/product/domain/usecases/view_specific_product_usecase.dart';

import 'view_specific_product_usecase_test.mocks.dart';

@GenerateMocks([ProductRepo])
void main() {
  late ViewSpecificProductUsecase viewSpecificProductUsecase;
  late MockProductRepo mockProductRepo;

  setUp(() {
    mockProductRepo = MockProductRepo();
    viewSpecificProductUsecase = ViewSpecificProductUsecase(mockProductRepo);
  });

  test("should display specific product ", () async {
     const tId = 'id';
    const tProduct = Product(
        id: tId,
        name: 'name',
        description: 'description',
        price: 123,
        imageUrl: 'image');


    // Arrange
    when(mockProductRepo.display_single_product_repo(tId))
      .thenAnswer((_) async =>  Right(tProduct));

    // Act
    final result = await viewSpecificProductUsecase(SearchByID(tId));

    // Assert
    expect(result,  Right(tProduct));
    verify(mockProductRepo.display_single_product_repo(tId));
    verifyNoMoreInteractions(mockProductRepo);
  });
}
