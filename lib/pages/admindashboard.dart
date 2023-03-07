import 'package:eventmanagementapp/adminwidget/feeedbackform.dart';
import 'package:eventmanagementapp/adminwidget/formlist.dart';
import 'package:eventmanagementapp/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: const Text(
          'Admins Dashboard',
        ),
        actions: [
          DropdownButton(
            onChanged: (value) {
              if (value == 'logout') {
                FirebaseAuth.instance.signOut();
                // Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                fixedSize: const Size(300, 60),
                backgroundColor: Colors.indigo.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(FeedbackForm.routeName);
              },
              child: const Text(
                'Create New Feedback Form',
                style: TextStyle(
                  color: white,
                  fontSize: 18,
                ),
              ),
            ),
            const Divider(),
            Container(
              height: 300,
              child: Column(
                children: const [
                  Expanded(
                    child: FormList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
