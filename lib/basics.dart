import 'dart:io';

void main() {
  print('HelloFlutter');

  // DataTypes => String , int , double , bool , dynamic
  // DataType varName = value;

  String myName = 'Amir';
  double number = 1.6;
  bool working = true;

  var test = 2;
  test = 1;

  // Naming variables and functions
  // camelCase
  //

  String firstName = "Amir";

  String welcomeInFlutterCourseMessage = "";

  // print('Enter your name : ');
  //
  // String username = stdin.readLineSync() ?? "NO NAME";
  //
  // print('Enter your age : ');
  //
  // String age = stdin.readLineSync() ?? "";
  //
  // print('- - - - - - - - - - ');
  // if (username.isEmpty) {
  //   print("Welcome user");
  // } else {
  //   print("Welcome $username");
  // }
  //
  // print('Your age $age');

  print('- - - - - - - - -');

  // if ( condition ) {  } else {  }

  // print('Enter order status : ');
  // String orderStatus = stdin.readLineSync() ?? "";
  //
  // if (orderStatus == "onWay") {
  //   print('yellow');
  // } else if (orderStatus == "refused") {
  //   print("RED");
  // } else if (orderStatus == "finished") {
  //   print("GREEN");
  // } else {
  //   print('Order status unknown');
  // }
  //
  // switch (orderStatus) {
  //   case "onWay":
  //     {
  //       print('YELLOW');
  //     }
  //     break;
  //   case "refused":
  //     {
  //       print('RED');
  //       break;
  //     }
  //   case "finished":
  //     {
  //       print('GREEN');
  //       break;
  //     }
  //   default:
  //     {
  //       print('Order status unknown ');
  //       break;
  //     }
  // }

  var girlNames = ["Aya", "Nada", "Hanan"];
  var names = ['Amir', "Ali", "Ahmed", "Mohamed"];

  names.add("Mahmoud");
  names.addAll(girlNames);

  // names.clear();
  // names.isEmpty

  print(names);

  for (var name in names) {
    print(name);
  }
  print('- = - = - = -');

  print(names.length);
  print(names.isEmpty);
  print(names.isNotEmpty);
  print(names.first);
  print(names.last);
  // print(names.single);
  print(names.contains("amir"));
  print(names.elementAt(5));
  print(names.removeAt(7));
  print(names.remove("Amir"));
  print(names.removeLast());
  print(names[0]);
  print(names[1]);
  print(names[2]);
  print(names[3]);

  int x = 0;
  while (x < 5) {
    print("While $x");
    x++;
  }

  for (int x = 0; x < 5; x++) {
    print("for $x");
  }

  int y = 0;
  do {
    print("do while $y");
    y++;
  } while (y > 5);

  for(int i =0 ; i< names.length; i++){
    print(names[i]);
  }

  for (var value in names) {
    print(value);
  }



}
