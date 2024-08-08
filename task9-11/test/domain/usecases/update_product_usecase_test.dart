import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task6/features/product/domain/entities/product.dart';
import 'package:task6/features/product/domain/repositories/product_repo.dart';
import 'package:task6/features/product/domain/usecases/update_product_usecase.dart';

import 'update_product_usecase_test.mocks.dart';

@GenerateMocks([ProductRepo])
void main() {
  late UpdateProductUsecase updateProductUsecase;
  late MockProductRepo mockProductRepo;

  setUp(() {
    mockProductRepo = MockProductRepo();
    updateProductUsecase = UpdateProductUsecase(mockProductRepo);
  });

  test("should update product using the repository", () async {
    const testProduct = Product(
      id: '', 
      name: "name", 
      description: "description", 
      price: 123, 
      imageUrl: "imageUrl",
    );

    // Arrange
    when(mockProductRepo.update_product_repo(testProduct))
      .thenAnswer((_) async => const Right(testProduct));

    // Act
    final result = await updateProductUsecase(testProduct);

    // Assert
    expect(result, const Right(testProduct));
    verify(mockProductRepo.update_product_repo(testProduct));
    verifyNoMoreInteractions(mockProductRepo);
  });
}
