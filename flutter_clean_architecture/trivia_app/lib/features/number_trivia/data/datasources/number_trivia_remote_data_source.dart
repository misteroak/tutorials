import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trivia_app/core/error/exceptions.dart';

import '../models/number_trivia_model.dart';

abstract class NumberTriviaRemoteDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

const API_URL = 'http://numbersapi.com/';
const RANDOM_TRIVIA_URL = API_URL + 'random/trivia';

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  final http.Client client;

  NumberTriviaRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async {
    Uri uri = Uri.parse(API_URL + number.toString());
    return _getTriviaNumberFromUrl(uri);
  }

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() async {
    Uri uri = Uri.parse(RANDOM_TRIVIA_URL);
    return _getTriviaNumberFromUrl(uri);
  }

  Future<NumberTriviaModel> _getTriviaNumberFromUrl(Uri uri) async {
    final response = await client.get(uri, headers: {"Content-Type": "application/json"});
    if (response.statusCode != 200) throw ServerException();
    return NumberTriviaModel.fromJson(json.decode(response.body));
  }
}
