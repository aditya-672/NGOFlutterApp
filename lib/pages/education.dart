import 'package:flutter/material.dart';
import '../pages/drawer.dart';

class Educationpage extends StatelessWidget {
  const Educationpage({super.key});
  static const routeName = "Education";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(130, 66, 66, 66),
      appBar: AppBar(
        title: const Text("Education for Street Children"),
        backgroundColor: Colors.purple,
      ),
      drawer: const AppDra(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Card(
                elevation: 10,
                child: Image.asset("assets/child.png"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              child: Column(
                children: const [
                  Text(
                    '"सेवा परमो धर्मः" (Service is the supreme religion) is the only motto of WeRiseByLiftingOthers ngo. \n\nOur Ngo for Street Children works with passion so that every child gets what they truly deserves, a solid start in life, quality education and protection from harm. \n\nOur campaigns have been a greater help to reduce infant mortality, chronic malnutrition , and increased access to primary and secondary education. \n\nThe primary goal of our Ngo is to empower children on the street so that they have a chance of a better quality of life.,',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      // wordSpacing: 4,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 8,
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
