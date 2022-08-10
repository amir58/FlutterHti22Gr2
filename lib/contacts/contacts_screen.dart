import 'package:flutter/material.dart';
import 'package:untitled/widgets/my_circle_icon_button.dart';

class MyContact{
  String name;
  String phone;

  MyContact(this.name, this.phone);
}

class ContactsScreen extends StatelessWidget {
  ContactsScreen({Key? key}) : super(key: key);

  List<MyContact> contacts =[
    MyContact("Amir", "01116036522"),
    MyContact("Ali", "01116326522"),
    MyContact("Ahmed", "01116032146"),
    MyContact("Salah", "01239603777"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return  Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contacts[index].name,
                          style: TextStyle(fontSize: 33),
                        ),
                        Text(
                          contacts[index].phone,
                          style: TextStyle(fontSize: 22),
                        ),

                      ],
                    ),
                  ),
                  MyCircleIconButton(icon: Icons.favorite_border, onPressed: (){}),
                  const SizedBox(width: 10),
                  MyCircleIconButton(icon: Icons.delete, onPressed: (){}),
                ],
              ),
            );
          },
        ));
  }

  Widget buildChatItem() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
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
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Amir Mohammed",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3),
                Row(
                  children: const [
                    Text(
                      "How are you ?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text("12:45 pm"),
                  ],
                ),
              ],
            ),
          ),
          const Visibility(
            visible: true,
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 8,
            ),
          ),
        ],
      ),
    );
  }
}
