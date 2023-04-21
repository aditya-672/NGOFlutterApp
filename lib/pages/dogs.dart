import 'package:flutter/material.dart';
import '../pages/drawer.dart';

class DogsPage extends StatelessWidget {
  const DogsPage({super.key});
  static const routeName = "DogsPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rescuing Dogs"),
        backgroundColor: Colors.purple,
      ),
       backgroundColor: const Color.fromARGB(130, 66, 66, 66),
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
                child: Image.asset(
                  "assets/doggo.jpg",
                ),
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
                    'Our NGO "WeRiseByLiftingOthers" has effortlessly dedicated ourshelves towards helping street dogs, eradicating rabies and control the street dog population in a humane and a scientific way. \n\nIf you\'re an animal lover, there\'s a lot you can do here.We have a dedicated Sunday first-aid programme where the volunteers are trained to treat strays for minor skin diseases and injuries. Apart from that, volunteers can head to their kennel and walk the dogs, feed them and even help give them a shower. \n\nScared of coming in contact with dogs? Well, you can help with sales of their merchandise, social media or help with multiple campaigns.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
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
