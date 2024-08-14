




import '../../../domain/entities/product.dart';

abstract class AddBlocState{}
class SubmissionInitial extends AddBlocState{}
class SubmitionLoading extends AddBlocState{}

class SubmissionSuccess extends AddBlocState{
  final Product product;
SubmissionSuccess(this.product);
}

class SubmissionFailure extends AddBlocState{
  final String error;
  SubmissionFailure(this.error);
}











// import 'package:formz/formz.dart';
// import 'package:equatable/equatable.dart';

// import 'form.dart';

// class CrudFormState extends Equatable {
//   final ProductName name;
//   final ProductCategory category;
//   final ProductPrice price;
//   final ProductDescription description;
//   final FormStatus status;
//   final String imagePath;
//   final bool isSubmissionSuccessful;

//   const CrudFormState({
//     this.name = const ProductName.pure(),
//     this.category = const ProductCategory.pure(),
//     this.price = const ProductPrice.pure(),
//     this.description = const ProductDescription.pure(),
//     this.status = const FormStatus.dirty(),
//     this.imagePath = '',
//     this.isSubmissionSuccessful = false,
//   });

//   CrudFormState copyWith({
//     ProductName? name,
//     ProductCategory? category,
//     ProductPrice? price,
//     ProductDescription? description,
//     FormStatus? status,
//     String? imagePath,
//     bool? isSubmissionSuccessful,
//   }) {
//     return CrudFormState(
//       name: name ?? this.name,
//       category: category ?? this.category,
//       price: price ?? this.price,
//       description: description ?? this.description,
//       status: status ?? this.status,
//       imagePath: imagePath ?? this.imagePath,
//       isSubmissionSuccessful: isSubmissionSuccessful ?? this.isSubmissionSuccessful,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         name,
//         category,
//         price,
//         description,
//         status,
//         imagePath,
//         isSubmissionSuccessful,
//       ];
// }
