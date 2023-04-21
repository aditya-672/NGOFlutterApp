import 'package:flutter/material.dart';
import '../pages/drawer.dart';

class Blog extends StatelessWidget {
  const Blog({super.key});
  static const routeName = 'blogpage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(130, 66, 66, 66),
      appBar: AppBar(
        title: const Text('Blog and Posts'),
        backgroundColor: Colors.purple,
      ),
      drawer: const AppDra(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Text(
                "Recent Posts :",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 22,
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Card(
                      elevation: 4,
                      child: Image.asset(
                        "assets/1.jpeg",
                        height: 300,
                        width: 300,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 4,
                      child: Image.asset(
                        "assets/2.jpeg",
                        height: 300,
                        width: 300,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 4,
                      child: Image.asset(
                        "assets/2.jpeg",
                        height: 300,
                        width: 300,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 4,
                      child: Image.asset(
                        "assets/2.jpeg",
                        height: 300,
                        width: 300,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 4,
                      child: Image.asset(
                        "assets/2.jpeg",
                        height: 300,
                        width: 300,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 4,
                      child: Image.asset(
                        "assets/2.jpeg",
                        height: 300,
                        width: 300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
