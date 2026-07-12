import 'package:flutter/material.dart';

class UserProfileData {
  final String name;
  final int age;
  final String gender;
  final String profession;
  final String profilePicUrl;
  final String location;
  final int experienceYears;
  final List<String> skills;

  UserProfileData({
    required this.name,
    required this.age,
    required this.gender,
    required this.profession,
    required this.profilePicUrl,
    required this.location,
    required this.experienceYears,
    required this.skills,
  });
}

class UserProfilesList extends StatefulWidget {
  const UserProfilesList({super.key});

  @override
  State<UserProfilesList> createState() => _UserProfilesList();
}

class _UserProfilesList extends State<UserProfilesList> {
  final ScrollController _scrollController = ScrollController();
  List<UserProfileData> profiles = [
    UserProfileData(
      name: 'Divya',
      age: 20,
      gender: 'Female',
      profession: 'Software Engineer',
      profilePicUrl: 'https://unsplash.com',
      location: 'Hyderabad, India',
      experienceYears: 2,
      skills: ['Dart', 'Flutter'],
    ),
    UserProfileData(
      name: 'Ramya',
      age: 24,
      gender: 'Female',
      profession: 'UI/UX Designer',
      profilePicUrl: 'https://i.pravatar.cc/150?img=26',
      location: 'Bangalore, India',
      experienceYears: 4,
      skills: ['Figma'],
    ),
    UserProfileData(
      name: 'Sravan',
      age: 22,
      gender: 'Male',
      profession: 'Flutter Developer',
      profilePicUrl: 'https://plus.unsplash.com/premium_vector-1719858610096-bba4498e5fc1?w=352&dpr=2&h=367&auto=format&fit=crop&q=60&ixlib=rb-4.1.0',
      location: 'Chennai, India',
      experienceYears: 1,
      skills: [ 'REST APIs', 'Git'],
    ),
    UserProfileData(
      name: 'Amit',
      age: 26,
      gender: 'Male',
      profession: 'LEAD',
      profilePicUrl: 'https://images.unsplash.com/photo-1511367461989-f85a21fda167?q=80&w=1031&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      location: 'visakhapatnam, India',
      experienceYears: 6,
      skills: ['Architecture', 'CI/CD'],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profiles")),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final user = profiles[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(user.name[0]),
              ),
              title: Text(user.name),
              subtitle: Text('${user.profession} • Age: ${user.age}'),
            ),
          );
        },
      ),
    );
  }
}
