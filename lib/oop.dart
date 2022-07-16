import 'dart:io';

import 'package:flutter/material.dart';

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
  User userOne = User("Ahmed","20","011","Cairo");

  User userTwo = User("Ali", "20","012","Alex");

  Text("Login Screen");

}

class User {
  String name = "";
  String age = "";
  String phoneNumber = "";
  String address = "";

  User(this.name, this.age, this.phoneNumber, this.address){
    printUserData();
  }


  void printUserData(){
    print('Name : $name');
    print('Age : $age');
    print('Phone number : $phoneNumber');
    print('Address : $address');
    print('- - - - - - - - - - ');
  }
}
