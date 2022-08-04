import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  MessengerScreen({Key? key}) : super(key: key);

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
            Expanded(
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  return buildChatItem(index);
                },
              ),
            )
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

  List<ChatData> chats = [
    ChatData(
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/4/4a/Mohamed_Salah_2018.jpg",
      username: "Amir Mohammed",
      message: "Where are you ?",
      dateTime: "now",
      opened: false,
      online: true,
    ),
    ChatData(
      imageUrl: "https://ichef.bbci.co.uk/news/976/cpsprodpb/15E47/production/_124717698_gettyimages-1395200655.jpg",
      username: "Ali Ahmed",
      message: "I'm waiting you!",
      dateTime: "10m",
      opened: true,
      online: false,
    ),

  ];

  Widget buildChatItem(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children:  [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    chats[index].imageUrl),
              ),
              const CircleAvatar(
                radius: 9,
                backgroundColor: Colors.white,
              ),
              CircleAvatar(
                radius: 8,
                backgroundColor: chats[index].online ? Colors.green : Colors.red,
              ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  chats[index].username,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3),
                Row(
                  children:  [
                    Text(
                      chats[index].message,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(chats[index].dateTime),
                  ],
                ),
              ],
            ),
          ),
           Visibility(
            visible: chats[index].opened,
            child: const CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 8,
            ),
          ),
        ],
      ),
    );
  }
}

class ChatData {
  String imageUrl;
  String username;
  String message;
  String dateTime;
  bool opened;
  bool online;

  ChatData({
    required this.imageUrl,
    required this.username,
    required this.message,
    required this.dateTime,
    required this.opened,
    required this.online,
  });
}
