import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> isNetworkConnected();
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker _connectionChecker;
  NetworkInfoImpl(this._connectionChecker);
  @override
  Future<bool> isNetworkConnected() async {
    return await _connectionChecker.hasConnection;
  }
}
