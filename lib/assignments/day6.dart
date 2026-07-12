import 'package:flutter/material.dart';
void main(){
  runApp(const MaterialApp(
  home: EmployeeData()
  ));
}
class EmployeeData extends StatefulWidget {
  const EmployeeData({super.key});
  @override
  State<EmployeeData> createState() => _EmployeeData();
}
List<Map<String, dynamic>> getEmployees() {
  return [
    {
      "name": "Divya",
      "id": "EMP001",
      "phone": 9495332221,
      "icon": Icons.person,
    },
    {
      "name": "Abhi",
      "id": "EMP002",
      "phone": 8562342499,
      "icon": Icons.engineering,
    },
    {
      "name": "Navya",
      "id": "EMP003",
      "phone": 8845333424,
      "icon": Icons.account_circle,
    },
    {
      "name": "Ravi",
      "id": "EMP004",
      "phone": 9125539989,
      "icon": Icons.work,
    },
    {
      "name": "Shalini",
      "id": "EMP005",
      "phone": 9876543210,
      "icon": Icons.business_center,
    },
  ];
}
class _EmployeeData extends State<EmployeeData> {

  List<Map<String, dynamic>> employees = getEmployees();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Details"),
      ),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(employees[index]["icon"]),
            title: Text(employees[index]["name"]),
            subtitle: Text(
              "ID: ${employees[index]["id"]}\nPhone: ${employees[index]["phone"]}",
            ),
          );
        },
      ),
    );
  }
}