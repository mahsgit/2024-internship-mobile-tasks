import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../domain/usecases/view_all_products_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';




class HomeBlock extends Bloc<HomeEvent,HomeState>{
  ViewAllProductsUsecase viewAllProductsUsecase;
  HomeBlock({required this.viewAllProductsUsecase}):super(FechInitial()){
    on<FetchData>((event, emit) async{
    emit(FetchLoading() );
    try{
      final result= await  viewAllProductsUsecase(NoParams());
      result.fold(
        (failure)=>emit(FetchFailure(failure.message)),
        (products)=>emit(FetchSuccess(products)),
      );

    }catch(e){
      emit(FetchFailure("Failed to fetch data"));
    }
    }
    );
  


    }
  }
