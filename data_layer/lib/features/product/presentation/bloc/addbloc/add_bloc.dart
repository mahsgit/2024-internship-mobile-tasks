import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/usecases/create_product_usecase.dart';
import '../../../domain/usecases/delete_product_usecase.dart';
import '../../../domain/usecases/update_product_usecase.dart';
import '../homebloc/home_block.dart';
import '../homebloc/home_event.dart';
import 'add_bloc_event.dart';
import 'add_bloc_state.dart';


class AddBloc extends Bloc<ProductEvent, AddBlocState> {
  CreateProductUsecase createProductUsecase;
  HomeBlock homeBlock;
  AddBloc({required this.createProductUsecase, required this.homeBlock})
      : super(SubmissionInitial()) {
        // handling AddData event and emit state that the builder wait 
    on<AddData>((event, emit) async {
      emit(SubmitionLoading());
      try {
        // here we create prdocut object and encapsulate all the attribute and change it to product
        final product = Product(
          id: event.id,
          name: event.name,
          category: event.category,
          price: event.price,
          description: event.description,
          imageUrl: event.imagePath,
        );
        final result = await createProductUsecase(product);
        result.fold((failure) => emit(SubmissionFailure(failure.message)),
            (product) {
          emit(SubmissionSuccess(product));
          homeBlock.add(FetchData());
        });
      } catch (e, stackTrace) {
        emit(SubmissionFailure("Failed to add product"));
      }
    });
  }
}

class UpdateBloc extends Bloc<ProductEvent, AddBlocState> {
  UpdateProductUsecase updateProductUsecase;
  HomeBlock homeBlock;

  UpdateBloc({required this.updateProductUsecase, required this.homeBlock})
      : super(SubmissionInitial()) {
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
            (product) =>
                {emit(SubmissionSuccess(product)), homeBlock.add(FetchData())});
      } catch (e, stackTrace) {
        print('Exception: $e');
        print('Stack trace: $stackTrace');
        emit(SubmissionFailure("Failed to update product"));
      }
    });
  }
}

class DeleteBloc extends Bloc<ProductEvent, AddBlocState> {
  DeleteProductUsecase deleteProductUsecase;
  HomeBlock homeBlock;
  DeleteBloc({required this.deleteProductUsecase, required this.homeBlock})
      : super(SubmissionInitial()) {
    on<DeleteData>((event, emit) async {
      emit(SubmitionLoading());
      try {
        final Deleteparam id = Deleteparam(event.id);

        final result = await deleteProductUsecase(id);
        // result.fold(
        //   (failure) => emit(SubmissionFailure(failure.message)),
        //   (success) => emit(SubmissionSuccess(result)),
        // );
        homeBlock.add(FetchData());
      } catch (e, stackTrace) {
        print('Exception: $e');
        print('Stack trace: $stackTrace');
        emit(SubmissionFailure("Failed to delete product"));
      }
    });
  }
}
