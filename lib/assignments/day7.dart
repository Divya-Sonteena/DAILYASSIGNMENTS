import 'package:flutter/material.dart';
import 'package:demo/services/read_json.dart';
class jsondata extends StatefulWidget {
  const jsondata({super.key});
  @override
  State<jsondata> createState() => _jsondataState();
}
class _jsondataState extends State<jsondata>{
  List<dynamic>jsondata =[];
  @override
  void initState() {
    super.initState();
    loadData();
  }
  Future<void> loadData() async {
    final response = await ReadJsonFile.readJson(
      path: 'assets/data.json',
    );

    jsondata = response["data"];

    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Details"),
      ),

      body: ListView.builder(
        itemCount: jsondata.length,

        itemBuilder: (context, index) {

          final employee = jsondata[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(employee["name"]),
              subtitle: Text(
                "ID : ${employee["employeeId"]}\n"
                    "Designation : ${employee["designation"]}\n"
                    "Department : ${employee["department"]}\n"
                    "Email : ${employee["email"]}",
              ),
            ),
          );
        },
      ),
    );
  }
}

