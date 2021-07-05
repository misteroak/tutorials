import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trivia_app/core/network/network_info.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  late NetworkInfoImpl networkInfoImpl;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(
    () async {
      mockInternetConnectionChecker = MockInternetConnectionChecker();
      networkInfoImpl = NetworkInfoImpl(mockInternetConnectionChecker);
    },
  );

  group(
    'is connected',
    () {
      test(
        'should forward the call to DataConnectionTester.hasConnection',
        () async {
          // arrange
          final tHasConnectionFuture = Future.value(true);
          when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) =>
              tHasConnectionFuture); // we want to make sure that NetworkInfoImpl is returning the exact value as DataConnectionTester.hasConnection, so we mock the return to be a future which we can then compare to below (compare by ref, not by value)

          // act
          final result = networkInfoImpl.isConnected; // here, the result is the Future

          // assert
          // verify(mockDataConnectionChecker.hasConnection);
          expect(result, tHasConnectionFuture);
        },
      );
    },
  );
}
