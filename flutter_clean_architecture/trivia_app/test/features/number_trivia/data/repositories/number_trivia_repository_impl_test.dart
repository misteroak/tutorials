import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trivia_app/core/error/exceptions.dart';
import 'package:trivia_app/core/error/failures.dart';
import 'package:trivia_app/core/network/network_info.dart';
import 'package:trivia_app/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:trivia_app/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:trivia_app/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:trivia_app/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:trivia_app/features/number_trivia/domain/entities/number_trivia.dart';

import 'number_trivia_repository_impl_test.mocks.dart';

@GenerateMocks([NumberTriviaRemoteDataSource, NumberTriviaLocalDataSource, NetworkInfo])
void main() {
  late NumberTriviaRepositoryImpl repository;
  late MockNumberTriviaRemoteDataSource mockRemoteDataSource;
  late MockNumberTriviaLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockNumberTriviaRemoteDataSource();
    mockLocalDataSource = MockNumberTriviaLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = NumberTriviaRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  /// We have pretty much the same tests for concrete number and for random number. We'll need to test
  /// both in both online and offline. So we're creating these wrappers below.
  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        // tell mocked NetworkInfo to always return true
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is online', () {
      setUp(() {
        // tell mocked NetworkInfo to always return true
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group(
    'getConcreteNumberTrivia:',
    () {
      final tNumber = 1;
      final tNumberTriviaModel = NumberTriviaModel(number: tNumber, text: "Test trivia");
      final NumberTrivia tNumberTrivia =
          tNumberTriviaModel; // cast into the entity type - we are testing the repository
      test(
        'should check if the device is online',
        () async {
          // arrange
          // tell mocked NetworkInfo to always return true
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(mockRemoteDataSource.getConcreteNumberTrivia(any)).thenAnswer((_) async => tNumberTriviaModel);

          // act
          await repository.getConcreteNumberTrivia(tNumber);

          // assert
          verify(mockNetworkInfo.isConnected); // verify the mock is connected has been called
        },
      );

      runTestsOnline(
        // run test online for get concrete number
        () {
          test(
            'should return remote data when the call to remote data source is successful',
            () async {
              // arrange
              when(mockRemoteDataSource.getConcreteNumberTrivia(any)).thenAnswer((_) async => tNumberTriviaModel);

              // act
              final result = await repository.getConcreteNumberTrivia(tNumber);

              // assert
              verify(mockRemoteDataSource.getConcreteNumberTrivia(
                  tNumber)); // verify remote data source was called with the same tNumber we passed in
              expect(result, equals(Right(tNumberTrivia)));
            },
          );

          test(
            'should cache the data locally when the call to remote  data source is successful',
            () async {
              // arrange
              when(mockRemoteDataSource.getConcreteNumberTrivia(any)).thenAnswer((_) async => tNumberTriviaModel);

              // act
              await repository.getConcreteNumberTrivia(tNumber);

              // assert
              verify(mockRemoteDataSource.getConcreteNumberTrivia(
                  tNumber)); // verify remote data source was called with the same tNumber we passed in
              verify(mockLocalDataSource.cacheNumberTrivia(tNumberTriviaModel));
            },
          );

          test(
            'should return server failure when call to remote data source is unsuccessful',
            () async {
              // arrange
              when(mockRemoteDataSource.getConcreteNumberTrivia(any)).thenThrow(ServerException());

              // act
              final result = await repository.getConcreteNumberTrivia(tNumber);

              // assert
              verify(mockRemoteDataSource.getConcreteNumberTrivia(
                  tNumber)); // verify remote data source was called with the same tNumber we passed in
              verifyZeroInteractions(mockLocalDataSource); // verify nothing is cached
              expect(result, equals(Left(ServerFailure())));
            },
          );
        },
      );
      runTestsOffline(
        () {
          test(
            'should return last locally cached data when the cached data is present',
            () async {
              // arrange
              // when(mockRemoteDataSource.getConcreteNumberTrivia(any)).thenThrow(ServerException());
              when(mockLocalDataSource.getLastNumberTrivia()).thenAnswer((_) async => tNumberTriviaModel);
              // act
              final result = await repository.getConcreteNumberTrivia(tNumber);

              // assert
              verifyZeroInteractions(mockRemoteDataSource); // verify no interactions with remote data source
              verify(mockLocalDataSource.getLastNumberTrivia());
              expect(result, Right(tNumberTrivia));
            },
          );

          test(
            'should return cache error when there is no cache data present',
            () async {
              // arrange
              // when(mockRemoteDataSource.getConcreteNumberTrivia(any)).thenThrow(ServerException());
              when(mockLocalDataSource.getLastNumberTrivia()).thenThrow(CacheException());
              // act
              final result = await repository.getConcreteNumberTrivia(tNumber);

              // assert
              verifyZeroInteractions(mockRemoteDataSource); // verify no interactions with remote data source
              verify(mockLocalDataSource.getLastNumberTrivia());
              expect(result, Left(CacheFailure()));
            },
          );
        },
      );
    },
  );
  group(
    'getRandomNumberTrivia:',
    () {
      final tNumberTriviaModel = NumberTriviaModel(number: 123, text: "Test trivia");
      final NumberTrivia tNumberTrivia =
          tNumberTriviaModel; // cast into the entity type - we are testing the repository
      test(
        'should check if the device is online',
        () async {
          // arrange
          // tell mocked NetworkInfo to always return true
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(mockRemoteDataSource.getRandomNumberTrivia()).thenAnswer((_) async => tNumberTriviaModel);

          // act
          await repository.getRandomNumberTrivia();

          // assert
          verify(mockNetworkInfo.isConnected); // verify the mock is connected has been called
        },
      );

      runTestsOnline(
        // run test online for get concrete number
        () {
          test(
            'should return remote data when the call to remote data source is successful',
            () async {
              // arrange
              when(mockRemoteDataSource.getRandomNumberTrivia()).thenAnswer((_) async => tNumberTriviaModel);

              // act
              final result = await repository.getRandomNumberTrivia();

              // assert
              verify(mockRemoteDataSource
                  .getRandomNumberTrivia()); // verify remote data source was called with the same tNumber we passed in
              expect(result, equals(Right(tNumberTrivia)));
            },
          );

          test(
            'should cache the data locally when the call to remote  data source is successful',
            () async {
              // arrange
              when(mockRemoteDataSource.getRandomNumberTrivia()).thenAnswer((_) async => tNumberTriviaModel);

              // act
              await repository.getRandomNumberTrivia();

              // assert
              verify(mockRemoteDataSource
                  .getRandomNumberTrivia()); // verify remote data source was called with the same tNumber we passed in
              verify(mockLocalDataSource.cacheNumberTrivia(tNumberTriviaModel));
            },
          );

          test(
            'should return server failure when call to remote data source is unsuccessful',
            () async {
              // arrange
              when(mockRemoteDataSource.getRandomNumberTrivia()).thenThrow(ServerException());

              // act
              final result = await repository.getRandomNumberTrivia();

              // assert
              verify(mockRemoteDataSource
                  .getRandomNumberTrivia()); // verify remote data source was called with the same tNumber we passed in
              verifyZeroInteractions(mockLocalDataSource); // verify nothing is cached
              expect(result, equals(Left(ServerFailure())));
            },
          );
        },
      );
      runTestsOffline(
        () {
          test(
            'should return last locally cached data when the cached data is present',
            () async {
              // arrange
              // when(mockRemoteDataSource.getConcreteNumberTrivia(any)).thenThrow(ServerException());
              when(mockLocalDataSource.getLastNumberTrivia()).thenAnswer((_) async => tNumberTriviaModel);
              // act
              final result = await repository.getRandomNumberTrivia();

              // assert
              verifyZeroInteractions(mockRemoteDataSource); // verify no interactions with remote data source
              verify(mockLocalDataSource.getLastNumberTrivia());
              expect(result, Right(tNumberTrivia));
            },
          );

          test(
            'should return cache error when there is no cache data present',
            () async {
              // arrange
              // when(mockRemoteDataSource.getConcreteNumberTrivia(any)).thenThrow(ServerException());
              when(mockLocalDataSource.getLastNumberTrivia()).thenThrow(CacheException());
              // act
              final result = await repository.getRandomNumberTrivia();

              // assert
              verifyZeroInteractions(mockRemoteDataSource); // verify no interactions with remote data source
              verify(mockLocalDataSource.getLastNumberTrivia());
              expect(result, Left(CacheFailure()));
            },
          );
        },
      );
    },
  );
}
