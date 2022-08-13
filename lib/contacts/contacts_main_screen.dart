import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/contacts/contacts_cubit.dart';
import 'package:untitled/contacts/contacts_screen.dart';
import 'package:untitled/contacts/favorites_screen.dart';
import 'package:untitled/utils/navigator.dart';

class ContactsMainScreen extends StatefulWidget {
  const ContactsMainScreen({Key? key}) : super(key: key);

  @override
  State<ContactsMainScreen> createState() => _ContactsMainScreenState();
}

class _ContactsMainScreenState extends State<ContactsMainScreen> {
  // database

  // database

  int index = 0;

  List<String> titles = ["Contacts", "Favorites"];

  List<Widget> screens = [ContactsScreen(), FavoritesScreen()];

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ContactsCubit>().createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(titles[index]),
      ),
      floatingActionButton: Visibility(
        visible: index == 0,
        child: FloatingActionButton(
          onPressed: () {
            // showDefaultBottomSheet();
            showScaffoldBottomSheet();
          },
          child: const Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          index = value;
          setState(() {});
        },
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: "Contacts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
        ],
      ),
      body: screens[index],
    );
  }

  void showDefaultBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void showScaffoldBottomSheet() {
    scaffoldKey.currentState?.showBottomSheet((context) {
      return Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Name required";
                  }

                  if (value.length == 1) {
                    return "Name not valid";
                  }

                  return null;
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    hintText: "Contact Name",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: phoneController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Phone required";
                  }

                  if (value.length < 11) {
                    return "Phone not valid";
                  }

                  return null;
                },
                maxLength: 11,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    hintText: "Contact Phone",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone)),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      String name = nameController.text;

                      String phone = phoneController.text;

                      context.read<ContactsCubit>().insertContact(
                            contactName: name,
                            contactPhone: phone,
                          );

                      nameController.clear();
                      phoneController.clear();

                      Navigator.pop(context);
                    }
                  },
                  child: Text("Save"),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
