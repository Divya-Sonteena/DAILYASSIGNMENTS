import 'package:flutter/material.dart';
void main() {
  runApp(
    const MaterialApp(
      home: AlertBottomSheetAssignment(),
    ),
  );
}
class AlertBottomSheetAssignment extends StatelessWidget {
  const AlertBottomSheetAssignment({super.key});
  // Alert Dialog
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Delete"),
          content: const Text(
            "Are you sure you want to delete this file?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("File Deleted Successfully"),
                  ),
                );
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }
  // Bottom Sheet
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "New Contact",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Contact Saved Successfully"),
                    ),
                  );
                },
                icon: const Icon(Icons.person_add),
                label: const Text("Add to Contacts"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert & Bottom Sheet"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _showAlertDialog(context),
              child: const Text("Show Alert Dialog"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showBottomSheet(context),
              child: const Text("Show Bottom Sheet"),
            ),
          ],
        ),
      ),
    );
  }
}