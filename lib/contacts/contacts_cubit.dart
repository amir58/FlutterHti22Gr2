import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/contacts/contacts_states.dart';

class ContactsCubit extends Cubit<ContactsStates> {
  ContactsCubit() : super(InitContactState());
  late Database _database;

  List<Map> contacts = [];
  List<Map> favorites = [];

  void createDatabase() async {
    // open the database
    openDatabase(
      "contactsDatabase",
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE Contacts (id INTEGER PRIMARY KEY, name TEXT, phone TEXT, favorite INTEGER)');
      },
      onOpen: (Database database) {
        _database = database;
        getContacts();
        getFavorites();
      },
    );
  }

  void insertContact({
    required String contactName,
    required String contactPhone,
  }) async {
    // Insert some records in a transaction
    await _database.transaction((txn) async {
      int id = await txn.rawInsert(
          'INSERT INTO Contacts(name, phone, favorite) VALUES("$contactName", "$contactPhone", 0)');
      print('inserted1: $id');
    });

    getContacts();
  }

  void getContacts() async {
    // Get the records
    contacts = await _database.rawQuery('SELECT * FROM Contacts');

    print(contacts);

    emit(GetContactsState());
  }

  void getFavorites() async {
    favorites = await _database.query(
      "Contacts",
      columns: ["id", "name", "phone", "favorite"],
      where: 'favorite = ?',
      whereArgs: [1],
    );

    emit(GetFavoritesState());
    // _database.rawQuery('SELECT * FROM Contacts').then(
    //   (value) {
    //     contacts = value;
    //     print(contacts);
    //   },
    // );
  }

  void deleteContact(int id) async {
    // Delete a record
    int count =
        await _database.rawDelete('DELETE FROM Contacts WHERE id = ?', [id]);
    assert(count == 1);

    getContacts();
  }

  void updateContact({
    required int favorite,
    required int id,
  }) async {
    // Update some record
    int count = await _database.rawUpdate(
        'UPDATE Contacts SET favorite = ? WHERE id = ?', [favorite, id]);

    print('updated: $count');

    getContacts();
    getFavorites();
  }
}
