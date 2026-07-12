import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    const MaterialApp(
      home: ApiException(),
    ),
  );
}
class ApiException extends StatefulWidget {
  const ApiException({super.key});
  @override
  State<ApiException> createState() => _ApiExceptionState();
}
class _ApiExceptionState extends State<ApiException> {
  List users = [];
  bool isLoading = false;
  String errorMessage = "";
  Future<void> fetchUsers() async {
    setState(() {
      isLoading = true;
      errorMessage = "";
    });
    try {
      final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/users"),
      );

      if (response.statusCode == 200) {
        users = jsonDecode(response.body);
      } else {
        throw Exception(
          "Failed to load data. Status Code: ${response.statusCode}",
        );
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Exception Handling"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
          ? Center(
        child: Text(
          errorMessage,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 18,
          ),
        ),
      )
          : ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(users[index]["id"].toString()),
            ),
            title: Text(users[index]["name"]),
            subtitle: Text(users[index]["email"]),
          );
        },
      ),
    );
  }
}