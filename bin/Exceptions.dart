class ExcessiveFormatException implements Exception {
  final String message =
      "You inputed more than one operator, please re-enter your calculations";

  @override
  String toString() {
    return message;
  }
}

class UnidentifiableOperatorException implements Exception {
  final String message =
      "You inputed an operator that is not defined, please re-enter your calculations";

  @override
  String toString() {
    return message;
  }
}

class EdgeOperatorException implements Exception {
  final String message =
      "You put an operator on the outer edges of the funciton, please re-enter your calculations";

  @override
  String toString() {
    return message;
  }
}

class NonIntCharacterException implements Exception {
  final String message =
      "You have a non Integer character in your calculation, please re-enter your calculations";

  @override
  String toString() {
    return message;
  }
}
