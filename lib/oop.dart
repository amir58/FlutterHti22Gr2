import 'dart:io';

import 'package:flutter/material.dart';

const int camera = 1;

void main() {

  print('OOP');

  String name = "";
  String age = "";
  String phoneNumber = "";
  String address = "";

  print('Name : $name');
  print('Age : $age');
  print('Phone number : $phoneNumber');
  print('Address : $address');
  print('- - - - - - - - - - ');

  String name2 = "";
  String age2 = "";
  String phoneNumber2 = "";
  String address2 = "";

  print('Name : $name2');
  print('Age : $age2');
  print('Phone number : $phoneNumber2');
  print('Address : $address2');
  print('- - - - - - - - - - ');

  // ClassName objName = ClassName();
  User userOne = User("Ahmed", "20", "011", "Cairo");
  userOne._name = "o";
  userOne.setName("o");

  User userTwo = User("Ali", "20", "012", "Alex");

  User userThree = User.phone("0128734612487");

  Text("Login Screen");
}

class User {
  String _name = "";
  String age = "";
  String _phoneNumber = "";
  String address = "";

  User(this._name, this.age, this._phoneNumber, this.address) {
    printUserData();
  }


  User.phone(this._phoneNumber);

  set phoneNumber(String value) {
    if (value.length == 11) {
      _phoneNumber = value;
    } else {
      print('Invalid phone number!');
    }
  }

  void setPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 11) {
      _phoneNumber = phoneNumber;
    } else {
      print('Invalid phone number!');
    }
  }

  String getPhoneNumber() {
    return "+2$_phoneNumber";
  }

  String get  phoneNumber=> "+2$_phoneNumber";

  void sum(int num1, int num2) => num1 + num2;

  void setName(String name) {
    if (name.length >= 2) {
      _name = name;
    } else {
      print('Invalid name');
    }
  }

  String getName() {
    return _name;
  }

  void printUserData() {
    print('Name : $_name');
    print('Age : $age');
    print('Phone number : $_phoneNumber');
    print('Address : $address');
    print('- - - - - - - - - - ');
  }
}


class Test{

  final int video;

  Test(this.video);

  Test.n(this.video);

}