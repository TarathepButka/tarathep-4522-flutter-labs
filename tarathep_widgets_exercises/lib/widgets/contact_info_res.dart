import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../models/contact.dart';

class ContactInfoRes extends StatelessWidget {
  final Contact contact;

  const ContactInfoRes(
      {super.key,
      required this.contact});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(AppTheme.cardPadding),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildInfoTile(
              icon: Icons.apartment,
              title: contact.addrName,
              subtitle: contact.addrInfo,
            ),
            const Divider(),
            _buildInfoTile(
              icon: Icons.contact_phone,
              title: contact.phone,
            ),
            _buildInfoTile(
              icon: Icons.contact_mail,
              title: contact.email,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    String? subtitle,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.primaryColor),
      title: Text(title, style: AppTheme.titleStyle),
      subtitle: subtitle != null ? Text(subtitle) : null,
    );
  }
}
