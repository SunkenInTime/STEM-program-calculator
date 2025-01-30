import 'Exceptions.dart';

enum Operators { division, multiplication, addition, subtraction, modDivision }

class Calculator {
  Map<String, Operators> operatorValues = {
    "-": Operators.subtraction,
    "+": Operators.addition,
    "/": Operators.division,
    "*": Operators.multiplication,
    "%": Operators.modDivision,
  };

  String evaluateInput(String input) {
    String result = "";
    String cleanString = input.replaceAll(" ", "");

    final (Operators, int)? currentOperator = _validateInput(cleanString);

    if (currentOperator == null) return "";

    final (int, int) nums = (
      int.parse(cleanString.substring(0, currentOperator.$2)),
      int.parse(cleanString.substring(currentOperator.$2 + 1)),
    );

    switch (currentOperator.$1) {
      case Operators.division:
        result = (nums.$1 / nums.$2).toString();
      case Operators.multiplication:
        result = (nums.$1 * nums.$2).toString();
      case Operators.addition:
        result = (nums.$1 + nums.$2).toString();
      case Operators.subtraction:
        result = (nums.$1 - nums.$2).toString();
      case Operators.modDivision:
        result = (nums.$1 % nums.$2).toString();
    }
    return result;
  }

  (Operators, int)? _validateInput(String input) {
    Operators? currentOperator;
    List<String> inputList = input.split("");
    int operatorIndex = 0;
    try {
      for (final (index, let) in inputList.indexed) {
        if (operatorValues.containsKey(let)) {
          if (currentOperator == null) {
            currentOperator = operatorValues[let];
            operatorIndex = index;
          } else
            throw ExcessiveFormatException();

          if (index == 0 || (index + 1) >= inputList.length)
            throw EdgeOperatorException();
        } else if (int.tryParse(let) == null) {
          throw NonIntCharacterException();
        }
      }

      if (currentOperator == null) throw UnidentifiableOperatorException();
      return (currentOperator, operatorIndex);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
