import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

// General failures

// The repository will catch exceptions ("an error happened on the outside") and convert them
// into Failures which will be return as part of the Either<>
// USually Failures map 1:1 to Exceptions

class ServerFailure extends Failure {
  List get props => [];
}

class CacheFailure extends Failure {
  List get props => [];
}
