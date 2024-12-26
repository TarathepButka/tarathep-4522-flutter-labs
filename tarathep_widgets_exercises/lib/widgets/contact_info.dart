import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  final String addrName;
  final String addrInfo;
  final String email;
  final String phone;

  const ContactInfo(
      {super.key,
      required this.addrName,
      required this.addrInfo,
      required this.email,
      required this.phone});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(
              addrName,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(addrInfo),
            leading: const Icon(
              Icons.location_on,
              color: Colors.black,
            ),
          ),
          const Divider(),
          ListTile(
            title: Text(
              phone,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            leading: const Icon(Icons.contact_phone, color: Colors.black),
          ),
          ListTile(
            title: Text(
              email,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            leading: const Icon(Icons.contact_mail, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
