import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        // color: Colors.green,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            const Text(
              "HelloWorld",
              style: TextStyle(fontSize: 33,backgroundColor: Colors.blue),
            ),
            const Text(
              "HelloWorld 2",
              style: TextStyle(fontSize: 33),
            ),
            Container(
              color: Colors.green,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Text(
                      "HelloWorld 3",
                      style: TextStyle(fontSize: 33),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "HelloWorld 4",
                      style: TextStyle(fontSize: 33, color: Colors.white,),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Hello Flutter",
                      style: TextStyle(fontSize: 33),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
