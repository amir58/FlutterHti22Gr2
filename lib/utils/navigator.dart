import 'package:flutter/material.dart';

void go(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

void back(BuildContext context){
  Navigator.pop(context);
}
