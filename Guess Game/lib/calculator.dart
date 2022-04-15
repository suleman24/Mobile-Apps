import 'dart:math';

class calculator{
  calculator({required this.num,required this.max,required this.min});

  final int num;
  final int max;
  final int min;


  String calculate()
  {
    return num.toStringAsFixed(1);
  }


  String getresult() {
    if (num >= min && num <= max) {
      return 'Perfect';
    } else if (num > max ) {
      return 'You are too low';
    } else {
      return 'You are too high';
    }
  }


  String getinterpretation() {
    if (num >= min && num <= max) {
      return 'It is the Exact Guessed Range';
    } else if (num > max ) {
      return 'Exact number is greater than the Guessed range';
    } else {
      return 'Exact number is smaller than the Guessed range';
    }
  }

}