import '../../../domain/entities/product.dart';

abstract class SearchBlocState{}

 class Initial extends SearchBlocState{
  final List<Product> feachedstate;
  Initial(this.feachedstate);
 } 
 class LoadingSearch extends SearchBlocState{}

class SuccesSearchState extends SearchBlocState{
  final List<Product> searchproducts;
  SuccesSearchState( this.searchproducts);
  
}
class FailSearch extends SearchBlocState{
  final String message ;
  FailSearch(this.message);

}

class TEST extends SearchBlocState{
  final List<Product> test2;
  TEST(this.test2);

}
