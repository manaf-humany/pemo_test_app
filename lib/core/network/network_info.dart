import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

/// Abstract class for network information.
abstract class NetworkInfo {
  /// Returns `true` if the device is connected to the internet, `false` otherwise.
  Future<bool> get isConnected;
}

/// Implementation of [NetworkInfo] using the `internet_connection_checker_plus` package.
class NetworkInfoImpl implements NetworkInfo {
  /// Creates a [NetworkInfoImpl] instance.
  NetworkInfoImpl();

  /// Returns `true` if the device has internet access, `false` otherwise.
  ///
  /// This getter uses [InternetConnection.hasInternetAccess] from the
  /// `internet_connection_checker_plus` package to determine the
  /// internet connection status.
  @override
  Future<bool> get isConnected => InternetConnection().hasInternetAccess;
}
