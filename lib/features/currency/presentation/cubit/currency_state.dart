part of 'currency_cubit.dart';

/// The base class for all states related to the currency feature.
///
/// Using an abstract base class allows for better type checking and state
/// management within the BLoC/Cubit pattern.
abstract class CurrencyState extends Equatable {
  /// Creates a [CurrencyState].
  const CurrencyState();

  @override
  List<Object> get props => [];
}

/// The initial state of the currency feature.
///
/// This state is emitted when the feature is first loaded and no data
/// processing has occurred yet.
class CurrencyInitial extends CurrencyState {}

/// The state indicating that currency data is being loaded or calculated.
///
/// This is typically used to show a loading indicator in the UI.
class CurrencyLoading extends CurrencyState {}

/// The state representing that the total spent amount has been successfully calculated.
///
/// It holds the [totalSpent] amount in the base currency (USD).
class CurrencyLoaded extends CurrencyState {
  /// Creates a [CurrencyLoaded] state.
  const CurrencyLoaded({required this.totalSpent});

  /// The calculated total spent amount.
  final double totalSpent;

  @override
  List<Object> get props => [totalSpent];
}

/// The state indicating that an error occurred while processing currency data.
///
/// It contains an error [message] that can be displayed to the user.
class CurrencyError extends CurrencyState {
  /// Creates a [CurrencyError] state.
  const CurrencyError({required this.message});

  /// The error message describing what went wrong.
  final String message;

  @override
  List<Object> get props => [message];
}
