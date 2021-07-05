import 'package:dartz/dartz.dart';

import '../error/failures.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    int res;
    try {
      res = int.parse(str);
      if (res < 0) return Left(InvalidInputFailure());
    } on FormatException {
      return Left(InvalidInputFailure());
    }

    return Right(res);
  }
}

class InvalidInputFailure extends Failure {
  @override
  List<Object> get props => [];
}
