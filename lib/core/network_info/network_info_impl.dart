import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:maaredh/core/network_info/network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;

  NetworkInfoImpl({required this.internetConnectionChecker});

  @override
  Future<bool> get isConnected async => await internetConnectionChecker.hasConnection;
}
