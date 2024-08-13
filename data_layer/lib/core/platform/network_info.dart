import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo{
  //is a method so that extend this class will implement it 
  Future<bool> get isconnected;
  
}
class NetworkInfoImpl implements NetworkInfo{
  final InternetConnectionChecker connectionChecker;
  NetworkInfoImpl(this.connectionChecker);


  @override
  Future<bool> get isconnected => connectionChecker.hasConnection;
  }