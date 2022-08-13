import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/contacts/contacts_states.dart';
import 'package:untitled/widgets/my_circle_icon_button.dart';

import 'contacts_cubit.dart';

class MyContact {
  String name;
  String phone;

  MyContact(this.name, this.phone);
}

class ContactsScreen extends StatefulWidget {
  ContactsScreen({Key? key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ContactsCubit, ContactsStates>(
        buildWhen: (previous, current) => current is GetContactsState,
        builder: (context, state) {
          print('Contacts => $state');
          return ListView.builder(
            itemCount: context.read<ContactsCubit>().contacts.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.read<ContactsCubit>().contacts[index]
                                ['name'],
                            style: TextStyle(fontSize: 33),
                          ),
                          Text(
                            context.read<ContactsCubit>().contacts[index]
                                ['phone'],
                            style: TextStyle(fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                    MyCircleIconButton(
                      icon: context.read<ContactsCubit>().contacts[index]
                                  ['favorite'] ==
                              0
                          ? Icons.favorite_border
                          : Icons.favorite,
                      onPressed: () {
                        context.read<ContactsCubit>().updateContact(
                              favorite: context
                                  .read<ContactsCubit>()
                                  .contacts[index]['favorite'] == 0 ? 1 : 0,
                              id: context.read<ContactsCubit>().contacts[index]
                                  ['id'],
                            );
                      },
                    ),
                    const SizedBox(width: 10),
                    MyCircleIconButton(
                      icon: Icons.delete,
                      onPressed: () {
                        _showDeleteContactAlertDialog(index);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
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

  Future<void> _showDeleteContactAlertDialog(int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure to delete this contact ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                this.context.read<ContactsCubit>().deleteContact(
                    this.context.read<ContactsCubit>().contacts[index]['id']);

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
