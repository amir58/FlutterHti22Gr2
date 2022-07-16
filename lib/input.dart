import 'dart:io';

void main() {
  nullSafety();

  List<String> names = [];

  print('Enter names count : ');
  String strNamesCount = stdin.readLineSync() ?? "";
  String? strNamesCount2 = stdin.readLineSync();

  int namesCount = int.tryParse(strNamesCount) ?? 0;

  int counter = 0;

  while (counter < namesCount) {
    print('Enter name ${counter + 1} : ');
    String name = stdin.readLineSync() ?? "";

    names.add(name);

    counter++;
  }
  print(names);
}

void nullSafety() {
  // ? , ?. , ! , !. , ?? , ??=
  String? name;

  // name ??= "Amir";

  print(name);
  print(name?.isEmpty);
  print(name!.isEmpty);
}
