import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trivia_app/core/util/input_converter.dart';

void main() {
  late InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group('stringToUnsignedInt', () {
    test(
      'should return an integer when the string represents an unsigned int',
      () async {
        // arrange

        // act
        final res = inputConverter.stringToUnsignedInteger("653");

        // assert
        expect(res, Right(653));
      },
    );
    test(
      'should return 0 when the string represents 0',
      () async {
        // arrange

        // act
        final res = inputConverter.stringToUnsignedInteger("0");

        // assert
        expect(res, Right(0));
      },
    );

    test(
      'should return a failure when the string is not an unsigned int',
      () async {
        // arrange

        // act
        final res = inputConverter.stringToUnsignedInteger("abc");

        // assert
        expect(res, Left(InvalidInputFailure()));
      },
    );
    test(
      'should return a failure when the string is a negative int',
      () async {
        // arrange

        // act
        final res = inputConverter.stringToUnsignedInteger("-90");

        // assert
        expect(res, Left(InvalidInputFailure()));
      },
    );
    test(
      'should return a failure when the string is double',
      () async {
        // arrange

        // act
        final res = inputConverter.stringToUnsignedInteger("9.40");

        // assert
        expect(res, Left(InvalidInputFailure()));
      },
    );
  });
}
