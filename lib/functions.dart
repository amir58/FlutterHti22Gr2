import 'dart:io';

void main() {
  printName();

  // String name = stdin.readLineSync() ?? "";
  printGivenName("name");

  printSum(10, 35);
  printSum(45, 35);
  printSum(34, 35);
  int result = sum(20, 35);
  result++;
  print(result);

  print(sum(30, 15));

  print(sum2(30, 15));

  printFullName("Amir", "Mohammed");
  printFullName("Ali");

  printFullName2(firstName: "Amir", secondName: "Mohamed");
  printFullName2(firstName: "Ali");
}



void printFullName(String firstName, [String secondName = ""]) {
  print('$firstName $secondName');
}

void printFullName2({required String firstName, String secondName = ""}) {
  print('$firstName ${secondName}');
}



int sum2(int numberOne, int numberTwo) => numberOne + numberTwo;

int sum(int numberOne, int numberTwo) {
  return numberOne + numberTwo;
}

void printName() {
  print('Ali');
}

void printGivenName(String name) {
  print(name);
}

void printSum(int numberOne, int numberTwo) {
  print(numberOne + numberTwo);
}

// returnType => DataTypes , dynamic , void
// returnType funName( parameters ) { funBody }

// DataType varName = value;
// var varName = value;
