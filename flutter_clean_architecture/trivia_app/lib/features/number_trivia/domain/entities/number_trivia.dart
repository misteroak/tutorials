import 'package:equatable/equatable.dart';

class NumberTrivia extends Equatable {
  // see http://numbersapi.com/42?json
  final String text;
  final int number;

  NumberTrivia({
    required this.text,
    required this.number,
  });

  @override
  List<Object> get props => [text, number];
}
