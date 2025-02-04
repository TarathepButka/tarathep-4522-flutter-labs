import 'package:flutter/material.dart';
import 'package:tarathep_async_exercises/widgets/rating_shared.dart';
import 'package:tarathep_widgets_exercises/config/theme.dart';
import 'package:tarathep_widgets_exercises/models/contact.dart';
import 'package:tarathep_widgets_exercises/utils/responsive.dart';
import 'package:tarathep_widgets_exercises/widgets/contact_image_res.dart';
import 'package:tarathep_widgets_exercises/widgets/contact_info_res.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileCardState();

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

class _ProfileCardState extends State<ProfileCard> {
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
      appBar: Responsive.isMobile(context)
          ? AppBar(
              title: Text(
                "My Favorite Celeb",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              backgroundColor: Colors.black,
            )
          : null,
      backgroundColor: AppTheme.backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (Responsive.isMobile(context)) {
            return widget._buildMobileLayout(context, contact);
          } else {
            return widget._buildWideLayout(context, contact);
          }
        },
      ),
    );
  }
}
