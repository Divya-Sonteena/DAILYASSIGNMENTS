import 'package:flutter/material.dart';
import 'assignments/day1.dart';
import 'assignments/day10.dart';
import 'assignments/day2.dart';
import 'assignments/day3.dart';
import 'assignments/day4.dart';
import 'assignments/day5.dart';
import 'assignments/day6.dart';
import 'assignments/day7.dart';
import 'assignments/day8.dart';
import 'assignments/day9.dart';
import 'assignments/day10.dart';
import 'assignments/day11.dart';
import 'assignments/day12.dart';
import 'assignments/day13_1.dart';
import 'assignments/day13_2.dart';
void main() {
  runApp(const MaterialApp(
    home: home_screen(),
  ));
}
class home_screen extends StatelessWidget {
  const home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Day wise Assignments List")),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _assignmentTile(context, "1. Scaffold UI", const Scaffoldassignment()),
          _assignmentTile(context, "2. Images and icons", const ImagesIconsAssignment()),
          _assignmentTile(context, "3. Registration Page", const Registrationpage()),
          _assignmentTile(context, "4. Datatypes", const Datatypes()),
          _assignmentTile(context, "5. List cards", const UserProfilesList()),
          _assignmentTile(context, "6. List using methods", const EmployeeData()),
          _assignmentTile(context, "7. Handling json data", const  jsondata()),
          _assignmentTile(context, "8. UserProfilesListScreen", const UserProfilesListScreen()),
          _assignmentTile(context, "9. StudentPortal", const StudentPortal()),
          _assignmentTile(context, "10.	AlertBottomSheetAssignment", const AlertBottomSheetAssignment()),
          _assignmentTile(context, "11. ApiException", const ApiException()),
          _assignmentTile(context, "12. operatorsAssignment", const operatorsAssignment()),
          _assignmentTile(context, "13_1.Two_classes Api", const EmployeeList()),
          _assignmentTile(context, "13_2.SortingandGrouping ", const  SortingGrouping()),

        ],
      ),
    );
  }

  Widget _assignmentTile(BuildContext context, String title, Widget targetPage) {
    return Card(
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => targetPage),
        ),
      ),
    );
  }
}
