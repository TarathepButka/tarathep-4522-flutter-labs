import 'package:flutter/material.dart';
import '../widgets/contact_image.dart';
import '../widgets/contact_info.dart';
import '../widgets/rating.dart';

class ProfileCardRating extends StatelessWidget {
  const ProfileCardRating({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: const Color.fromARGB(255, 85, 115, 214),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ContactImage(
            imageFile: "assets/jeff.jpg",
            name: "Jeff Satur",
          ),
          ContactInfo(
            addrName: "Studio_on_saturn",
            addrInfo: "Bangkok, Thailand, 10250",
            email: "jeffsatur@yahoo.com",
            phone: "062-828-2997",
          ),
          Ratings(
            defaultColor: Colors.black,
            ratingColor: Color.fromARGB(255, 194, 186, 120),
          ),
        ],
      ),
    );
  }
}
