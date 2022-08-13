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

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<ContactsCubit, ContactsStates>(
      buildWhen: (previous, current) => current is GetFavoritesState,
      builder: (context, state) {
        return ListView.builder(
          itemCount: context.read<ContactsCubit>().favorites.length,
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
                          context.read<ContactsCubit>().favorites[index]
                              ['name'],
                          style: TextStyle(fontSize: 33),
                        ),
                        Text(
                          context.read<ContactsCubit>().favorites[index]
                              ['phone'],
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                  MyCircleIconButton(
                    icon: Icons.favorite,
                    color: Colors.blue,
                    onPressed: () {
                      context.read<ContactsCubit>().updateContact(
                        favorite: context
                            .read<ContactsCubit>()
                            .favorites[index]['favorite'] == 0 ? 1 : 0,
                        id: context.read<ContactsCubit>().favorites[index]
                        ['id'],
                      );
                    },
                  ),
                ],
              ),
            );
          },
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
