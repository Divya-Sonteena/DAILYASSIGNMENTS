//Assignment:  Make an API call and bind the response to UI based on API response
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class UserProfilesListScreen extends StatefulWidget{
  const UserProfilesListScreen({super.key});
  @override
  State<UserProfilesListScreen >createState()=> _UserProfilesListScreen();

}
class _UserProfilesListScreen extends State<UserProfilesListScreen>{
  List<dynamic> profiles = [];
  @override
  void initState(){
    super.initState();
    fetchUsers(20);
  }
 Future<void> fetchUsers(int limit)async{

    final url = 'https://randomuser.me/api/?results=20';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      setState(() {
        profiles = json['results'];
      });
    }
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Users"),
      ),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final user = profiles[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                NetworkImage(user['picture']['medium']),
              ),
              title: Text(
                "${user['name']['first']} ${user['name']['last']}",
              ),
              subtitle: Text(
                "Age: ${user['dob']['age']}\n"
                    "Gender: ${user['gender']}",
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => fetchUsers(20),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}