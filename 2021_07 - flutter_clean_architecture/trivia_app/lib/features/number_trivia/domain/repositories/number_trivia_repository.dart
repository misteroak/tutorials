import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      int number); // In the Either - L is always the error, R is the success
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
