import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pemo_test_project/core/error/failures.dart';

/// [UseCase] is an abstract class that defines a contract for use cases.
///
/// A use case represents a specific business logic operation.
/// It takes [Params] as input and returns a [Future] of [Either] [Failure] or [Type].
abstract class UseCase<Type, Params> {
  /// Executes the use case with the given [params].
  ///
  /// Returns a [Future] of [Either] [Failure] or [Type].
  Future<Either<Failure, Type>> call(Params params);
}

/// [NoParams] is a class that represents the absence of parameters for a use case.
class NoParams extends Equatable {
  @override
  // ignore: anvalid_override
  List<Object> get props => [];
}
