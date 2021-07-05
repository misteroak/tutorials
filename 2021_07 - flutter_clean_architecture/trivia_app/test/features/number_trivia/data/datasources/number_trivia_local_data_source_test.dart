import 'dart:convert';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trivia_app/core/error/exceptions.dart';
import 'package:trivia_app/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:trivia_app/features/number_trivia/data/models/number_trivia_model.dart';

import '../../../../fixtures/fixture_reader.dart';

import 'number_trivia_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late NumberTriviaLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(
    () {
      mockSharedPreferences = MockSharedPreferences();
      dataSource = NumberTriviaLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
    },
  );

  group('getLastNumberTrivia', () {
    final tNumberTriviaModelJson = fixture('trivia_cached.json');
    final tNumberTriviaModel = NumberTriviaModel.fromJson(json.decode(tNumberTriviaModelJson));
    test(
      'should return NumberTrivia from SharedPreferences when one is in the cache',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(tNumberTriviaModelJson);

        // act
        final trivia = await dataSource.getLastNumberTrivia();

        // assert
        verify(mockSharedPreferences.getString(CACHED_NUMBER_TRIVIA_KEY));
        verifyNoMoreInteractions(mockSharedPreferences);
        expect(trivia, equals(tNumberTriviaModel));
      },
    );

    test(
      'should throw a CacheException when there is nothing in cache',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(null);

        // act
        final call = dataSource.getLastNumberTrivia;

        // assert
        // expect(() => dataSource.getLastNumberTrivia(), throwsA(TypeMatcher<CacheException>()));
        expect(() => call(), throwsA(TypeMatcher<CacheException>()));
      },
    );
  });

  group(
    'cacheNumberTrivia',
    () {
      final tNumberTriviaModelJson = fixture('trivia_cached.json');
      final tNumberTriviaModel = NumberTriviaModel.fromJson(json.decode(tNumberTriviaModelJson));

      test(
        'should call SharedPreference to cache the data',
        () async {
          // arrange
          when(mockSharedPreferences.setString(CACHED_NUMBER_TRIVIA_KEY, any)).thenAnswer((_) async => true);
          // act
          dataSource.cacheNumberTrivia(tNumberTriviaModel);
          // assert
          verify(mockSharedPreferences.setString(CACHED_NUMBER_TRIVIA_KEY, json.encode(tNumberTriviaModel.toJson())));
        },
      );
    },
  );
}
