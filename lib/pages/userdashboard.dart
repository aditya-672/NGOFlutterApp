import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../pages/dogs.dart';
import '../pages/drawer.dart';
import '../pages/education.dart';
import '../pages/loginpage.dart';
import '../pages/volunteerform.dart';

class UserDashboard extends StatefulWidget {
  static const routeName = 'userdashboard';

  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      drawer: const AppDra(),
      appBar: AppBar(
        title: const FittedBox(
          child: Text(
            'We Rise By Lifting Others',
            style: TextStyle(
              // color: Colors.black,
              fontSize: 30,
            ),
          ),
        ),
        backgroundColor: Colors.purple,
        actions: [
          DropdownButton(
            itemHeight: 60,
            underline: const SizedBox(),
            onChanged: (value) {
              if (value == 'logout') {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
              }
            },
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
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
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(45),
            //   child: Card(
            //     margin:
            //         const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            //     elevation: 4,
            //     shadowColor: Colors.pink.shade900,
            //     child: Image.asset(
            //       'assets/logo.jpeg',
            //       width: 350,
            //     ),
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: CircleAvatar(
                radius: 160,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.asset(
                    "assets/logo.jpeg",
                    height: 750,
                    width: 750,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Text(
                ' "There is no exercise better for the heart than reaching down and lifting people up" ',
                style: TextStyle(
                  color: Color.fromARGB(255, 194, 0, 197),
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  wordSpacing: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Card(
              color: Colors.yellow.shade100,
              shadowColor: Colors.white,
              elevation: 5,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/clothes.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(Educationpage.routeName);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        //color: Colors.purple,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Education For Street Children",
                              style: TextStyle(
                                color: Colors.pink.shade800,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Tap to Know more",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 13.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              color: Colors.yellow.shade100,
              shadowColor: Colors.white,
              elevation: 4,
              child: Row(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/dog.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(DogsPage.routeName);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        //color: Colors.purple,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rescuing Dogs",
                              style: TextStyle(
                                color: Colors.pink.shade800,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Tap to Know more",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 13.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 240,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(VolunteerForm.routeName);
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.white10,
                    ),
                    shadowColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 191, 0, 224))),
                child: Row(
                  children: const [
                    Icon(Icons.add_circle, color: Colors.white70),
                    SizedBox(
                      width: 9,
                    ),
                    Text(
                      'Register As Volunteer',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
