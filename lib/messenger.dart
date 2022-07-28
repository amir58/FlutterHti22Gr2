import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          children: [
            buildCustomAppBar(),
            buildSearchItem(),
            buildStoriesRow(),
          ],
        ),
      )),
    );
  }

  Widget buildCustomAppBar() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 22,
          backgroundImage: NetworkImage(
              "https://upload.wikimedia.org/wikipedia/commons/4/4a/Mohamed_Salah_2018.jpg"),
        ),
        const SizedBox(width: 10),
        const Text(
          "Chats",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        buildTopIconButton(Icons.camera_alt_rounded),
        const SizedBox(width: 10),
        buildTopIconButton(Icons.edit),
      ],
    );
  }

  Widget buildTopIconButton(IconData icon) {
    return CircleAvatar(
      backgroundColor: Colors.grey[300],
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget buildSearchItem() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextFormField(
        textInputAction: TextInputAction.search,
        decoration: const InputDecoration(
            hintText: "Search",
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }

  Widget buildStoriesRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: const [
              CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/4/4a/Mohamed_Salah_2018.jpg"),
              ),
              CircleAvatar(
                radius: 9,
                backgroundColor: Colors.white,
              ),
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.add,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          buildStoryItem(),
          buildStoryItem(),
          buildStoryItem(),
          buildStoryItem(),
          buildStoryItem(),
          buildStoryItem(),
          buildStoryItem(),
          buildStoryItem(),
          buildStoryItem(),
          buildStoryItem(),
          buildStoryItem(),
        ],
      ),
    );
  }

  Widget buildStoryItem() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: const [
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 22,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
          ),
          CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(
                "https://upload.wikimedia.org/wikipedia/commons/4/4a/Mohamed_Salah_2018.jpg"),
          ),
        ],
      ),
    );
  }
}
