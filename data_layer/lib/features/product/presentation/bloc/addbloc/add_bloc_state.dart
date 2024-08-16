
import '../../../domain/entities/product.dart';

abstract class AddBlocState{}
class SubmissionInitial extends AddBlocState{}
class SubmitionLoading extends AddBlocState{}
// hold the product if it is successfully send to api then the state is changed so later we can access
// the product data by state.product.id or whatever 
class SubmissionSuccess extends AddBlocState{
  final Product product;
SubmissionSuccess(this.product);
}

class SubmissionFailure extends AddBlocState{
  final String error;
  SubmissionFailure(this.error);
}







