import '../../../domain/entities/product.dart';

abstract class SearchBlocEvent{}

class FetchSearchData extends SearchBlocEvent
{
final String name;

FetchSearchData({ required this.name});

}

class HoldDataEvent extends SearchBlocEvent{
final List<Product> getfromhome;
HoldDataEvent(this.getfromhome);
}






