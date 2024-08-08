import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task6/features/product/domain/repositories/product_repo.dart';
import 'package:task6/features/product/domain/usecases/delete_product_usecase.dart';

import 'delete_product_usecase_test.mocks.dart';

@GenerateMocks([ProductRepo])
void main() {
  late DeleteProductUsecase deleteProductUsecase;
  late MockProductRepo mockProductRepo;

  setUp(() {
    mockProductRepo = MockProductRepo();
    deleteProductUsecase = DeleteProductUsecase(mockProductRepo);
  });

  test("should delete product using the repository", () async {
    const tProductId = 'id';
    when(mockProductRepo.delete_repo(tProductId))
        .thenAnswer((_) async => const Right(unit));

    final result = await deleteProductUsecase(const Deleteparam(tProductId));

    expect(result, const Right(unit));
    verify(mockProductRepo.delete_repo(tProductId)); 
    verifyNoMoreInteractions(mockProductRepo);
  });
}
