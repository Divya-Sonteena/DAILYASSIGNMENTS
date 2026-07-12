import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: StudentPortal(),
  ));
}

class StudentPortal extends StatelessWidget {
  const StudentPortal({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Student Portal"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(icon: Icon(Icons.menu_book), text: "Courses"),
              Tab(icon: Icon(Icons.person), text: "Profile"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text(
                "Welcome Student",
                style: TextStyle(fontSize: 24),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Flutter"),
                  Text("Python"),
                  Text("Java"),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Name : Divya"),
                  Text("Course : Flutter"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}