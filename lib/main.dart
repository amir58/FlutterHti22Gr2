import 'package:flutter/material.dart';
import 'package:untitled/assets.dart';
import 'package:untitled/bmi/bmi_screen.dart';
import 'package:untitled/contacts/contacts_main_screen.dart';
import 'package:untitled/login_screen.dart';
import 'package:untitled/messenger.dart';
import 'package:untitled/second_screen.dart';
import 'package:untitled/stack_screen.dart';
import 'package:untitled/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactsMainScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  CounterScreen({Key? key}) : super(key: key);

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          print('FloatingActionButton pressed');
          counter++;
          print(counter);
        },
      ),
      body:  Center(
        child: Text(
          "Counter : $counter",
          style: const TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.bold,
            // color: Colors.green
          ),
        ),
      ),
    );
  }
}
