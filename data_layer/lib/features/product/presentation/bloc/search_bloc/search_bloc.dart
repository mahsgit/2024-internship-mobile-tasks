import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/usecases/view_all_products_usecase.dart';
import 'search_bloc_event.dart';
import 'search_bloc_state.dart';
class SearchBloc extends Bloc<SearchBlocEvent, SearchBlocState> {
  List<Product>? _products; // To store products

  SearchBloc() : super(LoadingSearch()) {
    on<HoldDataEvent>((event, emit) {
      _products = event.getfromhome;
      emit(Initial(event.getfromhome));
    });



    on<FetchSearchData>((event, emit) async {
      if (_products == null) {
        emit(FailSearch('No products available for search.'));
        return;
      }

      try {
        final filteredProducts = _searchFunc(_products!, event.name);
        if (filteredProducts.isNotEmpty) {
          emit(SuccesSearchState(filteredProducts));
        } else {
          emit(FailSearch('No products found matching the search criteria'));
        }
      } catch (e) {
        emit(FailSearch('Unexpected error occurred'));
      }
    });
  }

  List<Product> _searchFunc(List<Product> products, String query) {
    return products.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}


