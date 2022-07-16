void main() {
  String dateTime = "2/7/2022-2:19PM";

  List<String> dateTimes = dateTime.split("-");

  print(dateTimes);
  for (var value in dateTimes) {
    print(value);
  }
  print('- - - - - - - -');
  String text = "Welcome in flutter course";
  print(text.isEmpty);
  print(text.isNotEmpty);

  print(text.toLowerCase());
  print(text.toUpperCase());

  print(text.contains("in"));

  print('- - - - - - - - - -');
  String email = " amir@gmail.com   ";
  print(email.length);
  email = email.trim();
  email = email.trimRight();
  email = email.trimLeft();
  print(email.length);

  print('- - - - - - - -  -');

  String phoneNumber = "0020111 6035-002";
  print(phoneNumber);
  print(phoneNumber.length);

  phoneNumber = phoneNumber
          .replaceAll("+2", "")
          .replaceAll(" ", "")
          .replaceAll("-", "");

  if(phoneNumber.startsWith("002")){
    phoneNumber = phoneNumber.replaceFirst("002", "");
  }

  print(phoneNumber);
  print(phoneNumber.length);

}
