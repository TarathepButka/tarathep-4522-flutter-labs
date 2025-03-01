import 'package:flutter/material.dart';
import '../model/contact.dart';
import '../service/contact_service.dart';

class ContactManager extends StatefulWidget {
  const ContactManager({super.key});

  @override
  State<ContactManager> createState() => _ContactManagerState();
}

class _ContactManagerState extends State<ContactManager> {
  final ContactService _contactService = ContactService();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  List<Contact> _contacts = [];

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  Future<void> _loadContacts() async {
    try {
      final contacts = await _contactService.loadContacts();
      setState(() {
        _contacts = contacts;
      });
    } catch (e) {
      _showSnackBar(e.toString());
    }
  }

  Future<void> _saveContacts() async {
    try {
      await _contactService.saveContacts(_contacts);
    } catch (e) {
      _showSnackBar(e.toString());
    }
  }

  void _addContact() {
    if (_formKey.currentState!.validate()) {
      final newContact = Contact(
        name: _nameController.text,
        phone: _phoneController.text,
        email: _emailController.text,
      );

      setState(() {
        _contacts.add(newContact);
      });

      _saveContacts();

      _nameController.clear();
      _phoneController.clear();
      _emailController.clear();

      _showSnackBar('Contact added successfully!');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Manager'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a name.' : null,
                  ),
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(labelText: 'Phone'),
                    keyboardType: TextInputType.phone,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a phone number.' : null,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter an email.' : null,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _addContact,
                    child: const Text(
                      'Save Contact',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: _contacts.isEmpty
                ? const Center(child: Text('No contacts found'))
                : ListView.builder(
                    itemCount: _contacts.length,
                    itemBuilder: (context, index) {
                      final contact = _contacts[index];
                      return SizedBox(
                        child: Container(
                          padding: EdgeInsets.only(left: 24, bottom: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                contact.name,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Text('${contact.phone}\n${contact.email}',
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
