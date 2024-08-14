import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'core/platform/network_info.dart';
import 'features/product/data/datasources/product_local_datasource.dart';
import 'features/product/data/datasources/product_local_datasource_imp.dart';
import 'features/product/data/datasources/product_remote_datasource_abstract.dart';
import 'features/product/data/datasources/product_remote_datasource_imple.dart';
import 'features/product/data/repositories/product_repo_imp.dart';
import 'features/product/domain/repositories/product_repo.dart';
import 'features/product/domain/usecases/create_product_usecase.dart';
import 'features/product/domain/usecases/delete_product_usecase.dart';
import 'features/product/domain/usecases/update_product_usecase.dart';
import 'features/product/domain/usecases/view_all_products_usecase.dart';
import 'features/product/domain/usecases/view_specific_product_usecase.dart';
import 'features/product/presentation/bloc/addbloc/add_bloc.dart';
import 'features/product/presentation/bloc/homebloc/home_block.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  var sharedPreferences = await SharedPreferences.getInstance();
  var client = http.Client();
  var internetChecker = InternetConnectionChecker();
  getIt.registerFactory<NetworkInfo>(() => NetworkInfoImpl(internetChecker));
  getIt.registerSingleton<ProductRemoteDatasource>(
      ProductRemoteDatasourceImpl(client: client));
  getIt.registerSingleton<ProductLocalDatasource>(
      ProductLocalDatasourceImp(sharedPreferences: sharedPreferences));
  getIt.registerSingleton<ProductRepo>(ProductRepoImp(
      productLocalDatasource: getIt(),
      productRemoteDatasource: getIt(),
      networkInfo: getIt()));
  getIt.registerSingleton<ViewAllProductsUsecase>(
      ViewAllProductsUsecase(getIt()));
  getIt.registerSingleton<ViewSpecificProductUsecase>(
      ViewSpecificProductUsecase(getIt()));
  getIt.registerSingleton<UpdateProductUsecase>(UpdateProductUsecase(getIt()));
  getIt.registerSingleton<DeleteProductUsecase>(DeleteProductUsecase(getIt()));
  getIt.registerSingleton<CreateProductUsecase>(CreateProductUsecase(getIt()));
  getIt
      .registerSingleton<HomeBlock>(HomeBlock(viewAllProductsUsecase: getIt()));
  getIt.registerSingleton<AddBloc>(AddBloc(createProductUsecase: getIt()));
  getIt
      .registerSingleton<UpdateBloc>(UpdateBloc(updateProductUsecase: getIt()));
  getIt
      .registerSingleton<DeleteBloc>(DeleteBloc(deleteProductUsecase: getIt()));
}
