//Assignment:Create Two classes, In One class Place Api call and get the output and Pass the Values to Another Class.
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: EmployeeList(),
    ),
  );
}

class EmployeeList extends StatelessWidget {
  const EmployeeList({super.key});

  final List<Map<String, dynamic>> employees = const [
    {
      "id": "EMP001",
      "name": "Divya",
      "department": "Flutter",
      "salary": 45000,
    },
    {
      "id": "EMP002",
      "name": "Rahul",
      "department": "QA",
      "salary": 35000,
    },
    {
      "id": "EMP003",
      "name": "Sneha",
      "department": "UI/UX",
      "salary": 50000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee List"),
      ),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          var employee = employees[index];

          return ListTile(
            title: Text(employee["name"]),
            subtitle: Text(employee["department"]),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EmployeeDetails(
                    employee: employee,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class EmployeeDetails extends StatelessWidget {
  final Map<String, dynamic> employee;

  const EmployeeDetails({
    super.key,
    required this.employee,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ID : ${employee["id"]}"),
            Text("Name : ${employee["name"]}"),
            Text("Department : ${employee["department"]}"),
            Text("Salary : ₹${employee["salary"]}"),
          ],
        ),
      ),
    );
  }
}