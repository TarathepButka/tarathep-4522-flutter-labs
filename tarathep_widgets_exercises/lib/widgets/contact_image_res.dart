import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../config/theme.dart';
import '../utils/responsive.dart';

class ContactImageRes extends StatelessWidget {
  final Contact contact;

  const ContactImageRes({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = Responsive.getImageRadius(context);
        return Stack(
          alignment: const Alignment(0.6, 0.6),
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(contact.imageFile),
              radius: radius,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: AppTheme.overlayColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                contact.name,
                style: AppTheme.nameStyle,
              ),
            ),
          ],
        );
      },
    );
  }
}
