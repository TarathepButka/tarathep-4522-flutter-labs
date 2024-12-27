import 'package:flutter/material.dart';
import '../data_models/faculty_data_model.dart';
import 'faculty_details_screen.dart';

class FacultyListScreen extends StatefulWidget {
  const FacultyListScreen({super.key});

  @override
  _FacultyListState createState() => _FacultyListState();
}

class _FacultyListState extends State<FacultyListScreen> {
  static List<String> facultyname = ['Engineering', 'Medicine', 'Architecture'];
  static List<String> facultythainame = [
    'วิศวกรรมศาสตร์',
    'แพทยศาสตร์',
    'สถาปัตยกรรมศาสตร์'
  ];
  static List<String> imagepath = [
    'assets/en.jpg',
    'assets/md.jpg',
    'assets/arch.jpg',
  ];
  static List url = [
    'https://www.en.kku.ac.th/web/',
    'https://md.kku.ac.th',
    'https://arch.kku.ac.th'
  ];

  final List<FacultyDataModel> facultyData = List.generate(
    facultyname.length,
    (index) => FacultyDataModel(
      facultythainame[index],
      facultyname[index],
      '${url[index]}',
      imagepath[index],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KKU Faculties'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: facultyData.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(facultyData[index].engName),
              leading: const Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FacultyDetailsScreen(
                      facultyDataModel: facultyData[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
