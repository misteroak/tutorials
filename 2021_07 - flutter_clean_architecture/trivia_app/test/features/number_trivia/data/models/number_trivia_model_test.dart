import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:trivia_app/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:trivia_app/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: '1 is the first number');
  final tNumberTriviaModelDouble = NumberTriviaModel(number: 1, text: '1.0 is the first number');

  test(
    "should be a subclass of NumberTrivia entity",
    () async {
      // arrange

      // act

      // assert
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );

  group('fromJson', () {
    test(
      "should return a valid model when the JSON number is an integer",
      () {
        // arrange
        final Map<String, dynamic> jsonMap = jsonDecode(fixture('trivia.json'));

        // act
        final result = NumberTriviaModel.fromJson(jsonMap);

        // assert
        expect(result, equals(tNumberTriviaModel));
      },
    );

    test(
      "should return a valid model when the JSON number is a double",
      () {
        // arrange
        final Map<String, dynamic> jsonMap = jsonDecode(fixture('trivia_double.json'));

        // act
        final result = NumberTriviaModel.fromJson(jsonMap);

        // assert
        expect(result, equals(tNumberTriviaModelDouble));
      },
    );
  });

  group(
    'toJson',
    () {
      test(
        "should return a JSOn map containing the proper data",
        () {
          // arrange

          // act
          final result = tNumberTriviaModel.toJson();

          // assert
          final expectedMap = {
            "text": "1 is the first number",
            "number": 1,
          };
          expect(result, equals(expectedMap));
        },
      );
    },
  );
}
