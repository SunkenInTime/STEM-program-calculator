import 'dart:io';
import 'dart:math';

import 'calculator.dart';

void main() {
  //Key value pairs
  // List<String> operators = ["-","%","*","+","/"];

  String? input;

  final calculator = Calculator();

  while ((input = stdin.readLineSync() ?? "") != "exit") {
    print(calculator.evaluateInput(input));
  }
}
