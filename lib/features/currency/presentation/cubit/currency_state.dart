import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_state.freezed.dart';

/// The base class for all states related to the currency feature.
///
/// Using an abstract base class allows for better type checking and state
/// management within the BLoC/Cubit pattern.

@freezed
abstract class CurrencyState with _$CurrencyState {
  const factory CurrencyState.initial() = _Initial;
  const factory CurrencyState.loading() = _Loading;
  const factory CurrencyState.loaded({
    required double totalSpent,
  }) = _Loaded;
  const factory CurrencyState.error({required String message}) = _Error;
}
