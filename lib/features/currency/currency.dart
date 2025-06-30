/// Barrel file for the currency feature.
///
/// This file exports all the necessary components from the currency feature's
/// subdirectories, making them easily accessible from other parts of the app.
library;

// Data Layer
export 'data/datasources/currency_remote_data_source.dart';
export 'data/repositories/currency_repository_impl.dart';
// Domain Layer
export 'domain/repositories/currency_repository.dart';
export 'domain/usecases/get_total_spent_usecase.dart';
// Presentation Layer
export 'presentation/presentation.dart';
