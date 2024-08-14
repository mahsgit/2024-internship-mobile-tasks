import 'package:formz/formz.dart';

enum ProductNameValidationError { empty }
enum ProductCategoryValidationError { empty }
enum ProductPriceValidationError { empty }
enum ProductDescriptionValidationError { empty }
enum FormStatusValidationError { empty, invalid }




class ProductName extends FormzInput<String, ProductNameValidationError> {
  // Call the FormzInput constructor with the initial value.
  const ProductName.pure() : super.pure('');
  const ProductName.dirty([String value = '']) : super.dirty(value);

  // Validator checks if the input is empty, and returns the appropriate error.
  @override
  ProductNameValidationError? validator(String value) {
    return value.isNotEmpty ? null : ProductNameValidationError.empty;
  }
}


class ProductCategory extends FormzInput<String, ProductCategoryValidationError> {
  // Call the FormzInput constructor with the initial value.
  const ProductCategory.pure() : super.pure('');
  const ProductCategory.dirty([String value = '']) : super.dirty(value);

  // Validator checks if the input is empty, and returns the appropriate error.
  @override
  ProductCategoryValidationError? validator(String value) {
    return value.isNotEmpty ? null : ProductCategoryValidationError.empty;
  }
}



class ProductPrice extends FormzInput<String, ProductPriceValidationError> {
  // Call the FormzInput constructor with the initial value.
  const ProductPrice.pure() : super.pure('');
  const ProductPrice.dirty([String value = '']) : super.dirty(value);

  // Validator checks if the input is empty, and returns the appropriate error.
  @override
  ProductPriceValidationError? validator(String value) {
    return value.isNotEmpty ? null : ProductPriceValidationError.empty;
  }
}



class ProductDescription extends FormzInput<String, ProductDescriptionValidationError> {
  // Call the FormzInput constructor with the initial value.
  const ProductDescription.pure() : super.pure('');
  const ProductDescription.dirty([String value = '']) : super.dirty(value);

  // Validator checks if the input is empty, and returns the appropriate error.
  @override
  ProductDescriptionValidationError? validator(String value) {
    return value.isNotEmpty ? null : ProductDescriptionValidationError.empty;
  }
}



class FormStatus extends FormzInput<String, FormStatusValidationError> {
  // Call the FormzInput constructor with the initial value.
  const FormStatus.pure() : super.pure('');
  const FormStatus.dirty([String value = '']) : super.dirty(value);

  // Validator checks if the input is empty or invalid, and returns the appropriate error.
  @override
  FormStatusValidationError? validator(String value) {
    if (value.isEmpty) {
      return FormStatusValidationError.empty;
    } else if (!isValidStatus(value)) {
      return FormStatusValidationError.invalid;
    }
    return null;
  }

  // Custom validation logic for status
  bool isValidStatus(String value) {
    // Implement your custom logic here, e.g., check if the value is one of the valid statuses
    final validStatuses = ['valid', 'invalid', 'inProgress', 'success', 'failure'];
    return validStatuses.contains(value);
  }

  // Getter to check if the form is validated
  bool get isValidated => isValidStatus(value);

  // Getter to check if the submission was successful
  bool get submissionSuccess => value == 'success';

  // Getter to check if the submission failed
  bool get submissionFailure => value == 'failure';
}
