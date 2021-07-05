import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:trivia_app/core/usecases/usecase.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/util/input_converter.dart';
import '../../domain/entities/number_trivia.dart';
import '../../domain/usecases/get_concrete_number_trivia.dart';
import '../../domain/usecases/get_random_number_trivia.dart';

part 'number_trivia_event.dart';
part 'number_trivia_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
// const String SERVER_FAILURE_MESSAGE = 100; // for localization, bloc shouldn't deal with localization, that's a UI concern
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE = 'Invalid Input - The number must be a positive integer';
const String UNEXPECTED_ERROR_MESSAGE = "Unexpected error";

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

  NumberTriviaBloc({
    required this.getConcreteNumberTrivia,
    required this.getRandomNumberTrivia,
    required this.inputConverter,
  }) : super(Empty());

  @override
  Stream<NumberTriviaState> mapEventToState(
    NumberTriviaEvent event,
  ) async* {
    if (event is GetTriviaForConcreteNumber) {
      yield* _handleGetTriviaForConcreteNumberEvent(event);
    } else if (event is GetTriviaForRandomNumber) {
      yield* _handleGetTriviaForRandomNumber();
    }
  }

  Stream<NumberTriviaState> _handleGetTriviaForRandomNumber() async* {
    yield Loading();
    final failureOrTrivia = await getRandomNumberTrivia(NoParams());
    yield* _eitherLoadedOrErrorState(failureOrTrivia);
  }

  Stream<NumberTriviaState> _handleGetTriviaForConcreteNumberEvent(GetTriviaForConcreteNumber event) async* {
    final inputEither = inputConverter.stringToUnsignedInteger(event.number);

    yield* inputEither.fold(
      // Left - deal with failure
      (failure) async* {
        yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
      },
      // Right - success case
      (integer) async* {
        yield Loading();
        final failureOrTrivia = await getConcreteNumberTrivia(Params(number: integer));
        yield* _eitherLoadedOrErrorState(failureOrTrivia);
      },
    );
  }

  Stream<NumberTriviaState> _eitherLoadedOrErrorState(
    Either<Failure, NumberTrivia> failureOrTrivia,
  ) async* {
    yield failureOrTrivia.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (numberTrivia) => Loaded(numberTrivia),
    );
  }

  // Super important that the block deals with all the possible error messages
  // so that we can pass a meaningful error message to the UI
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;

      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;

      default:
        return UNEXPECTED_ERROR_MESSAGE;
    }
  }
}
