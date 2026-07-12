//Day:4
import 'package:flutter/material.dart';
class Datatypes extends StatelessWidget {
  const Datatypes({super.key});

  // 1. Global method accepting parameters
  double globalCalculateAverage(int value, int v1, int v2) {
    if (value >= 10) {
      return (value + v1 + v2) / 3.0;
    }
    return 0.0;
  }

  // 2. Simple DialogBox that calls the global calculation method
  void _showVariablesDialog(BuildContext context) {
    int value = 10;
    int v1 = 30;
    int v2 = 40;
    double average = globalCalculateAverage(value, v1, v2);
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text("Variables Calculation"),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            child: Text(
              "Inputs: $value, $v1, $v2\n \nAverage Value: $average",
              style: const TextStyle(fontSize: 16),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
  // 3. Dialog showing variable values along with their actual types
  void _showDataTypesDialog(BuildContext context) {
    int age = 30;
    String name = "Divya";
    bool isOpen = true;
    dynamic firstName = "Divya";
    firstName = 30;
    name = "EMP1";
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Evaluated Data Types'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Value: $age \nType: ${age.runtimeType}"),
            const Divider(),
            Text("Value: \"$name\" \nType: ${name.runtimeType}"),
            const Divider(),
            Text("Value: $isOpen \nType: ${isOpen.runtimeType}"),
            const Divider(),
            Text("Value: $firstName \nType: ${firstName.runtimeType} (dynamic)"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 4: Dart Datatypes'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton.icon(
                onPressed: () => _showVariablesDialog(context),
                icon: const Icon(Icons.calculate),
                label: const Text('Run Average Calculation'),
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => _showDataTypesDialog(context),
                icon: const Icon(Icons.code),
                label: const Text('Check Runtime Datatypes'),
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
