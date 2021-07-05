import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trivia_app/core/util/input_converter.dart';
import 'package:trivia_app/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:trivia_app/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:trivia_app/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';

import 'number_trivia_bloc_test.mocks.dart';

@GenerateMocks([GetConcreteNumberTrivia, GetRandomNumberTrivia, InputConverter])
void main() {
  late NumberTriviaBloc bloc;

  late MockGetConcreteNumberTrivia mockGetConcreteNumberTrivia;
  late MockGetRandomNumberTrivia mockGetRandomNumberTrivia;
  late MockInputConverter mockInputConverter;

  setUp(() {
    mockGetConcreteNumberTrivia = MockGetConcreteNumberTrivia();
    mockGetRandomNumberTrivia = MockGetRandomNumberTrivia();
    mockInputConverter = MockInputConverter();

    bloc = NumberTriviaBloc(
      getConcreteNumberTrivia: mockGetConcreteNumberTrivia,
      getRandomNumberTrivia: mockGetRandomNumberTrivia,
      inputConverter: mockInputConverter,
    );
  });

  test(
    'initial state should be Empty',
    () async {
      // arrange

      // act

      // assert
      expect(bloc.state, equals(Empty()));
    },
  );

  group('getTriviaForConcreteNumber', () {
    final tNumberString = '1';
    final tNumberParsed = 1;

    test(
      'should call the InputConverter to validate and convert the string to an unsigned int',
      () async {
        // arrange
        when(mockInputConverter.stringToUnsignedInteger(any)).thenReturn(Right(tNumberParsed));

        // act
        bloc.add(GetTriviaForConcreteNumber(tNumberString));

        // the block is async, so the verify is called before the bloc gets to fully run and the test would fail.
        // this halts the test until it is called.
        await untilCalled(mockInputConverter.stringToUnsignedInteger(any));

        // assert
        verify(mockInputConverter.stringToUnsignedInteger(tNumberString));
      },
    );

    // Skipping this test for now - go over this one instead - https://www.youtube.com/watch?v=S6jFBiiP0Mc
    // test(
    //   'should emit [Error] when the input is invalid',
    //   () async {
    //     // arrange
    //     when(mockInputConverter.stringToUnsignedInteger(any)).thenReturn(Left(InvalidInputFailure()));

    //     // assert later
    //     // The assert here comes before the act. Why? Because things are async. We first want
    //     // to register what we'll be testing, AND we're doing it using expectLater!
    //     // then we execute the test.

    //     expectLater(
    //       // expectLater - will wait up 30 seconds for the stream to emit
    //       bloc,
    //       emitsInOrder(
    //         [
    //           Empty(), // blocks always emit their initial state, which in our case is empty
    //           // Error(message: INVALID_INPUT_FAILURE_MESSAGE),
    //         ],
    //       ),
    //     );

    //     // act
    //     // bloc.add(GetTriviaForConcreteNumber(tNumberString));
    //   },
    // );
  });
}
