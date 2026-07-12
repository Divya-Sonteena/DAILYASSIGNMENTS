import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: SortingGrouping(),
    ),
  );
}

class SortingGrouping extends StatelessWidget {
  const SortingGrouping({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> employees = [
      {
        "name": "Divya",
        "department": "Flutter",
        "salary": 45000,
      },
      {
        "name": "Rahul",
        "department": "QA",
        "salary": 35000,
      },
      {
        "name": "Arjun",
        "department": "Flutter",
        "salary": 52000,
      },
      {
        "name": "Sneha",
        "department": "UI/UX",
        "salary": 40000,
      },
      {
        "name": "Kiran",
        "department": "QA",
        "salary": 30000,
      },
    ];

    // Sorting by Salary (Ascending)
    employees.sort(
          (a, b) => a["salary"].compareTo(b["salary"]),
    );

    // Grouping by Department
    Map<String, List<Map<String, dynamic>>> grouped = {};

    for (var employee in employees) {
      String department = employee["department"];

      grouped.putIfAbsent(department, () => []);

      grouped[department]!.add(employee);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sorting & Grouping"),
      ),
      body: ListView(
        children: grouped.entries.map((entry) {
          return ExpansionTile(
            title: Text(
              entry.key,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            children: entry.value.map((employee) {
              return ListTile(
                title: Text(employee["name"]),
                subtitle: Text(
                  "Salary : ₹${employee["salary"]}",
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}