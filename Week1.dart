void main() {
  // 1. Define and initialize variables
  int myInt = 10;
  double myDouble = 20.5;
  String myString = "30";
  bool myBool = true;
  List<int> myList = [3, 15, 102, -5, 8];

  print("Variables:");
  print("int: $myInt, double: $myDouble, String: $myString, bool: $myBool, List: $myList\n");

  // 2. Type conversion functions
  int stringToInt(String s) => int.tryParse(s) ?? 0;
  double stringToDouble(String s) => double.tryParse(s) ?? 0.0;

  String intToString(int i) => i.toString();
  double intToDouble(int i) => i.toDouble();

  // 3. convertAndDisplay function
  void convertAndDisplay(String numberString) {
    int intVal = stringToInt(numberString);
    double doubleVal = stringToDouble(numberString);

    print("Converting '$numberString':");
    print("As int: $intVal");
    print("As double: $doubleVal\n");
  }

  convertAndDisplay("123");

  // 4. If-Else Statements
  int number = -7;
  if (number > 0) {
    print("$number is positive");
  } else if (number < 0) {
    print("$number is negative");
  } else {
    print("$number is zero");
  }

  int age = 20;
  if (age >= 18) {
    print("Age $age: Eligible to vote\n");
  } else {
    print("Age $age: Not eligible to vote\n");
  }

  // 5. Switch Case for days of the week
  int day = 3;
  print("Day $day is:");
  switch (day) {
    case 1:
      print("Monday");
      break;
    case 2:
      print("Tuesday");
      break;
    case 3:
      print("Wednesday");
      break;
    case 4:
      print("Thursday");
      break;
    case 5:
      print("Friday");
      break;
    case 6:
      print("Saturday");
      break;
    case 7:
      print("Sunday");
      break;
    default:
      print("Invalid day");
  }

  print("");

  // 6. Loops
  print("For loop (1 to 10):");
  for (int i = 1; i <= 10; i++) {
    print(i);
  }

  print("\nWhile loop (10 to 1):");
  int j = 10;
  while (j >= 1) {
    print(j);
    j--;
  }

  print("\nDo-while loop (1 to 5):");
  int k = 1;
  do {
    print(k);
    k++;
  } while (k <= 5);

  print("");

  // 7. Complex Example
  print("Analyzing list: $myList\n");
  for (int num in myList) {
    print("Number: $num");

    // Even or odd
    if (num % 2 == 0) {
      print("It's even");
    } else {
      print("It's odd");
    }

    // Categorize using switch (via helper function)
    print("Category: ${categorizeNumber(num)}\n");
  }
}

// Helper function to categorize numbers
String categorizeNumber(int num) {
  switch (num) {
    case >= 1 && <= 10:
      return "Small";
    case >= 11 && <= 100:
      return "Medium";
    case >= 101:
      return "Large";
    default:
      return "Undefined (zero or negative)";
  }
}
