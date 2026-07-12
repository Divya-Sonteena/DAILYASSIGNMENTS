//Assignment: Write a program by using operators and loops from a json.
import 'package:flutter/material.dart';
class operatorsAssignment extends StatelessWidget {
  const operatorsAssignment({super.key});
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> employees = [
      {
        "employeeId": "EMP001",
        "name": "Divya",
        "department": "Flutter",
        "salary": 42000,
        "experience": 3,
        "attendance": 28,
      },
      {
        "employeeId": "EMP002",
        "name": "Rahul",
        "department": "QA",
        "salary": 35000,
        "experience": 1,
        "attendance": 24,
      },
      {
        "employeeId": "EMP003",
        "name": "Sneha",
        "department": "UI/UX",
        "salary": 50000,
        "experience": 5,
        "attendance": 30,
      },
      {
        "employeeId": "EMP004",
        "name": "Arjun",
        "department": "Backend",
        "salary": 28000,
        "experience": 2,
        "attendance": 18,
      },
    ];

    List<Map<String, dynamic>> processedEmployees = [];

    for (int i = 0; i < employees.length; i++) {
      var employee = employees[i];

      int salary = employee["salary"];
      int experience = employee["experience"];
      int attendance = employee["attendance"];

      // Arithmetic Operators
      int bonus = experience * 2000;
      int finalSalary = salary + bonus;

      // Conditional Operator
      String status =
      attendance >= 20 ? "Present" : "Low Attendance";

      // Decision Making
      String rating;

      if (experience >= 5) {
        rating = "Excellent";
      } else if (experience >= 3) {
        rating = "Good";
      } else if (experience >= 1) {
        rating = "Average";
      } else {
        rating = "Fresher";
      }

      // Logical Operator
      bool promotionEligible =
          experience >= 3 && attendance >= 20;

      processedEmployees.add({
        ...employee,
        "bonus": bonus,
        "finalSalary": finalSalary,
        "status": status,
        "rating": rating,
        "promotionEligible": promotionEligible,
      });
    }

    // forEach LOOP
    employees.forEach((employee) {
      debugPrint("Employee Name: ${employee["name"]}");
    });

    // DO-WHILE LOOP
    int i = 0;
    do {
      debugPrint("Employee ID: ${employees[i]["employeeId"]}");
      i++;
    } while (i < employees.length);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Details"),
      ),
      body: ListView.builder(
        itemCount: processedEmployees.length,
        itemBuilder: (context, index) {
          var employee = processedEmployees[index];

          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Employee ID : ${employee["employeeId"]}"),
                  Text("Name : ${employee["name"]}"),
                  Text("Department : ${employee["department"]}"),
                  Text("Salary : ₹${employee["salary"]}"),
                  Text("Experience : ${employee["experience"]} Years"),
                  Text("Attendance : ${employee["attendance"]} Days"),
                  Text("Bonus : ₹${employee["bonus"]}"),
                  Text("Final Salary : ₹${employee["finalSalary"]}"),
                  Text("Attendance Status : ${employee["status"]}"),
                  Text("Performance : ${employee["rating"]}"),
                  Text(
                    employee["promotionEligible"]
                        ? "Promotion Eligible"
                        : "Promotion Not Eligible",
                    style: TextStyle(
                      color: employee["promotionEligible"]
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: operatorsAssignment(),
    ),
  );
}
