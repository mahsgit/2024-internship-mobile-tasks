import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/product.dart';
import '../../../domain/usecases/create_product_usecase.dart';
import '../../../domain/usecases/delete_product_usecase.dart';
import '../../../domain/usecases/update_product_usecase.dart';
import 'add_bloc_event.dart';
import 'add_bloc_state.dart';
import 'package:uuid/uuid.dart';

class AddBloc extends Bloc<AddBlocEvent, AddBlocState> {
  CreateProductUsecase createProductUsecase;
  AddBloc({required this.createProductUsecase}) : super(SubmissionInitial()) {
    on<AddData>((event, emit) async {
      emit(SubmitionLoading());
      try {
        final product = Product(
          id: event.id,
          name: event.name,
          category: event.category,
          price: event.price,
          description: event.description,
          imageUrl: event.imagePath,
        );
        final result = await createProductUsecase(product);
        result.fold(
          (failure) => emit(SubmissionFailure(failure.message)),
          (product) => emit(SubmissionSuccess(product)),
        );
      } catch (e, stackTrace) {
        print('Exception: $e');
        print('Stack trace: $stackTrace');
        emit(SubmissionFailure("Failed to add product"));
      }
    });
  }
}


class UpdateBloc extends Bloc<AddBlocEvent, AddBlocState> {
  UpdateProductUsecase updateProductUsecase;
  UpdateBloc({required this.updateProductUsecase}) : super(SubmissionInitial()) {
    on<AddData>((event, emit) async {
      emit(SubmitionLoading());
      try {
        final product = Product(
          id: event.id,
          name: event.name,
          category: event.category,
          price: event.price,
          description: event.description,
          imageUrl: event.imagePath,
        );
        final result = await updateProductUsecase(product);
        result.fold(
          (failure) => emit(SubmissionFailure(failure.message)),
          (product) => emit(SubmissionSuccess(product)),
        );
      } catch (e, stackTrace) {
        print('Exception: $e');
        print('Stack trace: $stackTrace');
        emit(SubmissionFailure("Failed to update product"));
      }
    });
  }
}




class DeleteBloc extends Bloc<AddBlocEvent, AddBlocState> {
  DeleteProductUsecase deleteProductUsecase;
  DeleteBloc({required this.deleteProductUsecase}) : super(SubmissionInitial()) {
    on<DeleteData>((event, emit) async {
      emit(SubmitionLoading());
      try {
        final Deleteparam id= Deleteparam(event.id);
        
        final result = await deleteProductUsecase(id);
        // result.fold(
        //   (failure) => emit(SubmissionFailure(failure.message)),
        //   (success) => emit(SubmissionSuccess(success)),
        // );
      } catch (e, stackTrace) {
        print('Exception: $e');
        print('Stack trace: $stackTrace');
        emit(SubmissionFailure("Failed to delete product"));
      }
    });
  }
}
