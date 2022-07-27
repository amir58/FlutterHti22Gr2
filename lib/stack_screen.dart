import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  width: 300,
                  height: 300,
                  color: Colors.black,
                ),
                Container(
                  width: 250,
                  height: 250,
                  color: Colors.red,
                ),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.green,
                ),
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/4/4a/Mohamed_Salah_2018.jpg"),
            ),
            const SizedBox(height: 20),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/4/4a/Mohamed_Salah_2018.jpg"),
                ),
                CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.green,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
