import 'package:cloud_firestore/cloud_firestore.dart';
import '../colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  static const routeName = 'userdashboard';

  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  User? user = FirebaseAuth.instance.currentUser;

  final userInfo = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: blue,
        title: Text('${user!.email}s Dashboard'),
        actions: [
          DropdownButton(
            onChanged: (value) {
              if (value == 'logout') {
                // Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
                FirebaseAuth.instance.signOut();
              }
            },
            icon: const Icon(Icons.more_vert),
            items: [
              DropdownMenuItem(
                value: 'logout',
                child: Row(
                  children: const [
                    Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    Text('Logout'),
                  ],
                ),
              )
            ],
          )
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: userInfo.doc(user!.uid).get(),
          builder: (context, snapshot) {
            // if (snapshot.connectionState == ConnectionState.done) {
            //   final userdata = snapshot.data!.data();
            //   return Text(userdata!['name'] as String);
            // }
            return const Text("KHILHI");
          },
        ),
      ),
    );
  }
}
