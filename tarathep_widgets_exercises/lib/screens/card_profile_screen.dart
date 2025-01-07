import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../utils/responsive.dart';
import '../widgets/contact_image_res.dart';
import '../widgets/contact_info_res.dart';
import '../widgets/rating.dart';
import '../models/contact.dart';

class CardProfileScreen extends StatelessWidget {
  const CardProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const contact = Contact(
      name: "Jeff Satur",
      addrName: "Studio_on_saturn",
      addrInfo: "Bangkok, Thailand, 10250",
      email: "jeffsatur@yahoo.com",
      phone: "062-828-2997",
      imageFile: "assets/jeff.jpg",
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,
      ),
      backgroundColor: AppTheme.backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (Responsive.isMobile(context)) {
            return _buildMobileLayout(context, contact);
          } else {
            return _buildWideLayout(context, contact);
          }
        },
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, Contact contact) {
    return Container(
      padding: Responsive.getScreenPadding(context),
      color: AppTheme.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ContactImageRes(contact: contact),
          ContactInfoRes(contact: contact),
          const Ratings(
            defaultColor: Colors.black,
            ratingColor: Color.fromARGB(255, 194, 186, 120),
          ),
        ],
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context, Contact contact) {
    return SingleChildScrollView(
      padding: Responsive.getScreenPadding(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: ContactImageRes(contact: contact),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                ContactInfoRes(contact: contact),
                const SizedBox(height: 20),
                const Ratings(
                  defaultColor: Colors.black,
                  ratingColor: Color.fromARGB(255, 194, 186, 120),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
