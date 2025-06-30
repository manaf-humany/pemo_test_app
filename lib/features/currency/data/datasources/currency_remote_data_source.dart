import 'dart:developer';

/// An abstract class defining the contract for fetching currency exchange rates.
///
/// This data source is responsible for retrieving exchange rate data from a remote
/// source, which could be a REST API, a WebSocket, or in this case, a
/// hardcoded map for demonstration purposes.
abstract class CurrencyRemoteDataSource {
  /// Fetches the latest exchange rates relative to a base currency (USD).
  ///
  /// Returns a map where keys are currency codes (e.g., 'EUR') and values
  /// are their exchange rate against USD.
  ///
  /// Throws a [ServerException] if there is an issue fetching the data.
  Future<Map<String, double>> getExchangeRates();
}

/// The concrete implementation of [CurrencyRemoteDataSource].
///
/// This class simulates fetching data from a remote source by returning a
/// hardcoded map of exchange rates. This allows for development and testing
/// of the feature without a live API. It can be easily replaced with a real
/// network implementation later.
class CurrencyRemoteDataSourceImpl implements CurrencyRemoteDataSource {
  /// A hardcoded map of currency exchange rates against USD.
  ///
  /// This map serves as a mock remote data source. The rates are based on the
  /// table provided and represent the value of 1 unit of the specified currency
  /// in USD.
  ///
  /// Data from: Jun 30, 2025 12:22 UTC
  static const Map<String, double> _exchangeRates = {
    'USD': 1.0,
    'EUR': 1.171474,
    'GBP': 1.369340,
    'INR': 0.011656,
    'AUD': 0.652863,
    'CAD': 0.731367,
    'SGD': 0.784420,
    'CHF': 1.253556,
    'MYR': 0.237356,
    'JPY': 0.006925,
    'CNY': 0.139565,
    'ARS': 0.000842,
    'BHD': 2.659574,
    'BWP': 0.075052,
    'BRL': 0.181936,
    'BND': 0.784420,
    'BGN': 0.598965,
    'CLP': 0.001067,
    'COP': 0.000247,
    'CZK': 0.047333,
    'DKK': 0.157011,
    'AED': 0.272294,
    'HKD': 0.127388,
    'HUF': 0.002930,
    'ISK': 0.008238,
    'IDR': 0.000062,
    'IRR': 0.000024,
    'ILS': 0.296703,
    'KZT': 0.001924,
    'KWD': 3.270505,
    'LYD': 0.184690,
    'MUR': 0.022200,
    'MXN': 0.053005,
    'NPR': 0.007282,
    'NZD': 0.605986,
    'NOK': 0.098960,
    'OMR': 2.598530,
    'PKR': 0.003526,
    'PHP': 0.017718,
    'PLN': 0.276146,
    'QAR': 0.274725,
    'RON': 0.230657,
    'RUB': 0.012750,
    'SAR': 0.266667,
    'ZAR': 0.056217,
    'KRW': 0.000737,
    'LKR': 0.003335,
    'SEK': 0.105138,
    'TWD': 0.034218,
    'THB': 0.030737,
    'TTD': 0.147554,
    'TRY': 0.025146,
  };

  @override
  Future<Map<String, double>> getExchangeRates() async {
    // In a real application, this would involve an HTTP call.
    // Here, we simulate a network delay for realism.
    await Future.delayed(const Duration(milliseconds: 300));
    log('Fetched exchange rates from mock data source.');
    return _exchangeRates;
  }
}
