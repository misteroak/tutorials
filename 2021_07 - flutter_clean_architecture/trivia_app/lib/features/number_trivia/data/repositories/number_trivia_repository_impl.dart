import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/number_trivia.dart';
import '../../domain/repositories/number_trivia_repository.dart';
import '../datasources/number_trivia_local_data_source.dart';
import '../datasources/number_trivia_remote_data_source.dart';
import '../models/number_trivia_model.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number) async {
    return await _getTrivia(() => remoteDataSource.getConcreteNumberTrivia(number));
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async {
    return await _getTrivia(() => remoteDataSource.getRandomNumberTrivia());
  }

  Future<Either<Failure, NumberTrivia>> _getTrivia(Future<NumberTriviaModel> Function() getConcreteOrRandom) async {
    Either<Failure, NumberTrivia> result = Left(ServerFailure());

    try {
      if (await networkInfo.isConnected) {
        final numberTrivia = await getConcreteOrRandom();
        localDataSource.cacheNumberTrivia(numberTrivia);
        result = Right(numberTrivia);
      } else {
        final numberTrivia = await localDataSource.getLastNumberTrivia();
        result = Right(numberTrivia);
      }
    } on ServerException {
      result = Left(ServerFailure());
    } on CacheException {
      result = Left(CacheFailure());
    }

    return result;
  }
}
