import 'package:flutter/material.dart';
import '../data_models/faculty_data_model.dart';

class FacultyDetailsScreen extends StatelessWidget {
  final FacultyDataModel facultyDataModel;

  const FacultyDetailsScreen({super.key, required this.facultyDataModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(facultyDataModel.engName),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50.0, bottom: 30.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Text(
                facultyDataModel.webUrl,
                style: const TextStyle(fontSize: 18.0, color: Colors.red),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              facultyDataModel.thaiName,
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink[500]),
            ),
            Container(
              margin: const EdgeInsets.only(top: 80.0),
              child: Image.asset(facultyDataModel.imagePath),
            )
          ],
        ),
      ),
    );
  }
}
