import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:eventmanagementapp/pages/blog.dart';
import 'package:eventmanagementapp/pages/dogs.dart';
import 'package:eventmanagementapp/pages/donationpage.dart';
import 'package:eventmanagementapp/pages/education.dart';
import 'package:eventmanagementapp/pages/loginpage.dart';
import 'package:eventmanagementapp/pages/userdashboard.dart';
import 'package:eventmanagementapp/pages/volunteerform.dart';
import 'package:eventmanagementapp/pages/volunteerpages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const UserDashboard();
          }
          return const LoginPage();
        },
      ),
      routes: {
        UserDashboard.routeName: (_) => const UserDashboard(),
        LoginPage.routeName:(_) => const LoginPage(),
        DonationPage.routeName: (_) => const DonationPage(),
        Educationpage.routeName: (_) => const Educationpage(),
        DogsPage.routeName: (_) => const DogsPage(),
        VolunteerForm.routeName:(_) => const VolunteerForm(),
        VolunteerPage.routeName:(context) => const VolunteerPage(),
        Blog.routeName: (_) => const Blog(),
      },
    );
  }
}
