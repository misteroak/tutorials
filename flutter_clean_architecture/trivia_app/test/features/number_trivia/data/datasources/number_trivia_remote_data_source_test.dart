import 'dart:convert';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:trivia_app/core/error/exceptions.dart';
import 'package:trivia_app/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:trivia_app/features/number_trivia/data/models/number_trivia_model.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'number_trivia_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late NumberTriviaRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = NumberTriviaRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClient(String jsonString, {int response = 200}) {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(jsonString, response));
  }

  group('getConcreteNumberTrivia', () {
    final tNumber = 50;
    final tTriviaModelJsonString = fixture('trivia.json');
    final tTriviaModelJson = json.decode(tTriviaModelJsonString);
    final tNumberTriviaModel = NumberTriviaModel.fromJson(tTriviaModelJson);
    final remoteUrl = API_URL + tNumber.toString();
    test(
      '''should perform a GET request on a url 
      with the endpoint application/json header''',
      () async {
        // arrange
        setUpMockHttpClient(tTriviaModelJsonString);

        // act
        dataSource.getConcreteNumberTrivia(tNumber);

        // assert
        verify(mockHttpClient.get(Uri.parse(remoteUrl), headers: {"Content-Type": "application/json"}));
      },
    );

    test(
      'should return NumberTrivia when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClient(tTriviaModelJsonString);

        // act
        final result = await dataSource.getConcreteNumberTrivia(tNumber);

        // assert
        expect(result, equals(tNumberTriviaModel));
      },
    );

    test(
      'should throw ServerException on failed response (not 200)',
      () async {
        // arrange
        setUpMockHttpClient("bla bla", response: 404);

        // act
        final call = dataSource.getRandomNumberTrivia;

        // assert
        expect(() => call(), throwsA(TypeMatcher<ServerException>()));
      },
    );
  });

  group('getRandomNumberTrivia', () {
    final tTriviaModelJsonString = fixture('trivia.json');
    final tTriviaModelJson = json.decode(tTriviaModelJsonString);
    final tNumberTriviaModel = NumberTriviaModel.fromJson(tTriviaModelJson);
    final remoteUrl = RANDOM_TRIVIA_URL;
    test(
      '''should perform a GET request on a url 
      with the random endpoint application/json header''',
      () async {
        // arrange
        setUpMockHttpClient(tTriviaModelJsonString);

        // act
        dataSource.getRandomNumberTrivia();

        // assert
        verify(mockHttpClient.get(Uri.parse(remoteUrl), headers: {"Content-Type": "application/json"}));
      },
    );

    test(
      'should return NumberTrivia when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClient(tTriviaModelJsonString);

        // act
        final result = await dataSource.getRandomNumberTrivia();

        // assert
        expect(result, equals(tNumberTriviaModel));
      },
    );

    test(
      'should throw ServerException on failed response (not 200)',
      () async {
        // arrange
        setUpMockHttpClient("bla bla", response: 404);

        // act
        final call = dataSource.getConcreteNumberTrivia;

        // assert
        expect(() => call(10), throwsA(TypeMatcher<ServerException>()));
      },
    );
  });
}
