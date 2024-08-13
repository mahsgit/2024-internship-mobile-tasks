import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task6/features/product/domain/entities/product.dart';
import 'package:task6/features/product/domain/repositories/product_repo.dart';
import 'package:task6/features/product/domain/usecases/create_product_usecase.dart';

import 'view_specific_product_usecase_test.mocks.dart';
//tell mockito library to generate mock class called mockproductrepo
//the whole point of mock is we generate mockrepo then we give the data example specific product and 
// send the actual repo the same data and compare those so if the real usecase didint return the same 
// data then the usecase is not working
//to check if CreateProductUsecase correctly interacts with the ProductRepo
@GenerateMocks([ProductRepo])
void main(){
  // setting up the environment
  //class we want to test
  late CreateProductUsecase createProductUsecase;
  // fake version of productrepo
  late MockProductRepo mockProductRepo;

  setUp((){
    // new instance each time we run cause we dont need conflict with previos on 
    mockProductRepo=MockProductRepo();
    //we test createProductUsecase using mockprdocutrepo
    createProductUsecase=CreateProductUsecase(mockProductRepo);
  });

  //testcase
 test("should create product using the repository",() async{
      
      //*****arrange********

// example of product we want to test
      const testProduct=Product(
        id: '', 
        name: "name", 
        description: "description", 
        price: 123, 
        imageUrl: "imageUrl");
 // when  when we call add repo make the mock test return success we can make what ever when want just 
 // it should be constant so that when we compair we get to some ground
 // this is constant just for flexibility and to utilize mock enji is like storing expected values on variable
when(mockProductRepo.add_product_repo(testProduct))
.thenAnswer((_) async => const Right(testProduct));

// ****act****
// this is also pass through mock repo cause we make the usecase navigate to mock repo in our SETUP()
// so if it doesn pass through mock we will get different resutl so the usecase is not interacting 
final result =await createProductUsecase(testProduct);

//****assert***
expect(result,const Right(testProduct));
// to check if add repo was called
verify(mockProductRepo.add_product_repo(testProduct));
//not other method were called
verifyNoMoreInteractions(mockProductRepo);
  });
}