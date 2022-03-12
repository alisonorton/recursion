import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main(args) {
  if (args.isEmpty) {
    stdout.write("Please enter file name\n");
  } else {
    //Read file
    new File(args[0].toString()).readAsString().then((String input) {
      var array = new List();

      for (int j = 0; j < input.length; j++) {
        array = input.split(' ');
      }

      //Cast into int
      var numbers = List(array.length);

      for (int i = 0; i < array.length; i++) {
        numbers[i] = int.parse(array[i]);
        stdout.write("${numbers[i]}\n");
      }
      stdout.write("\n");

      //DIVIDE FUNCTION
      int divide(p, r) {
        int x = numbers[r];
        int i = p - 1;

        for (int j = p; j < r; j++) {
          if (numbers[j] <= x) {
            i += 1;
            int hold = numbers[i];
            numbers[i] = numbers[j];
            numbers[j] = hold;
          }
        }
        int hold = numbers[i + 1];
        numbers[i + 1] = numbers[r];
        numbers[r] = hold;

        return (i + 1);
      }

      void sort205(p, r) {
        if (p < r) {
          int q = divide(p, r);
          sort205(p, q - 1);
          sort205(q + 1, r);
        }
      }

      //Calling the function
      sort205(0, numbers.length - 1);

      //Print results
      for (int i = 0; i < numbers.length; i++) {
        stdout.write("${numbers[i]}\n");
      }
    });
  }
}
