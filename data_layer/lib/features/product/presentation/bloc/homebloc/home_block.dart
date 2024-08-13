import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/platform/network_info.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../data/datasources/product_remote_datasource_imple.dart';
import '../../../data/datasources/product_local_datasource_imp.dart';

import '../../../data/repositories/product_repo_imp.dart';
import '../../../domain/repositories/product_repo.dart';
import '../../../domain/usecases/view_all_products_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';
import 'package:http/http.dart' as http;



// final httpClient = http.Client(); 
// final sharedPreferences = await SharedPreferences.getInstance(); 

// final productRemoteDatasource = ProductRemoteDatasourceImpl(client: httpClient);
// final productLocalDatasource = ProductLocalDatasourceImp(sharedPreferences: sharedPreferences);
// final networkInfo = NetworkInfoImpl(InternetConnectionChecker());

// final productRepo = ProductRepoImp(
//   productRemoteDatasource: productRemoteDatasource,
//   productLocalDatasource: productLocalDatasource,
//   networkInfo: networkInfo,
// );


// final viewAllProductsUsecase = ViewAllProductsUsecase(productRepo);



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
