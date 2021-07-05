import 'dart:io';

String fixture(String fileName) => File('test/fixtures/$fileName').readAsStringSync();
// String fixture(String fileName) => Directory.current.absolute.toString();
