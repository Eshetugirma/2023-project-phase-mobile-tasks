import 'package:internet_connection_checker/internet_connection_checker.dart';

/// Class for checking network connection
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

/// Implementation of [NetworkInfo]
///
/// Uses [InternetConnectionChecker] to check network connection
class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
