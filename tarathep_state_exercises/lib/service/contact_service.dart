import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../model/contact.dart';

class ContactService {
  Future<File> get _contactsFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/contacts.json');
  }

  Future<List<Contact>> loadContacts() async {
    try {
      final file = await _contactsFile;
      if (!await file.exists()) return [];

      final content = await file.readAsString();
      final List<dynamic> jsonData = jsonDecode(content);

      return jsonData.map((data) => Contact.fromJson(data)).toList();
    } catch (e) {
      throw Exception('Error loading contacts: $e');
    }
  }

  Future<void> saveContacts(List<Contact> contacts) async {
    try {
      final file = await _contactsFile;
      final String jsonString = JsonEncoder.withIndent('  ')
          .convert(contacts.map((contact) => contact.toJson()).toList());
      await file.writeAsString(jsonString);
    } catch (e) {
      throw Exception('Error saving contacts: $e');
    }
  }
}
