import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
      fontSize: 33,
      color: Colors.green,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              // 3/6
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.black,
                  child: Text("First", style: textStyle),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: Text("Second", style: textStyle),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.red,
                  child: Text("Third", style: textStyle),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.black,
                  child: Row(
                    children: [
                      Text(
                        "Fourth",
                        style: textStyle,
                      ),
                      Expanded(
                          child: Text(
                        "Fifth Fifth Fifth ss",
                        style: textStyle,
                        maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
